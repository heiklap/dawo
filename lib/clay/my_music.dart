// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  myMusic
///  presenting data for dawo-chore system
///

//
library myMusic;

///
class MyMusic {
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
}

void renderWorkingMusic() {
  var myMusic = new MyMusic();
}
