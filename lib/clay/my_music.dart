// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  #
///  # dawo clay  myMusic
///  * Presenting data for dawo musicMission -chore system in music area.
///  * Includes simple Map data, that may be presented by objects box-method.
///  * dawo version:    0.8.0.   28.3.2022

//
//  library myMusic;
part of 'clay.dart';

///
class MyMusic {
  ///  name
  String name = 'My Music class';
  ///  myMusicClayM Map
  Map<String, Map<String, String>> myMusicClayM = {};
  ///  myMusicM Map
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

  ///  my Instruments Map
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

  ///  my favorite artists Map
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

  ///  my music genres Map
  Map<String, String> myGenreM = {
    'Country': 'Hank Williams and old stuff',
    'Blues': 'All goes',
    'Classic': 'Old style',
    'Baroc': 'Germany, Italy'
  };

  ///  music Genres from: https://en.wikipedia.org/wiki/List_of_popular_music_genres
  ///  musicGenreM Map
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

  ///  Method buildMaps
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

///  For play and exercise
void renderWorkingMusic() {
  MyMusic myMusic = MyMusic();
  myMusic.myArtistM.forEach((k, v) => print('$k, $v'));
}
