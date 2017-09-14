// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  main library
///  presenting data for dawo-chore system
///

//
library clayRoll;

import 'package:dawo/clay/helsinki_guide.dart';
import 'package:dawo/clay/learn_dartlang.dart';
import 'package:dawo/clay/my_week.dart';
import 'package:dawo/clay/my_music.dart';
import 'package:dawo/clay/national_parks.dart';

List<String> clayMapL = ['helsinkiGuide','learnDartlang', 'myMusic',
'myWeek', 'nationalParks'];

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
    case 'myWeek':
      _retM = myWeekClay();
      break;
    case 'nationalParks':
      _retM = nationalParksClay();
      break;
    default:
      executeUnknown();
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
Map myWeekClay() {
  var myWeek = new WorkingWeek();
  Map _retM = myWeek.dayM;
  return _retM;
}

///
Map nationalParksClay() {
  var nationalParks = new NationalParks();
  Map _retM = nationalParks.parksM;
  return _retM;
}

///  in case ?
executeUnknown() {}
