import { MAX_STOPS, buildGoogleMapsUrl, insertByRoutePosition, moveItem } from "./itinerary.js";

const i18n=window.SmartNavigationI18n||{locale:"en",t:key=>key,localizeError:value=>value};
const {t,localizeError}=i18n;
const CATEGORY_LABELS=i18n.locale==="it"?{AREA:"Zone",BUILDING:"Edifici",MUSEUM:"Musei",ODDITY:"Curiosità",PARK:"Parchi",RELIGIOUS:"Luoghi religiosi",SHOPPING:"Shopping",VIEWPOINT:"Punti panoramici"}:{AREA:"Areas",BUILDING:"Buildings",MUSEUM:"Museums",ODDITY:"Oddities",PARK:"Parks",RELIGIOUS:"Religious",SHOPPING:"Shopping",VIEWPOINT:"Views"};
const STORAGE_KEY="london-advanced-smart-navigation-itinerary-v1";
const STORAGE_MAX_AGE=24*60*60*1000;
const state={places:[],placesById:new Map(),matches:[],selectedIds:[],customOrder:false,start:null,end:null,corridor:200,map:null,routeLayer:null,baseRoute:null,discoveryLine:null,poiLayer:null,startMarker:null,endMarker:null,pickMode:null,routeRevision:0};
const el=Object.fromEntries(["message","start-query","start-choice","end-query","end-choice","categories","route-button","route-summary","distance","duration","match-count","results-section","results-note","results-list","bikes-panel","bikes","itinerary","stop-count","itinerary-list","navigate","mobile-itinerary-bar","mobile-stop-count","mobile-duration","mobile-navigate"].map(id=>[id.replaceAll("-","_"),document.getElementById(id)]));

start();

async function start(){
  state.map=L.map("map",{preferCanvas:true}).setView([51.5074,-.1278],11);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png",{maxZoom:19,attribution:i18n.locale==="it"?"© collaboratori OpenStreetMap":"© OpenStreetMap contributors"}).addTo(state.map);
  if(i18n.locale==="it"){
    state.map.zoomControl._zoomInButton.setAttribute("title","Ingrandisci");state.map.zoomControl._zoomInButton.setAttribute("aria-label","Ingrandisci");
    state.map.zoomControl._zoomOutButton.setAttribute("title","Riduci");state.map.zoomControl._zoomOutButton.setAttribute("aria-label","Riduci");
  }
  state.poiLayer=L.layerGroup().addTo(state.map);
  state.map.on("click",event=>{
    if(!state.pickMode)return;
    const type=state.pickMode;
    const lat=Number(event.latlng.lat.toFixed(6));
    const lon=Number(event.latlng.lng.toFixed(6));
    setPoint(type,{lat,lon,label:i18n.locale==="it"?t("mapPoint",{lat:lat.toFixed(6),lon:lon.toFixed(6)}):`Map point ${lat.toFixed(6)}, ${lon.toFixed(6)}`});
    message(i18n.locale==="it"?t(type==="start"?"startSelectedOnMap":"destinationSelectedOnMap"):`${type==="start"?"Starting point":"Destination"} selected on the map.`);
  });
  bind();
  try{
    const payload=await api("/api/pois");
    state.places=payload.places;
    state.placesById=new Map(state.places.map(place=>[place.id,place]));
    renderCategories();
    const restored=restoreSavedItinerary();
    if(!restored)message(i18n.locale==="it"?t("placesLoaded",{count:payload.count.toLocaleString("it-IT")}):`${payload.count.toLocaleString("en-GB")} places loaded.`);
  }catch(error){message(localizeError(error.message),true)}
}

