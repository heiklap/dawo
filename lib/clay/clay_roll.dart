// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  main library
///  presenting data for dawo-chore / mission system
///

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

///  Series of functions that return a list > toChore
///
Map helsinkiGuideClay() {
  var helsinkiGuide = new HelsinkiGuide();

  Map _retM = helsinkiGuide.attractionM;
  // do something with it?
  return _retM;
}

///
Map learnDartlangClay() {
  var learnDartlang = new LearnDartlang();
  Map _retM = learnDartlang.dartlangSubjectsM;
  return _retM;
}

///
Map myMusicClay() {
  var myMusic = new MyMusic();
  Map _retM = myMusic.myMusicM;
  return _retM;
}

///
Map myTimeClay() {
  var myTime = new WorkingWeek();
  Map _retM = myTime.dayM;
  return _retM;
}

///
Map nationalParksClay() {
  var nationalParks = new NationalParks();
  Map _retM = nationalParks.parksM;
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
