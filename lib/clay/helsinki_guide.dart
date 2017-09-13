// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay helsinki_guide
///  presenting data for dawo-chore system
//

library helsinkiGuide;

///
class HelsinkiGuide {
  Map<String, String> attractionM = {};
}

var helsinkiGuide = new HelsinkiGuide();

void addAttractions() {
  helsinkiGuide.attractionM.addAll({
    'Ateneum Art Museum':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/ateneum-art-museum',
    'Design District Helsinki':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/design-district-helsinki',
    'Esplanade park':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/esplanade-park',
    'Helsinki Zoo':
        'http://www.visithelsinki.fi/en/professional/convention-bureau/conference-banquet-facilities/helsinki-zoo',
    'Linnanmäki Amusement Park':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/linnanmaki-amusement-park',
    'Market Square':
        'http://www.visithelsinki.fi/en/see-and-experience/shopping/market-square',
    'National Museum of Finland':
        'http://www.visithelsinki.fi/en/professional/convention-bureau/conference-banquet-facilities/national-museum-of-finland',
    'Old Market Hall':
        'http://www.visithelsinki.fi/en/see-and-experience/shopping/old-market-hall',
    'Seurasaari Open-Air Museum':
        'http://www.visithelsinki.fi/en/see-and-experience/activities-in-helsinki/seurasaari-open-air-museum',
    'Suomenlinna Sea Fortress':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/suomenlinna-sea-fortress',
    'Tori Quarters':
        'http://www.visithelsinki.fi/en/see-and-experience/sights-and-attractions/tori-quarters'
  });

  void renderHelsinkiGuide() {}
}