function bind(){
  document.querySelectorAll("[data-search]").forEach(button=>button.addEventListener("click",()=>search(button.dataset.search)));
  ["start","end"].forEach(type=>document.getElementById(`${type}-query`).addEventListener("keydown",event=>{if(event.key==="Enter"){event.preventDefault();search(type)}}));
  document.getElementById("corridor").addEventListener("click",event=>{const button=event.target.closest("button[data-value]");if(!button)return;state.corridor=Number(button.dataset.value);document.querySelectorAll("#corridor button").forEach(b=>b.classList.toggle("active",b===button));if(state.discoveryLine){calculateMatches();persistItinerary()}});
  document.getElementById("all-categories").addEventListener("click",()=>setCategories(true));
  document.getElementById("no-categories").addEventListener("click",()=>setCategories(false));
  document.getElementById("pick-start").addEventListener("click",()=>startMapPicking("start"));
  document.getElementById("pick-end").addEventListener("click",()=>startMapPicking("end"));
  document.getElementById("use-location").addEventListener("click",useCurrentLocation);
  el.route_button.addEventListener("click",()=>calculateBaseRoute({resetStops:true}));
  document.getElementById("reset").addEventListener("click",reset);
  document.getElementById("refresh-bikes").addEventListener("click",loadBikes);
}

function startMapPicking(type){
  if(state.pickMode===type){stopMapPicking();message(i18n.locale==="it"?t("mapSelectionCancelled"):"Map selection cancelled.");return}
  state.pickMode=type;
  state.map.getContainer().classList.add("picking-location");
  document.getElementById("pick-start").classList.toggle("active",type==="start");
  document.getElementById("pick-end").classList.toggle("active",type==="end");
  message(i18n.locale==="it"?t(type==="start"?"chooseStartOnMap":"chooseDestinationOnMap"):`Click the map to choose the ${type==="start"?"starting point":"destination"}.`);
  if(window.matchMedia("(max-width: 900px)").matches)state.map.getContainer().scrollIntoView({behavior:"smooth",block:"center"});
}

function stopMapPicking(){
  state.pickMode=null;
  state.map.getContainer().classList.remove("picking-location");
  document.getElementById("pick-start").classList.remove("active");
  document.getElementById("pick-end").classList.remove("active");
}

async function search(type){
  const input=document.getElementById(`${type}-query`);const query=input.value.trim();if(query.length<3){message(i18n.locale==="it"?t("enterAddress"):"Enter a London address, station or postcode.",true);return}
  message(i18n.locale==="it"?t("finding",{query}):`Finding ${query}…`);
  try{const payload=await api(`/api/geocode?q=${encodeURIComponent(query)}`);setPoint(type,payload.result);message(i18n.locale==="it"?t(type==="start"?"startSelected":"destinationSelected"):`${type==="start"?"Starting point":"Destination"} selected.`)}catch(error){message(localizeError(error.message),true)}
}

function useCurrentLocation(){
  if(!navigator.geolocation){message(t("locationUnavailable"),true);return}
  const button=document.getElementById("use-location");button.disabled=true;message(t("findingLocation"));
  navigator.geolocation.getCurrentPosition(position=>{
    button.disabled=false;
    const lat=Number(position.coords.latitude.toFixed(6));const lon=Number(position.coords.longitude.toFixed(6));
    if(lat<51.2||lat>51.8||lon<-.75||lon>.45){message(t("currentLocationOutsideLondon"),true);return}
    setPoint("start",{lat,lon,label:t("currentLocation")});message(t("currentLocationSelected"));
  },()=>{button.disabled=false;message(t("locationUnavailable"),true)},{enableHighAccuracy:true,timeout:10000,maximumAge:30000});
}

