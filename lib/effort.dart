// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawo : data-in / out - working frame for chore user.
///  dawo version:  0.0.4  16.10.2017.    ready-state for 0.0.5  10 %
///
///  Hist: hkl  22.5.2014  0.0.1  dawo/lib => effort.dart
///  (previous name : enlisted)
///  NEXT:  Move all JSON stuff to own user-income-data
///  NEXT:  User actions,  markDone()  changeValueEffort()
///  NEXT:  Usage workFlow
///
///  NEXT version: Add SplayTreeSet,  and  LinkedHashSet
///  devNote:  Collecting here habit / human-like objects.

//

library effort;

import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'shower.dart';
import 'tools.dart';

///  Mediating this value to getter, that counts sum of these.
num effortReadiness = 10;

///  **************   JSON  example material      **************************
///  #QUEST : howTo mediate incoming data to user in JSON format?
///  https://api.dartlang.org/stable/1.24.2/dart-convert/JsonCodec-class.html
///  encode(Object value, { dynamic toEncodable(object) }) → String
///  Converts value to a JSON string.

///  decode(String source, { dynamic reviver(key, value) }) → dynamic
///  Parses the string and returns the resulting Json object.
///
/// Class from json:   Type t = Animal;
//  new t.fromJson(...);
///  Example: Simulating user imported data with: JSON.  //  in dart:convert
///  #dartFMT has funny way to write JSON
var encoded = JSON.encode([
  1,
  2,
  {"a": null}
]);

///  output: [1,2,{"a":null}]  length:  16

///  output:  [foo, {bar: 499}]  length:  2
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
  String name = 'Chore-Effort class.';
  String motto = 'User activity and datain-out functionality in Chore.';

//  team-howTo add map fields to list...   example
//  info('next: adding map keys to list:  ');
//  dartMap.forEach((k, v) { myValuesLists.add(v); });
//  info('next: adding map values to list:  ');
//  dartMap.forEach((k, v) { myValuesList.add(v); });

  ///  Initializing some Lists. No. Lists are more simple.
