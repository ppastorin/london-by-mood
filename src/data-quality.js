const THIRD_PARTY_HOSTS = [
  "wikipedia.org", "wikimedia.org", "tripadvisor.", "facebook.com", "instagram.com",
  "youtube.com", "blogspot.", "wordpress.com", "atlasobscura.com", "littleobservationist.com",
];

const TRUSTED_EDITORIAL_HOSTS = [
  "ianvisits.co.uk", "discoveringbritain.org", "thenorthernantiquarian.org", "banksyexplained.com", "secretldn.com",
];

const PUBLIC_AUTHORITY_HOSTS = [
  ".gov.uk", "london.gov.uk", "royalparks.org.uk", "parliament.uk", "tfl.gov.uk", "historicengland.org.uk",
];

export function classifySourceAuthority(value) {
  const host = urlHost(value);
  if (!host) return "THIRD_PARTY";
  if (THIRD_PARTY_HOSTS.some((candidate) => host === candidate || host.endsWith(`.${candidate}`) || host.includes(candidate))) {
    return "THIRD_PARTY";
  }
  if (TRUSTED_EDITORIAL_HOSTS.some((candidate) => host === candidate || host.endsWith(`.${candidate}`))) {
    return "TRUSTED_EDITORIAL";
  }
  if (PUBLIC_AUTHORITY_HOSTS.some((candidate) => host === candidate || host.endsWith(candidate))) {
    return "PUBLIC_AUTHORITY";
  }
  return "OWNER_OPERATOR";
}

export function isOfficialAuthority(value) {
  return ["OWNER_OPERATOR", "PUBLIC_AUTHORITY", "OFFICIAL_PARTNER"].includes(String(value || "").toUpperCase());
}

export function descriptionQuality(description, hook = "") {
  const text = `${description || ""} ${hook || ""}`.replace(/\s+/g, " ").trim();
  if (!text) return "MISSING";
  const generic = /worth (?:noticing|exploring|a visit)|london advanced collection|distinctive london (?:place|building)/i.test(text);
  if (generic || text.length < 100) return "GENERIC";
  return "SPECIFIC";
}

export function accessTypeV2(legacy) {
  return ({
    "24H": "ALWAYS_ACCESSIBLE",
    TICKETED: "TIMETABLED",
    SEASONAL: "SEASONAL",
  })[String(legacy || "").toUpperCase()] || "UNKNOWN";
}

export function proposeAccessType(place) {
  const legacy = accessTypeV2(place.accessType || place.legacyAccessType);
  if (legacy !== "UNKNOWN") return legacy;
  const notes = String(place.accessNotes || "").toLowerCase();
  if (/open days?|event only|selected dates?/.test(notes)) return "EVENT_ONLY";
  if (/booking|required|guided tour|ticket/.test(notes)) return "BOOKING_REQUIRED";
  const category = String(place.category || "").toUpperCase();
  if (["MUSEUM", "SHOPPING", "RELIGIOUS"].includes(category)) return "TIMETABLED";
  if (category === "PARK") return "SEASONAL";
  if (["AREA", "VIEWPOINT"].includes(category)) return "EXTERIOR_ONLY";
  if (["ODDITY", "BUILDING"].includes(category) && ["STOP", "WALK"].includes(String(place.visitMode || "").toUpperCase())) {
    return "EXTERIOR_ONLY";
  }
  return "UNKNOWN";
}

export function refreshDays({ accessType, category } = {}) {
  const access = String(accessType || "UNKNOWN").toUpperCase();
  const type = String(category || "").toUpperCase();
  if (["EVENT_ONLY", "SEASONAL"].includes(access)) return 7;
  if (["TIMETABLED", "BOOKING_REQUIRED", "APPOINTMENT_ONLY"].includes(access)) return 28;
  if (["MUSEUM", "SHOPPING", "RELIGIOUS"].includes(type)) return 28;
  if (["PARK", "AREA", "VIEWPOINT"].includes(type)) return 90;
  if (["ALWAYS_ACCESSIBLE", "EXTERIOR_ONLY", "PRIVATE_NO_PUBLIC_ACCESS"].includes(access)) return 180;
  return 60;
}

export function assessPlannerReadiness(place) {
  const authority = place.sourceAuthority || classifySourceAuthority(place.officialUrl);
  const hasOfficialSource = isOfficialAuthority(authority);
  const copyQuality = place.descriptionQuality || descriptionQuality(place.description, place.hook);
  const confidence = normalConfidence(place.dataConfidence || place.confidence);
  const accessClarity = place.accessClarity || "UNREVIEWED";
  const bookingMode = String(place.bookingMode || "UNKNOWN").toUpperCase();
  const hoursStatus = place.hoursStatus || "UNKNOWN";
  const hoursUsable = ["VERIFIED", "NOT_APPLICABLE"].includes(hoursStatus);
  const publicAccess = place.accessType !== "PRIVATE_NO_PUBLIC_ACCESS";
  const bookingClear = ["NONE", "OPTIONAL", "RECOMMENDED", "REQUIRED"].includes(bookingMode);
  const plannerReady = hasOfficialSource && confidence !== "LOW" && copyQuality === "SPECIFIC" &&
    accessClarity === "CLEAR" && bookingClear && hoursUsable && publicAccess;
  const issues = [];
  if (!hasOfficialSource) issues.push("SOURCE_MISSING");
  if (copyQuality !== "SPECIFIC") issues.push("DESCRIPTION_GENERIC");
  if (accessClarity !== "CLEAR") issues.push("ACCESS_UNCLEAR");
  if (!bookingClear) issues.push("BOOKING_UNCLEAR");
  if (!hoursUsable) issues.push("HOURS_UNCLEAR");
  if (!publicAccess) issues.push("NO_PUBLIC_ACCESS");
  return { plannerReady, hasOfficialSource, authority, descriptionQuality: copyQuality, confidence, issues };
}

export function urlHost(value) {
  try { return new URL(value).hostname.toLowerCase().replace(/^www\./, ""); } catch { return ""; }
}

function normalConfidence(value) {
  const confidence = String(value || "LOW").toUpperCase();
  return ["LOW", "MEDIUM", "HIGH"].includes(confidence) ? confidence : "LOW";
}
