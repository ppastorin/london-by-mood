export function placeResultCopy(place, locale = "en") {
  if (locale === "it") {
    return place.hookIt
      || place.descriptionIt
      || "Un luogo di Londra adatto all’umore selezionato.";
  }

  return place.hook
    || place.description
    || "A London place that fits the selected mood.";
}
