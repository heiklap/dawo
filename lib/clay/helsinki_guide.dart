// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay helsinki_guide
///  presenting data for dawo-chore system
///  dawo version:  0.0.3  25.9.2017

library helsinkiGuide;

///
class HelsinkiGuide {
  String name = 'Helsinki Guide class';

  ///  forming new kind of map, to keep more information
  Map<String, Map<String, String>> helsinkiClayM = {};

  Map<String, String> attractionM = {
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
  };

  ///  clay outdoor map of Helsinki
  Map<String, String> outdoorM = {
    'Arabianranta':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/nahtavyydet/arabianranta',
    'Kaivopuisto':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/kaivopuisto',
    'Karjakaivo':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/kaivopuisto',
    'Kaunissaari':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/kaunissaari',
    'Keskuspuisto':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/keskuspuisto',
    'Kuusijärvi':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/kuusijarvi',
    'Lammassaari':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/lammassaari',
    'Nuuksion kansallispuisto':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/nuuksion-kansallispuisto',
    'Pihlajasaari':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/pihlajasaari',
    'Seurasaaren ulkomuseo':
        'http://www.visithelsinki.fi/fi/juuri-nyt/kiertoajelut-retket-ja-opastukset/seurasaaren-ulkomuseo-seurasaari',
    'Töölönlahti':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/toolonlahti',
    'Uutelan ulkoilupuisto':
        'http://www.visithelsinki.fi/fi/nae-ja-koe/aktiviteetit-helsingissa/uutelan-ulkoilupuisto',
    'Vartiosaari':
        'http://www.visithelsinki.fi/fi/juuri-nyt/kiertoajelut-retket-ja-opastukset/vartiosaari',
    'And much more.. ': 'Just find them!! ',
  };

  ///  source:  http://helka.net/helka/palvelut/vinkkejayhdistystoimintaan/kotikaupunkipolut
  ///  Helsinki city paths map
  Map<String, String> helsinkiPathsM = {
    'Arabia': 'www.artova.fi/arabian-kotikaupunkipolut',
    'Haaga': 'www.kaupunginosat.net/pohjoishaaga/pohjois-haaga-2',
    'Herttoniemi': 'www.herttoniemi.fi/kotikaupunkipolut',
    'Jakomäki–Alppikylä':
        'www.kaupunginosat.net/suurmetsajakomaki/kotikaupunkipolku',
    'Kumpula': 'www.kumpula.info/kotikaupunkipolku',
    'Käpylä': 'www.kaupunginosat.net/kapyla/kotikaupunkipolut',
    'Lauttasaari':
        'http://lauttasaari.fi/lauttasaari/lauttasaaren-kotikaupunkipolku',
    'Maunula': 'www.maunula.net/kotikaupunkipolku',
    'Myllypuro': 'www.kotikaupunkipolut.fi/myllypuro',
    'Pihlajamäki': 'www.kotikaupunkipolut.fi/pihlajamaki/Lahiolehti-3-2014.pdf',
    'Pitäjänmäki': 'www.kaupunginosat.net/pitajanmaki/kotikaupunkipolut',
    'Punavuori':
        'http://www.kaupunginosat.net/punavuori/punavuori/kotikaupunkipolku-intro',
    'Ruskeasuo': 'http://kaupunginosat.net/ruskeasuo/kotikaupunkipolku',
    'Tapulikaupunki':
        'http://kaupunginosat.net/tapulikaupunki/tapulikaupungin-kotikaupunkipolku',
    'Vuosaari': 'http://vuosaari.fi/tietoa-kaupunginosasta/kotikaupunkipolut',
    'Oulunkylä':
        'http://www.kaupunginosat.net/oulunkyla/kaupunkipolku/index.htm',
    'Malminkartano':
        'http://www.kaupunginosat.net/malminkartano/malminkartano/kotikaupunkipolku-mainmenu-278',
    'Konala': 'http://www.kaupunginosat.net/konala/konala/kotikaupunkipolut',
  };

  Map<String, String> seasonM = {
    'Winter': 'Talvi ',
    'Spring': 'Kevät ',
    'Summer': 'Kesä ',
    'Autumn': 'Syksy Helsingissä'
  };

  Map<String, String> eventM = {' ': ' ', 'a': ' ', 'b': ' '};

  void buildMaps() {
    helsinkiClayM.addAll({
      'Attractions': attractionM,
      'outdoor': outdoorM,
      'helsinkiPaths': helsinkiPathsM,
      'seasons': seasonM,
      'events': eventM
    });
  }
} //  -----  class HelsinkiGuide

///  instance
var helsinkiGuide = new HelsinkiGuide();

///  render / presentation-test function
void renderHelsinkiGuide() {
  print('nothing to see here.. renderHelsinkiGuide');
}