function setPoint(type,point,options={}){
  stopMapPicking();
  if(state.baseRoute&&!options.keepRoute)clearRouteResults();
  state[type]={lat:Number(point.lat),lon:Number(point.lon),label:shortLabel(point.label)};
  const markerKey=`${type}Marker`;if(state[markerKey])state.map.removeLayer(state[markerKey]);
  state[markerKey]=L.marker([point.lat,point.lon]).addTo(state.map).bindPopup(`${i18n.locale==="it"?t(type==="start"?"start":"destination"):(type==="start"?"Start":"Destination")}: ${escapeHtml(state[type].label)}`);
  const choice=el[`${type}_choice`];choice.textContent=state[type].label;choice.classList.add("selected");state.map.setView([point.lat,point.lon],14);el.route_button.disabled=!(state.start&&state.end);if(type==="start"&&!options.skipBikes)loadBikes();
}

async function calculateBaseRoute({resetStops=false,restoring=false}={}){
  if(!(state.start&&state.end))return;
  const revision=++state.routeRevision;
  if(resetStops){state.selectedIds=[];state.customOrder=false}
  el.route_button.disabled=true;message(i18n.locale==="it"?t("calculatingRoute"):"Calculating the walking route…");
  try{
    const payload=await api("/api/route",{method:"POST",body:JSON.stringify({start:state.start,end:state.end})});
    if(revision!==state.routeRevision)return;
    state.baseRoute=payload;state.discoveryLine=turf.lineString(payload.geometry.coordinates);drawRoute(payload);calculateMatches();renderItinerary();persistItinerary();
    if(state.selectedIds.length)await refreshItineraryRoute({restoring});else message(i18n.locale==="it"?t("routeReady"):"Route ready.");
  }catch(error){if(revision===state.routeRevision)message(localizeError(error.message),true)}finally{el.route_button.disabled=!(state.start&&state.end)}
}

function drawRoute(route){
  if(state.routeLayer)state.map.removeLayer(state.routeLayer);
  state.routeLayer=L.geoJSON({type:"Feature",geometry:route.geometry,properties:{}},{style:{color:"#2e7772",weight:6,opacity:.9}}).addTo(state.map);
  state.map.fitBounds(state.routeLayer.getBounds().pad(.08));
  el.distance.textContent=formatDistance(route.distanceMetres);el.duration.textContent=formatDuration(route.durationSeconds);el.route_summary.hidden=false;
}

function calculateMatches(){
  const categories=new Set([...document.querySelectorAll("#categories input:checked")].map(input=>input.value));const matches=[];
  for(const place of state.places){if(!categories.has(place.category))continue;const point=turf.point([place.lon,place.lat]);const metres=turf.pointToLineDistance(point,state.discoveryLine,{units:"kilometers"})*1000;if(metres>state.corridor)continue;const snapped=turf.nearestPointOnLine(state.discoveryLine,point,{units:"kilometers"});matches.push({...place,distanceFromRoute:Math.round(metres),routePosition:Number(snapped.properties?.location||0)})}
  matches.sort((a,b)=>a.routePosition-b.routePosition||a.name.localeCompare(b.name));state.matches=matches;
  for(const match of matches)state.placesById.set(match.id,match);
  renderMatchViews();
}

function renderMatchViews(){
  state.poiLayer.clearLayers();el.match_count.textContent=String(state.matches.length);el.results_note.textContent=i18n.locale==="it"?t("withinRoute",{distance:state.corridor}):`Within ${state.corridor} m of the route`;el.results_list.replaceChildren(...state.matches.map(card));el.results_section.hidden=false;
  for(const place of state.matches){
    const selectedIndex=state.selectedIds.indexOf(place.id);const selected=selectedIndex!==-1;
    const icon=L.divIcon({className:"poi-div",html:`<span class="poi-marker${selected?" selected":""}">${selected?selectedIndex+1:escapeHtml(place.id.charAt(0))}</span>`,iconSize:[27,27],iconAnchor:[13,13]});
    const marker=L.marker([place.lat,place.lon],{icon}).addTo(state.poiLayer).bindPopup(popupContent(place));marker.options.placeId=place.id;
  }
}