//  LinkedHashSet<String> goalL = new LinkedHashSet.from(['a', 'b', 'c']);
  ///  User-data to control and describe work with chore.
  Map<String, String> goalM = new Map(); //  No.    LinkedHashSet();
  Map<String, String> planM = new Map();
  Map<String, String> phaseM = new Map();
  Map<String, String> teamActM = new Map();
  Map<String, String> tempoM = new Map(); // adminNote   not nice name

  ///  Om hand-written schema was also:
  Map<String, String> timeM = new Map();
  Map<String, String> stateM = new Map();
  Map<String, String> levelM = new Map();
  Map<String, String> moodM = new Map();

  ///  testing... difference between  .  and ..
  void makeGoalM() {
    goalM

      ///  Values: V: = Value, E: = effort, M: = mess,  D: = done.
      ..putIfAbsent('Project 0.0.1 Plan', () => 'V:3 E:2 D:1 ')
      ..putIfAbsent('Github  clean', () => 'V:3 E:5 D:3 ')
      ..putIfAbsent('HTML  Pages', () => 'V:6 E:7 D:2 ')
      ..putIfAbsent('TO-DOs check', () => 'V:3 E:2 D:2 ');
    //  goalM.forEach(print);  //  want it in one row:
    print(goalM);
  }

  /// adding data to List
  void makePlanM() {
    planM

      ///  Values: V: = Value, E: = effort, M: = mess,  D: = done.
      ..putIfAbsent('Plain idea', () => 'V:3 E:3 D:6 ')
      ..putIfAbsent('Accepted schema', () => 'V:3 E:1 D:3 ')
      ..putIfAbsent('W o r k scheduled', () => 'V:3 E:6 D:0 ')
      ..putIfAbsent('W o r k started', () => 'V:3 E:2 D:1 ');
    //  planM.forEach(print);
    print(planM);
  }

  /// adding data to List
  void makePhaseM() {
    phaseM
      ..putIfAbsent('PhaseUnknown', () => 'V:0 E:3 D:0 ')
      ..putIfAbsent('PhaseGetInfo', () => 'V:2 E:8 D:5 ')
      ..putIfAbsent('PhaseMakePlan', () => 'V:3 E:7 D:0 ')
      ..putIfAbsent('phaseMtart', () => 'V:8 E:8 D:0 ')
      ..putIfAbsent('PhaseInSt', () => 'V:3 E:6 D:0 ')
      ..putIfAbsent('PhaseDone', () => 'V:9 E:8 D:7 ');
    //  phaseM.forEach(print);
    print(phaseM);
  }

  ///  Every team might have it's saying on subjects.
  /// Filling teamActM List
  void makeTeams() {
    teamActM
      ..putIfAbsent('teamAdmAct', () => 'V:3 E:9 D:1 ')
      ..putIfAbsent('teamDevAct', () => 'V:3 E:2 D:0 ')
      ..putIfAbsent('teamEduAct', () => 'V:2 E:9 D:0 ')
      ..putIfAbsent('teamHowToAct', () => 'V:6 E:8 D:2 ')
      ..putIfAbsent('teamInnoAct', () => 'V:3 E:1 D:0 ')
      ..putIfAbsent('teamNextAct', () => 'V:1 E:1 D:0 ');
    //  teamActM.forEach(print);
    print(teamActM);
  }

  ///  Function for adding data to this List.
  void makeTempoM() {
    tempoM

      ///  Values: V: = Value, E: = effort, M: = mess,  D: = done.
      ..putIfAbsent('Largo     leveästi', () => 'V:3 E:2 D:0 ')
      ..putIfAbsent('Lento     hitaasti ', () => 'V:2 E:3 D:0 ')
      ..putIfAbsent('Grave     raskaasti ', () => 'V:4 E:4 D:0 ')
      ..putIfAbsent('Adagio    hitaasti ', () => 'V:8 E:5 D:0 ')
      ..putIfAbsent('Andante   käyden ', () => 'V:6 E:7 D:0 ')
      ..putIfAbsent('Allegro   nopeasti', () => 'V:7 E:8 D:0 ');
    //  tempoM.forEach(print);
    print(tempoM);
  }

  ///  Rendering and presenting user-data Lists.
  void makeAllLists() {
    print('- >> - show of eff, effort class  -------- dawo Lists, -------');
    print('----------------- eff ----------------------- dawo Lists, goalM:');
    makeGoalM();

    print('------------------- eff -----------------------------    planM:');
    makePlanM();

    print('-------------------- eff ----------------------------    phaseM:');
    makePhaseM();

    print('--------------------- eff ---------------------------    teamL:');
    makeTeams();

    print('---------------------- eff --------------------------    tempoM:');
    makeTempoM();

    print('-- <<<<  ----------------- eff ------------------------------');
  }

  ///  Get diagonal presentation of all user-data Lists
  List<Map<String, String>> effortLM = [];

  ///  Usual init method even if we have no fields yet.
  void init() {}

  ///  Fill lists in effortLM
  void build() {
    effortLM.addAll([goalM, planM, phaseM, teamActM, tempoM]);
  }

  ///  Adding small boxed data-areas to DiagonalList.
  ///  At the end this should be user - server -in-data stuff.
  void addStuffToDiagonal() {
    //  Using this method from tl, tools library.
    //  Problem is, that #matrix should be publicly visible.
    //  tl.boxInList(_r, _c, __l, _matrix);
  }

  ///  Form diagonal List and plant boxed search-data inside it.
  void getDiagonalList() {
    List<String> diagonalL = [];
    diagonalL.addAll(iterableDiagonalM(effortLM, 205));

    ///  Three lists used to hold box-shaped effort-data from effort-maps.
    List<String> _l1 = ['* Valuable: *'];
    List<String> _l2 = ['* Effort: *'];
    List<String> _l3 = ['* Done: *'];
    _l1.addAll(effortTable(effortLM, 'V:', 7, 12));

    ///  Take  22 items where #Effort (E:N) value is high, key 12 wide text.
    _l2.addAll(effortTable(effortLM, 'E:', 12, 22));
    _l3.addAll(effortTable(effortLM, 'D:', 8, 12));

    tl.boxInList(
        9,
        2,
        ['Meetings:', 'Monday   8', 'Tuesday 11', 'Friday  15', 'Chat 13.30'],
        diagonalL);
    tl.boxInList(
        2,
        72,
        ['Priority:', '1 Customs', '2 Deals', '3 Bugs', '4 Example'],
        diagonalL);

    tl.boxInList(2, 94, _l1, diagonalL);
    tl.boxInList(2, 160, _l2, diagonalL);
    tl.boxInList(18, 20, _l3, diagonalL);

    print(diagonalL.length);
    diagonalL.forEach(print);
    print('.... << .......... effort : chore-user-data  done   ...... \n');
  }

  ///  **************   JSON  example material      **************************
  ///  Simulating two user-data.
  var busJSONEnc = JSON.encode([
    "dpEncFirst",
    {"outBeginData": 3},
    "dpEncSecond",
    {"outBeginData": 4},
    "dpEncThird",
    {"outBeginData": 5}
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
    ///  iterableDiagonal i now in shower-library
    idl.addAll(iterableDiagonal(userJSONInL, 205, 'Effort-ShowUserDiagonal'));
    print(idl.length);
    idl.forEach(print);
    print('* * * * * * *  user-JSON-diagonal-data-in  done * * * * * * *  \n');
  }
} //  -----  class effort

///  Creating instance of effort class.
var eff = new Effort();

//
