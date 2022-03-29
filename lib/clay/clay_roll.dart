/// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##
///  ##  dawo clay  main library
///  presenting incoming data for dawo-chore / mission system
///  For version 0.8.0 clay, group all 6 in-clays under clay-library.
///      --  create separate quide-lib to import clays from here
///  dawo version:    0.8.0.   28.3.2022
///  word: clay 79

//
part of clay;




//  TODO : add all maps in list: List<Map<String,String>>
List<String> clayMapL = [
  'helsinkiGuide',
  'packDawo',
  'learnDartlang',
  'myMusic',
  'myTime',
  'nationalParks'
];

///  return asked Map
///  Suppose Map must be type: Map<String, Map<String, String>>
Map<String, Map<String, String>> getClayMap(String _command) {
  String command = _command;
  Map<String, Map<String, String>> _retM = {};
  switch (command) {
    case 'packDawo':
      _retM = packDawoClay();
      break;
    case 'helsinkiGuide':
      _retM = helsinkiGuideClay();
      break;
    case 'learnDartlang':
      _retM = learnDartlangClay();
      break;
    case 'myMusic':
      _retM = myMusicClay();
      break;
    case 'myTime':
      _retM = myTimeClay();
      break;
    case 'nationalParks':
      _retM = nationalParksClay();
      break;
    default:
      executeUnknownClay();
  }
  return _retM;
}

///  'get' type Map functoon
Map<String, Map<String, String>> packDawoClay() {
  Map<String, Map<String, String>> _retM = {};
  PackDawo packDawo = PackDawo();
  packDawo.buildMaps(); //  get all maps..
  _retM.addAll(packDawo.packDawoClayM);
  return _retM;
}

///  use new, complicated Map
Map<String, Map<String, String>> helsinkiGuideClay() {
  Map<String, Map<String, String>> _retM = {};
  HelsinkiGuide helsinkiGuide = HelsinkiGuide();
  //  get all maps..
  helsinkiGuide.buildMaps('Clay-Roll - helsinkiGuideClay');
  _retM.addAll(helsinkiGuide.helsinkiClayM);
  return _retM;
}

///  function returns Map from clay folder
Map<String, Map<String, String>> learnDartlangClay() {
  Map<String, Map<String, String>> _retM = {};
  LearnDartlang learnDartlang = LearnDartlang();
  learnDartlang.buildMaps();
  _retM.addAll(learnDartlang.dartlangClayM);
  return _retM;
}

///
Map<String, Map<String, String>> myMusicClay() {
  Map<String, Map<String, String>> _retM = {};
  MyMusic myMusic = MyMusic();
  myMusic.buildMaps();
  _retM.addAll(myMusic.myMusicClayM);
  return _retM;
}

///
Map<String, Map<String, String>> myTimeClay() {
  Map<String, Map<String, String>> _retM = {};
  MyTime myTime = MyTime();
  myTime.buildMaps();
  _retM.addAll(myTime.myTimeClayM);
  return _retM;
}

///
Map<String, Map<String, String>> nationalParksClay() {
  Map<String, Map<String, String>> _retM = {};
  NationalParks nationalParks = NationalParks();
  nationalParks.buildMaps();
  _retM.addAll(nationalParks.nationalParksClayM);
  return _retM;
}

///  ..to present do-this-initiatives and spur-ons
void urge() {
  //  code here
}

///  in case ?
executeUnknownClay() {
  print('Nothing to see here.. executeUnknownClay..');
}