function popupContent(place){
  const wrapper=document.createElement("div");const title=document.createElement("h3");title.textContent=place.name;const copy=document.createElement("p");copy.textContent=place.description||place.hook||t("fallbackPlace");const button=document.createElement("button");const selected=state.selectedIds.includes(place.id);button.type="button";button.className=`popup-add-stop${selected?" selected":""}`;button.textContent=selected?t("removeFromWalk"):t("addToWalk");button.addEventListener("click",()=>toggleStop(place));wrapper.append(title,copy,button);return wrapper;
}

function card(place){
  const selected=state.selectedIds.includes(place.id);const article=document.createElement("article");article.className=`place-card${selected?" selected-stop":""}`;const copy=place.description||place.hook||(i18n.locale==="it"?t("fallbackPlace"):"A place from the London Advanced collection.");
  article.innerHTML=`<header><h3>${escapeHtml(place.name)}</h3><span class="distance">${place.distanceFromRoute} m</span></header><p>${escapeHtml(truncate(copy,190))}</p><div class="tags"><span>${escapeHtml(CATEGORY_LABELS[place.category]||place.category)}</span>${place.price?`<span>${escapeHtml(place.price)}</span>`:""}${place.visitMinutes?`<span>${place.visitMinutes} min</span>`:""}</div><div class="actions"><button class="add-stop${selected?" selected":""}">${selected?escapeHtml(t("removeFromWalk")):escapeHtml(t("addToWalk"))}</button><button class="show-map">${i18n.locale==="it"?t("showOnMap"):"Show on map"}</button><a href="${escapeAttr(place.mapUrl)}" target="_blank" rel="noreferrer">Google Maps ↗</a>${place.officialUrl?`<a href="${escapeAttr(place.officialUrl)}" target="_blank" rel="noreferrer">${i18n.locale==="it"?t("info"):"Info ↗"}</a>`:""}</div>`;
  article.querySelector(".add-stop").addEventListener("click",()=>toggleStop(place));article.querySelector(".show-map").addEventListener("click",()=>{state.map.setView([place.lat,place.lon],16);state.poiLayer.eachLayer(layer=>{if(layer.options.placeId===place.id)layer.openPopup()})});return article;
}

async function toggleStop(place){
  const selected=state.selectedIds.includes(place.id);
  if(selected){state.selectedIds=state.selectedIds.filter(id=>id!==place.id);if(!state.selectedIds.length)state.customOrder=false}
  else{
    if(state.selectedIds.length>=MAX_STOPS){message(t("stopLimit",{max:MAX_STOPS}),true);return}
    state.selectedIds=state.customOrder?[...state.selectedIds,place.id]:insertByRoutePosition(state.selectedIds,place,state.placesById);
  }
  renderMatchViews();renderItinerary();persistItinerary();await refreshItineraryRoute();
}

async function moveStop(index,offset){
  state.selectedIds=moveItem(state.selectedIds,index,offset);state.customOrder=true;renderMatchViews();renderItinerary();persistItinerary();await refreshItineraryRoute();
}

async function refreshItineraryRoute({restoring=false}={}){
  const revision=++state.routeRevision;
  if(!state.selectedIds.length){if(state.baseRoute)drawRoute(state.baseRoute);renderItinerary();if(!restoring)message(i18n.locale==="it"?t("routeReady"):"Route ready.");return}
  const via=state.selectedIds.map(id=>state.placesById.get(id)).filter(Boolean).map(place=>({id:place.id,lat:place.lat,lon:place.lon}));
  message(t("updatingItinerary"));
  try{
    const payload=await api("/api/route",{method:"POST",body:JSON.stringify({start:state.start,via,end:state.end})});
    if(revision!==state.routeRevision)return;drawRoute(payload);renderItinerary();persistItinerary();message(t("itineraryReady",{count:via.length}));
  }catch(error){if(revision===state.routeRevision)message(localizeError(error.message),true)}
}

