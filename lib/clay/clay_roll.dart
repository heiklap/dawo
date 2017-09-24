// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  main library
///  presenting data for dawo-chore / mission system
///  dawo version:  0.0.3  25.9.2017

//
library clayRoll;

import 'package:dawo/clay/helsinki_guide.dart';
import 'package:dawo/clay/learn_dartlang.dart';
import 'package:dawo/clay/my_time.dart';
import 'package:dawo/clay/my_music.dart';
import 'package:dawo/clay/national_parks.dart';

//  TODO : add all maps in list: List<Map<String,String>>
List<String> clayMapL = [
  'helsinkiGuide',
  'learnDartlang',
  'myMusic',
  'myTime',
  'nationalParks'
];

//  TODO : start using all maps: in list: List<Map<String,String>>
///  return asked Map
Map getClayMap(String _command) {
  String command = _command;
  Map _retM = {};
  switch (command) {
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

///  use new, complicated Map
Map<String, Map<String, String>> helsinkiGuideClay() {
  Map<String, Map<String, String>> _retM = {};
  var helsinkiGuide = new HelsinkiGuide();
  helsinkiGuide.buildMaps(); //  get all maps..
  _retM.addAll(helsinkiGuide.helsinkiClayM);
  return _retM;
}

///  function returns Map from clay folder
Map<String, Map<String, String>> learnDartlangClay() {
  Map<String, Map<String, String>> _retM = {};
  var learnDartlang = new LearnDartlang();
  learnDartlang.buildMaps();
  _retM.addAll(learnDartlang.dartlangClayM);
  return _retM;
}

///
Map<String, Map<String, String>> myMusicClay() {
  Map<String, Map<String, String>> _retM = {};
  var myMusic = new MyMusic();
  myMusic.buildMaps();
  _retM.addAll(myMusic.myMusicClayM);
  return _retM;
}

///
Map<String, Map<String, String>> myTimeClay() {
  Map<String, Map<String, String>> _retM = {};
  var myTime = new MyTime();
  myTime.buildMaps();
  _retM.addAll(myTime.myTimeClayM);
  return _retM;
}

///
Map<String, Map<String, String>> nationalParksClay() {
  Map<String, Map<String, String>> _retM = {};
  var nationalParks = new NationalParks();
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
