const CATEGORY_LABELS={AREA:"Areas",BUILDING:"Buildings",MUSEUM:"Museums",ODDITY:"Oddities",PARK:"Parks",RELIGIOUS:"Religious",SHOPPING:"Shopping",VIEWPOINT:"Views"};
const state={places:[],start:null,end:null,corridor:200,map:null,routeLayer:null,routeLine:null,poiLayer:null,startMarker:null,endMarker:null,pickMode:null};
const el=Object.fromEntries(["message","start-query","start-choice","end-query","end-choice","categories","route-button","route-summary","distance","duration","match-count","results-section","results-note","results-list","bikes-panel","bikes"].map(id=>[id.replaceAll("-","_"),document.getElementById(id)]));

start();
async function start(){
  state.map=L.map("map",{preferCanvas:true}).setView([51.5074,-.1278],11);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png",{maxZoom:19,attribution:"© OpenStreetMap contributors"}).addTo(state.map);
  state.poiLayer=L.layerGroup().addTo(state.map);
  state.map.on("click",event=>{
    if(!state.pickMode)return;
    const type=state.pickMode;
    const lat=Number(event.latlng.lat.toFixed(6));
    const lon=Number(event.latlng.lng.toFixed(6));
    setPoint(type,{lat,lon,label:`Map point ${lat.toFixed(6)}, ${lon.toFixed(6)}`});
    message(`${type==="start"?"Starting point":"Destination"} selected on the map.`);
  });
  bind();
  try{const payload=await api("/api/pois");state.places=payload.places;renderCategories();message(`${payload.count.toLocaleString("en-GB")} places loaded.`)}catch(error){message(error.message,true)}
}
function bind(){
  document.querySelectorAll("[data-search]").forEach(button=>button.addEventListener("click",()=>search(button.dataset.search)));
  ["start","end"].forEach(type=>document.getElementById(`${type}-query`).addEventListener("keydown",event=>{if(event.key==="Enter"){event.preventDefault();search(type)}}));
  document.getElementById("corridor").addEventListener("click",event=>{const button=event.target.closest("button[data-value]");if(!button)return;state.corridor=Number(button.dataset.value);document.querySelectorAll("#corridor button").forEach(b=>b.classList.toggle("active",b===button));if(state.routeLine)renderMatches()});
  document.getElementById("all-categories").addEventListener("click",()=>setCategories(true));
  document.getElementById("no-categories").addEventListener("click",()=>setCategories(false));
  document.getElementById("pick-start").addEventListener("click",()=>startMapPicking("start"));
  document.getElementById("pick-end").addEventListener("click",()=>startMapPicking("end"));
  el.route_button.addEventListener("click",route);
  document.getElementById("reset").addEventListener("click",reset);
  document.getElementById("refresh-bikes").addEventListener("click",loadBikes);
}
function startMapPicking(type){
  if(state.pickMode===type){stopMapPicking();message("Map selection cancelled.");return}
  state.pickMode=type;
  state.map.getContainer().classList.add("picking-location");
  document.getElementById("pick-start").classList.toggle("active",type==="start");
  document.getElementById("pick-end").classList.toggle("active",type==="end");
  message(`Click the map to choose the ${type==="start"?"starting point":"destination"}.`);
  if(window.matchMedia("(max-width: 900px)").matches){state.map.getContainer().scrollIntoView({behavior:"smooth",block:"center"})}
}
function stopMapPicking(){
  state.pickMode=null;
  state.map.getContainer().classList.remove("picking-location");
  document.getElementById("pick-start").classList.remove("active");
  document.getElementById("pick-end").classList.remove("active");
}
async function search(type){
  const input=document.getElementById(`${type}-query`);const query=input.value.trim();if(query.length<3){message("Enter a London address, station or postcode.",true);return}
  message(`Finding ${query}…`);try{const payload=await api(`/api/geocode?q=${encodeURIComponent(query)}`);setPoint(type,payload.result);message(`${type==="start"?"Starting point":"Destination"} selected.`)}catch(error){message(error.message,true)}
}
function setPoint(type,point){
  stopMapPicking();
  state[type]={lat:Number(point.lat),lon:Number(point.lon),label:shortLabel(point.label)};const markerKey=`${type}Marker`;if(state[markerKey])state.map.removeLayer(state[markerKey]);
  state[markerKey]=L.marker([point.lat,point.lon]).addTo(state.map).bindPopup(`${type==="start"?"Start":"Destination"}: ${escapeHtml(state[type].label)}`);
  const choice=el[`${type}_choice`];choice.textContent=state[type].label;choice.classList.add("selected");state.map.setView([point.lat,point.lon],14);el.route_button.disabled=!(state.start&&state.end);if(type==="start")loadBikes();
}
async function route(){
  el.route_button.disabled=true;message("Calculating the walking route…");try{const payload=await api("/api/route",{method:"POST",body:JSON.stringify({start:state.start,end:state.end})});drawRoute(payload);renderMatches();message("Route ready.")}catch(error){message(error.message,true)}finally{el.route_button.disabled=false}
}
function drawRoute(route){
  if(state.routeLayer)state.map.removeLayer(state.routeLayer);state.routeLine=turf.lineString(route.geometry.coordinates);state.routeLayer=L.geoJSON({type:"Feature",geometry:route.geometry,properties:{}},{style:{color:"#2e7772",weight:6,opacity:.9}}).addTo(state.map);state.map.fitBounds(state.routeLayer.getBounds().pad(.08));
  el.distance.textContent=formatDistance(route.distanceMetres);el.duration.textContent=formatDuration(route.durationSeconds);el.route_summary.hidden=false;
}
function renderMatches(){
  state.poiLayer.clearLayers();const categories=new Set([...document.querySelectorAll("#categories input:checked")].map(input=>input.value));const matches=[];
  for(const place of state.places){if(!categories.has(place.category))continue;const point=turf.point([place.lon,place.lat]);const metres=turf.pointToLineDistance(point,state.routeLine,{units:"kilometers"})*1000;if(metres>state.corridor)continue;const snapped=turf.nearestPointOnLine(state.routeLine,point,{units:"kilometers"});matches.push({...place,distanceFromRoute:Math.round(metres),routePosition:Number(snapped.properties?.location||0)})}
  matches.sort((a,b)=>a.routePosition-b.routePosition||a.name.localeCompare(b.name));el.match_count.textContent=String(matches.length);el.results_note.textContent=`Within ${state.corridor} m of the route`;el.results_list.replaceChildren(...matches.map(card));el.results_section.hidden=false;
  for(const place of matches){const icon=L.divIcon({className:"poi-div",html:`<span class="poi-marker">${escapeHtml(place.id.charAt(0))}</span>`,iconSize:[27,27],iconAnchor:[13,13]});const marker=L.marker([place.lat,place.lon],{icon}).addTo(state.poiLayer).bindPopup(`<h3>${escapeHtml(place.name)}</h3><p>${escapeHtml(place.description||place.hook||"")}</p>`);marker.options.placeId=place.id}
}
function card(place){
  const article=document.createElement("article");article.className="place-card";const copy=place.description||place.hook||"A place from the London Advanced collection.";article.innerHTML=`<header><h3>${escapeHtml(place.name)}</h3><span class="distance">${place.distanceFromRoute} m</span></header><p>${escapeHtml(truncate(copy,190))}</p><div class="tags"><span>${escapeHtml(CATEGORY_LABELS[place.category]||place.category)}</span>${place.price?`<span>${escapeHtml(place.price)}</span>`:""}${place.visitMinutes?`<span>${place.visitMinutes} min</span>`:""}</div><div class="actions"><button class="show-map">Show on map</button><a href="${escapeAttr(place.mapUrl)}" target="_blank" rel="noreferrer">Google Maps ↗</a>${place.officialUrl?`<a href="${escapeAttr(place.officialUrl)}" target="_blank" rel="noreferrer">Info ↗</a>`:""}</div>`;
  article.querySelector(".show-map").addEventListener("click",()=>{state.map.setView([place.lat,place.lon],16);state.poiLayer.eachLayer(layer=>{if(layer.options.placeId===place.id)layer.openPopup()})});return article;
}
function renderCategories(){el.categories.replaceChildren(...Object.entries(CATEGORY_LABELS).map(([code,label])=>{const wrapper=document.createElement("label");wrapper.className="category";wrapper.innerHTML=`<input type="checkbox" value="${code}" checked><span>${label}</span>`;wrapper.querySelector("input").addEventListener("change",()=>{if(state.routeLine)renderMatches()});return wrapper}))}
function setCategories(value){document.querySelectorAll("#categories input").forEach(input=>input.checked=value);if(state.routeLine)renderMatches()}
async function loadBikes(){if(!state.start)return;el.bikes_panel.hidden=false;el.bikes.textContent="Loading live availability…";try{const payload=await api(`/api/bikepoints?lat=${state.start.lat}&lon=${state.start.lon}`);el.bikes.replaceChildren(...payload.stations.map(station=>{const div=document.createElement("div");div.className="bike";div.innerHTML=`<strong>${escapeHtml(station.name)}</strong><span>${station.distanceM} m · ${station.bikes} bikes · ${station.spaces} spaces</span>`;return div}))}catch(error){el.bikes.textContent="Cycle availability is temporarily unavailable."}}
function reset(){location.reload()}
async function api(url,options={}){const response=await fetch(url,{headers:{Accept:"application/json","Content-Type":"application/json",...(options.headers||{})},...options});const payload=await response.json();if(!response.ok||payload.ok===false)throw new Error(payload.error||`Request failed (${response.status})`);return payload}
function message(value,error=false){el.message.textContent=value;el.message.classList.toggle("error",error)}
function shortLabel(value){return String(value||"").split(",").slice(0,3).join(", ").slice(0,90)}function truncate(value,max){return value.length>max?`${value.slice(0,max-1)}…`:value}function formatDistance(m){return m>=1000?`${(m/1000).toFixed(1)} km`:`${Math.round(m)} m`}function formatDuration(s){const m=Math.round(s/60);return m>=60?`${Math.floor(m/60)} hr ${m%60} min`:`${m} min`}function escapeHtml(v){return String(v??"").replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]))}function escapeAttr(v){return escapeHtml(v)}