function renderItinerary(){
  const ready=Boolean(state.baseRoute&&state.start&&state.end);el.itinerary.hidden=!ready;
  if(!ready)return;
  const selected=state.selectedIds.map(id=>state.placesById.get(id)).filter(Boolean);const showMobileBar=selected.length>0;el.mobile_itinerary_bar.hidden=!showMobileBar;document.body.classList.toggle("has-itinerary",showMobileBar);el.stop_count.textContent=t("stopCount",{count:selected.length,max:MAX_STOPS});el.mobile_stop_count.textContent=t("mobileStopCount",{count:selected.length});el.mobile_duration.textContent=el.duration.textContent;
  el.itinerary_list.replaceChildren(...selected.map((place,index)=>{
    const item=document.createElement("li");item.className="itinerary-stop";item.innerHTML=`<span class="stop-number">${index+1}</span><strong class="stop-name">${escapeHtml(place.name)}</strong><div class="stop-controls"><button class="move-earlier" type="button" aria-label="${escapeAttr(t("moveEarlier",{name:place.name}))}" title="${escapeAttr(t("moveEarlierShort"))}" ${index===0?"disabled":""}>↑</button><button class="move-later" type="button" aria-label="${escapeAttr(t("moveLater",{name:place.name}))}" title="${escapeAttr(t("moveLaterShort"))}" ${index===selected.length-1?"disabled":""}>↓</button><button class="remove-stop" type="button" aria-label="${escapeAttr(t("removeStop",{name:place.name}))}" title="${escapeAttr(t("remove"))}">×</button></div>`;
    item.querySelector(".move-earlier").addEventListener("click",()=>moveStop(index,-1));item.querySelector(".move-later").addEventListener("click",()=>moveStop(index,1));item.querySelector(".remove-stop").addEventListener("click",()=>toggleStop(place));return item;
  }));
  const navigationUrl=buildGoogleMapsUrl({start:state.start,end:state.end,stops:selected});
  for(const link of [el.navigate,el.mobile_navigate]){link.href=navigationUrl;link.setAttribute("aria-disabled","false")}
}

function renderCategories(){el.categories.replaceChildren(...Object.entries(CATEGORY_LABELS).map(([code,label])=>{const wrapper=document.createElement("label");wrapper.className="category";wrapper.innerHTML=`<input type="checkbox" value="${code}" checked><span>${label}</span>`;wrapper.querySelector("input").addEventListener("change",()=>{if(state.discoveryLine)calculateMatches()});return wrapper}))}
function setCategories(value){document.querySelectorAll("#categories input").forEach(input=>input.checked=value);if(state.discoveryLine)calculateMatches()}

async function loadBikes(){if(!state.start)return;el.bikes_panel.hidden=false;el.bikes.textContent=i18n.locale==="it"?t("loadingBikes"):"Loading live availability…";try{const payload=await api(`/api/bikepoints?lat=${state.start.lat}&lon=${state.start.lon}`);el.bikes.replaceChildren(...payload.stations.map(station=>{const div=document.createElement("div");div.className="bike";div.innerHTML=`<strong>${escapeHtml(station.name)}</strong><span>${i18n.locale==="it"?t("bikesAndSpaces",{distance:station.distanceM,bikes:station.bikes,spaces:station.spaces}):`${station.distanceM} m · ${station.bikes} bikes · ${station.spaces} spaces`}</span>`;return div}))}catch{el.bikes.textContent=i18n.locale==="it"?t("bikesUnavailable"):"Cycle availability is temporarily unavailable."}}

function persistItinerary(){
  if(!(state.baseRoute&&state.start&&state.end))return;
  try{localStorage.setItem(STORAGE_KEY,JSON.stringify({version:1,savedAt:Date.now(),start:state.start,end:state.end,corridor:state.corridor,selectedIds:state.selectedIds,customOrder:state.customOrder}))}catch{}
}

