// is governed by a BSD-style license that can be found in the LICENSE file.
///  # dawo clay  myMusic
///  * Presenting data for dawo-chore system.
//  dawo version:   0.0.4  16.10.2017

//
library myMusic;

///
class MyMusic {
  String name = 'My Music class';

  Map<String, Map<String, String>> myMusicClayM = {};

  Map<String, String> myMusicM = {
    'Ukraine National Anthem': 'https://www.youtube.com/watch?v=bHzHlSLhtmM',
    'Vera Lynn: The White Cliffs of Dover':
        'https://www.youtube.com/watch?v=Hqtaoz4QFX8',
    'Ricky Nelson - Hello Mary Lou ( 1961 )':
        'https://www.youtube.com/watch?v=AMVQCHgpYmI',
    'Loituma - Ievan Polkka (Evas Polka)1996':
        'https://www.youtube.com/watch?v=4om1rQKPijI',
    'Franz Lehar- Gold und Silber,Walzer (Springtime In Vienna 98)':
        'https://www.youtube.com/watch?v=MMkyqcnQixY',
    'Comedian Harmonists - Gitarren spielt auf':
        'https://www.youtube.com/watch?v=80mQ63OxGuU',
    'Gid Tanner & His Skillet Lickers - Ya Gotta Quit Kicking My Dog Around':
        'https://www.youtube.com/watch?v=bR9zAoOcJ0E',
  };

  ///  my Instruments
  Map<String, String> myInstrumentM = {
    'Guitar Steel': 'Yamaha Guitar',
    'Guitar Nylon': 'Yamaha Guitar',
    'Blues Harp A': 'Harp A ',
    'Blues Harp C': 'Harp C ',
    'Blues Harp E': 'Harp E ',
    'Drum 1': 'Bongo',
    'Flute 1': 'fipple flute',
    'Accordion': 'Pelimanni harmonikka'
  };

  ///  my favorite artists
  Map<String, String> myArtistM = {
    'Joan Baez': 'https://en.wikipedia.org/wiki/Joan_Baez',
    'Donovan': 'https://en.wikipedia.org/wiki/Donovan',
    'Roy Orbison': 'https://en.wikipedia.org/wiki/Roy_Orbison',
    'Elton John': 'https://en.wikipedia.org/wiki/Elton_John',
    'Tamara Lund': 'https://fi.wikipedia.org/wiki/Tamara_Lund',
    'Konsta Jylhä': 'https://fi.wikipedia.org/wiki/Konsta_Jylh%C3%A4',
    'Luciano Pavarotti': 'https://en.wikipedia.org/wiki/Luciano_Pavarotti',
    'Lili-Babs': 'https://en.wikipedia.org/wiki/Lill-Babs',
  };

  ///  my music genres
  Map<String, String> myGenreM = {
    'Country': 'Hank Williams and old stuff',
    'Blues': 'All goes',
    'Classic': 'Old style',
    'Baroc': 'Germany, Italy'
  };

  ///  music Genres from: https://en.wikipedia.org/wiki/List_of_popular_music_genres
  Map<String, String> musicGenreM = {
    '1': '	African',
    '2	': 'Asian',
    '2.1	': 'East Asian',
    '2.2	': 'South and southeast Asian',
    '3	': 'Avant-garde',
    '4	': 'Blues',
    '5	': 'Caribbean and Caribbean-influenced',
    '6	': 'Comedy',
    '7	': 'Country',
    '8	': 'Easy listening',
    '9	': 'Electronic',
    '10	': 'Folk',
    '11	': 'Hip hop',
    '12	': 'Jazz',
    '13	': 'Latin',
    '14	': 'Pop',
    '15	': 'R&B and soul',
    '16	': 'Rock'
  };

  void buildMaps() {
    myMusicClayM.addAll({
      'myMusic': myMusicM,
      'myInstruments': myInstrumentM,
      'myArtist': myArtistM,
      'myGenre': myGenreM,
      'musicGenre': musicGenreM
    });
  }
} //  -----  MyMusic Class

///
void renderWorkingMusic() {
  var myMusic = new MyMusic();
  myMusic.myArtistM.forEach((k, v) => print('$k, $v'));
}
