// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawo : data-in / out - working frame for chore user.
///  dawo version:  0.0.4  16.10.2017.    ready-state for 0.0.5  10 %
///
///  Hist: hkl  22.5.2014  0.0.1  dawo/lib => effort.dart
///  (previous name : enlisted)
///
///  NEXT version: Add SplayTreeSet,  and  LinkedHashSet
///  devNote:  Collecting here habit / human-like objects.

//

library effort;

import 'dart:collection';
import 'dart:convert';
import 'package:dawo/tools.dart';

///  Mediating this value to getter, that counts sum of these.
num effortReadiness = 93;

///  **************   JSON  example material      **************************
///  #QUEST : howTo mediate incoming data to user in JSON format?
///  https://api.dartlang.org/stable/1.24.2/dart-convert/JsonCodec-class.html
///  encode(Object value, { dynamic toEncodable(object) }) → String
///  Converts value to a JSON string.

///  decode(String source, { dynamic reviver(key, value) }) → dynamic
///  Parses the string and returns the resulting Json object.
///  Example: Simulating user imported data with: JSON.  //  iun dart:convert
///  #dartFMT has funny way to write JSON
var encoded = JSON.encode([
  1,
  2,
  {"a": null}
]);
var decoded = JSON.decode('["foo", { "bar": 499 }]');

var dpIn = JSON.encode([
  "dpStart",
  {"inData": 5}
]);
var dpOut = JSON.decode('["dpNext", { "outFormData": 7 }]');
///  **************   JSON  example material      **************************


///  howTo: howToMap:  Common method to print a map.  HowToPrintMap:
void effortOperationMapPrint(Map thisMap) {
  thisMap.forEach((k, v) {
    print('$k, $v');
  });
}

///  Effort class controls resources, that are not common, but individual
///  for chore.  Common resources are in equ with mission.
///  Effort is working-screen for user, with in and out-data.
class Effort {
//  team-howTo add map fields to list...   example
//  info('next: adding map keys to list:  ');
//  dartMap.forEach((k, v) { myValuesLists.add(v); });
//  info('next: adding map values to list:  ');
//  dartMap.forEach((k, v) { myValuesList.add(v); });

  ///  Initializing some Lists. No. Lists are more simple.
//  LinkedHashSet<String> goalL = new LinkedHashSet.from(['a', 'b', 'c']);
///  User-data to control and describe work with chore.
  List<String> goalL = new List(); //  No.    LinkedHashSet();
  List<String> planL = new List();
  List<String> phaseL = new List();
  List<String> teamActL = new List();
  List<String> tempoL = new List(); // adminNote   not nice name

  ///  Om hand-written schema was also:
  List<String> timeL = new List();
  List<String> stateL = new List();
  List<String> levelL = new List();
  List<String> moodL = new List();

  ///  testing... difference between  .  and ..
  void makeGoalL() {
    goalL
      ..add('Project 0.0.1 Plan')
      ..add('Github  clean')
      ..add('HTML  Pages')
      ..add('TO-DOs check');
    goalL.forEach(print);
  }

  /// adding data to List
  void makePlanL() {
    planL
      ..add('Plain idea')
      ..add('Accepted schema')
      ..add('W o r k  scheduled')
      ..add('W o r k  started');
    planL.forEach(print);
  }

  /// adding data to List
  void makePhaseL() {
    phaseL
      ..add('PhaseUnknown')
      ..add('PhaseGetInfo')
      ..add('PhaseMakePlan')
      ..add('phaseLtart')
      ..add('PhaseIn')
      ..add('PhaseDone');
    phaseL.forEach(print);
  }

  ///  Every team might have it's saying on subjects.
  /// Filling teamActL List
  void makeTeams() {
    teamActL
      ..add('teamAdmAct')
      ..add('teamDevAct')
      ..add('teamEduact')
      ..add('teamHowToact')
      ..add('teamInnoAct')
      ..add('teamNextAct');
    teamActL.forEach(print);
  }

  ///  Function for adding data to this List.
  void makeTempoL() {
    tempoL
      ..add('Largo     leveästi')
      ..add('Lento     hitaasti ')
      ..add('Grave     raskaasti ')
      ..add('Adagio    hitaasti ')
      ..add('Andante   käyden ')
      ..add('Allegro   nopeasti');
    tempoL.forEach(print);
  }

  ///  Rendering and presenting user-data Lists.
  void makeAllLists() {
    print('-- show of eff, effort class  -------- dawo Lists, goalL:');
    print('----------------- eff ----------------------- dawo Lists, goalL:');
    makeGoalL();

    print('------------------- eff -----------------------------    planL:');
    makePlanL();

    print('-------------------- eff ----------------------------    phaseL:');
    makePhaseL();

    print('--------------------- eff ---------------------------    teamL:');
    makeTeams();

    print('---------------------- eff --------------------------    tempoL:');
    makeTempoL();

    print('---------------------- eff ------------------------------------');
  }

  ///  Get diagonal presentation of all user-data Lists
  List<List<String>> effortL = [];

  ///  Usual init method even if we have no fields yet.
  void init() {}

  ///  Fill lists in effortL
  void build() {
    effortL.addAll([goalL, planL, phaseL, teamActL, tempoL]);
  }

  void getDiagonalList() {
    print('......................... effort : chore-user-data  ...........');

    List<String> idl = [];

    ///  Using method from tools library.
    idl.addAll(tl.iterableDiagonal(effortL, 205));
    print(idl.length);
    idl.forEach(print);
    print('.................. effort done : chore-user-data  ......');
  }

  ///  **************   JSON  example material      **************************
  ///  Simulating two user-data.
  var busJSONEnc = JSON.encode([
    "dpEncFirst",
    {"outBeginData": 3},
    "dpEncSecond",
    {"outBrginData": 4},
    "dpEncThird",
    {"outBrginData": 5}
  ]);
  var furyJSONEnc = JSON.encode([
    "dpEncNext",
    {"outFormData": 7}
  ]);

  var humanInEnc = JSON.encode([
    "df",
    {"outDD": 3, "inDD": 2},
    "dg",
    {"outBD": 4, "inBD": 2},
    "dh",
    {"outCC": 5, "OutCD": 7}
  ]);

  ///  Two var that are planned to be used for user-in JSON data.
  var busJSONDec = JSON.decode('["dpFirst", { "outBusData": 7 }]');
  var furyJSONDec = JSON.decode('["dpFirst", { "outFuryData": 3 }]');

  void showUserDiagonal() {
    print('\n * * * * * * *  user-JSON-diagonal-data-in * * * * * * *  ');

    List<List<String>> userJSONInL = [];
    userJSONInL.add([busJSONEnc]);
    print(userJSONInL.length);
    userJSONInL.add([furyJSONEnc]);
    userJSONInL.add([humanInEnc]);
    print(userJSONInL.length);
    List<String> idl = [];

    ///  Using method from tools library.
    idl.addAll(tl.iterableDiagonal(userJSONInL, 205));
    print(idl.length);
    idl.forEach(print);
    print('* * * * * * *  user-JSON-diagonal-data-in  done * * * * * * *  \n');
  }
} //  -----  class effort

///  Creating instance of effort class.
var eff = new Effort();

//