function restoreSavedItinerary(){
  let saved;
  try{saved=JSON.parse(localStorage.getItem(STORAGE_KEY)||"null")}catch{return false}
  if(!saved||saved.version!==1||Date.now()-Number(saved.savedAt)>STORAGE_MAX_AGE||!validSavedPoint(saved.start)||!validSavedPoint(saved.end))return false;
  state.corridor=[200,500].includes(Number(saved.corridor))?Number(saved.corridor):200;document.querySelectorAll("#corridor button").forEach(button=>button.classList.toggle("active",Number(button.dataset.value)===state.corridor));
  setPoint("start",saved.start,{keepRoute:true,skipBikes:true});setPoint("end",saved.end,{keepRoute:true,skipBikes:true});state.selectedIds=(Array.isArray(saved.selectedIds)?saved.selectedIds:[]).filter((id,index,items)=>state.placesById.has(id)&&items.indexOf(id)===index).slice(0,MAX_STOPS);state.customOrder=saved.customOrder===true;calculateBaseRoute({restoring:true});return true;
}

function validSavedPoint(point){return point&&Number.isFinite(Number(point.lat))&&Number.isFinite(Number(point.lon))}
function clearRouteResults(){state.routeRevision++;state.baseRoute=null;state.discoveryLine=null;state.matches=[];state.selectedIds=[];state.customOrder=false;if(state.routeLayer){state.map.removeLayer(state.routeLayer);state.routeLayer=null}state.poiLayer.clearLayers();el.route_summary.hidden=true;el.results_section.hidden=true;el.itinerary.hidden=true;el.mobile_itinerary_bar.hidden=true;document.body.classList.remove("has-itinerary");try{localStorage.removeItem(STORAGE_KEY)}catch{}}
function reset(){
  stopMapPicking();clearRouteResults();state.start=null;state.end=null;state.corridor=200;
  for(const type of ["start","end"]){const markerKey=`${type}Marker`;if(state[markerKey]){state.map.removeLayer(state[markerKey]);state[markerKey]=null}el[`${type}_query`].value="";const choice=el[`${type}_choice`];choice.textContent=i18n.locale==="it"?"Non selezionato":"Not selected";choice.classList.remove("selected")}
  document.querySelectorAll("#corridor button").forEach(button=>button.classList.toggle("active",Number(button.dataset.value)===200));document.querySelectorAll("#categories input").forEach(input=>input.checked=true);el.route_button.disabled=true;el.distance.textContent="—";el.duration.textContent="—";el.match_count.textContent="—";el.results_note.textContent="";el.results_list.replaceChildren();el.itinerary_list.replaceChildren();el.stop_count.textContent=t("stopCount",{count:0,max:MAX_STOPS});el.mobile_stop_count.textContent=t("mobileStopCount",{count:0});for(const link of [el.navigate,el.mobile_navigate]){link.href="#";link.setAttribute("aria-disabled","true")}el.bikes_panel.hidden=true;el.bikes.replaceChildren();state.map.setView([51.5074,-.1278],11);message(t("routeCleared"));
}
async function api(url,options={}){const response=await fetch(url,{headers:{Accept:"application/json","Content-Type":"application/json",...(options.headers||{})},...options});const payload=await response.json();if(!response.ok||payload.ok===false)throw new Error(payload.error||`Request failed (${response.status})`);return payload}
function message(value,error=false){el.message.textContent=value;el.message.classList.toggle("error",error)}
function shortLabel(value){return String(value||"").split(",").slice(0,3).join(", ").slice(0,90)}function truncate(value,max){return value.length>max?`${value.slice(0,max-1)}…`:value}function formatDistance(m){return m>=1000?`${(m/1000).toFixed(1)} km`:`${Math.round(m)} m`}function formatDuration(s){const m=Math.round(s/60);return m>=60?`${Math.floor(m/60)} hr ${m%60} min`:`${m} min`}function escapeHtml(v){return String(v??"").replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]))}function escapeAttr(v){return escapeHtml(v)}
