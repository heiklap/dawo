// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Effort : data-in / out - working frame for chore user.
/// * ONLY  chore.dart should import this. 70% of user-activity is here.
/// * User adds or changes his own data to effort Maps.
/// * dwv: version:      0.7.0.  27.3.2022.
/// * NEXT version: Add SplayTreeSet,  and  LinkedHashSet
/// * devState : 25%  -  PLAN: 008 : 30%
///  devMemo:  Collecting here habit / human-like objects.
//

part of mis;


//  Mediating this value to getter, that counts sum of these.
num effortReadiness = 10;

///
String typeDefTestS = 'typeDefTestString not used now.';

//  devl:MIS  typedef _effPrint  Deleted 15.11.
//  devl:MIS  typeDefSuccess
// typedef void _EffPrint(String msg);

///  howTo: howToMap:  Method to print a map.  HowToPrintMap:
void effortOperationMapPrint(Map thisMap) {
  thisMap.forEach((k, v) {
    print('$k, $v');
  });
}

///  Effort class controls resources, that are meant for chore.
///  Common resources are in equ with mission.
///  Effort is working-screen for user, with in and out-data.
class Effort extends MisInterfaceBasis {
  String name = 'Chore-Effort class.';
  ///
  String motto = 'User activity and datain-out functionality in Chore.';

//  team-howTo add map fields to list...   example
//  info('next: adding map keys to list:  ');
//  dartMap.forEach((k, v) { myValuesLists.add(v); });
//  info('next: adding map values to list:  ');
//  dartMap.forEach((k, v) { myValuesList.add(v); });

  ///  Initializing some Lists. No. Lists are more simple.
//  LinkedHashSet<String> goalL = LinkedHashSet.from(['a', 'b', 'c']);
  ///  User-data to control and describe work with chore.
  Map<String, String> goalM = Map();
  Map<String, String> planM = Map();
  Map<String, String> phaseM = Map();
  Map<String, String> teamActM = Map();
  // adminMemo
  Map<String, String> tempoM = Map();

  ///  Om hand-written schema was also:
  Map<String, String> timeM = Map();
  Map<String, String> stateM = Map();
  Map<String, String> levelM = Map();
  Map<String, String> moodM = Map();

  ///  for print
  bool _pB = false;

  ///  testing... difference between  .  and ..
  void makeGoalM() {
    ///  Values: V: = Value, E: = effort, M: = mess,  D: = done.
    goalM
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
      ..putIfAbsent('Accepted schema', () => 'V:5 E:1 D:3 ')
      ..putIfAbsent('W o r k scheduled', () => 'V:3 E:6 D:0 ')
      ..putIfAbsent('W o r k started', () => 'V:3 E:2 D:1 ');
    //  planM.forEach(print);
    print(planM);
  }

  /// adding data to List
  void makePhaseM() {
    phaseM
      ..putIfAbsent('PhaseUnknown', () => 'V:0 trying E:3 D:0 ')
      ..putIfAbsent('PhaseGetInfo', () => 'V:2 E:8 some D:5 ')
      ..putIfAbsent('PhaseMakePlan', () => 'V:7 test E:7 D:0 ')
      ..putIfAbsent('phaseMtart', () => 'V:8 Substring E:8 D:0 ')
      ..putIfAbsent('PhaseInSt', () => 'V:3 E:6 should D:0 ')
      ..putIfAbsent('PhaseDone', () => 'V:9 work here E:8 well  D:7 ');
    //  phaseM.forEach(print);
    print(phaseM);
  }

  ///  Every team might have it's saying on subjects.
  ///  Filling teamActM List
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

  ///  Rendering and presenting user-data Lists. Called by: chore.
  void makeAllLists(String caller) {
    _effPrint('- >> - show of eff, effort class -- dawo Lists, C: $caller  -');
    ifPrint('- >> - show of eff, effort class -- dawo Lists, C: $caller  ---');
    _effPrint('----------------- eff ------ $typeDefTestS dawo Lists, goalM:');
    ifPrint('----------------- eff ------- $typeDefTestS dawo Lists, goalM:');
    makeGoalM();

    _effPrint('------------------- eff ---------------------------    planM:');
    ifPrint('------------------- eff -----------------------------    planM:');
    makePlanM();

    _effPrint('-------------------- eff -------------------------    phaseM:');
    ifPrint('-------------------- eff ----------------------------   phaseM:');
    makePhaseM();

    _effPrint('--------------------- eff --------------------------   teamL:');
    makeTeams();

    _effPrint('---------------------- eff -----------------------    tempoM:');
    makeTempoM();

    _effPrint('-- <<<<  ----------------- eff ------------------------------');
  }

  ///  Get diagonal presentation of all user-data Lists
  List<Map<String, String>> effortLM = [];

  ///  devl:MIS  typedef _effPrint
  ///  announced outside class:  typedef void _effPrint(String msg);
  ///  typedef _effPrint(String msg);
  ///  _EffPrint _effPrint(String msg) {
  void _effPrint(String msg) {
    if (_pB) print(':_effPrint:$_pB  $msg $typeDefTestS');
  }

  ///
  void ifPrint(String msg) {
    if (_pB) print(':sPrint: Is better than this ifPrint $msg $typeDefTestS');
  }

  ///  Usual init method even if we have no fields yet.
  void init() {}

  ///  Fill lists in effortLM
  void buildEffort(String caller) {
    effortLM.addAll([goalM, planM, phaseM, teamActM, tempoM]);
  }

  ///
  void buildMissions(String caller) {

  }

  ///  Constructing 6 items 15-20 wide list of HIGH VALUE-EFFORT
  List<String> getRecommendation(String caller) {
    print('-->>-->>--  getRecommendation in effort C: $caller  -->>-->>-- ');
    //  devl:MIS  Add schema for Value-Effort high valuation. V:N - E:N >

    List<String> _getRecL = [];

    ///  Call function from shower-lib to get high-value items.
    ///  parameters in called method:  _inlM, int _c, int _w
    _getRecL.addAll(highValue(effortLM, 8, 9));
    //  calling:   highValue(effortLM, 15, 8);
    print('--<<--<<--  getRecommendation in effort done  --<<--<<-- ');
    return _getRecL;
  }

  ///  Add user data to effort Maps and connect more user-data.
  ///  called by:  effort / getDiagonalList
  List<String> getUserData(String choice, String caller) {
    List<String> _gudL = [];
    print('--->-->  effort-getUserData  C: $caller  param: $choice --->-->');
    //  code
    //  user_json.dart has 3 bunch of json data:
    if (choice == 'bus') _gudL.addAll([userJson.busJSONEnc]);
    if (choice == 'fury') _gudL.addAll([userJson.furyJSONEnc]);
    if (choice == 'human') _gudL.addAll([userJson.humanInEnc]);
    print(_gudL.length);
    print('--->-->  effort-getUserData  C: $caller  --->-->');
    return _gudL;
  }

  ///  Handle user data, and change it in web-presentations.
  void rollUserData() {
    //  code
  }

  ///  Adding small boxed data-areas to DiagonalList.
  ///  At the end this should be user - server -in-data stuff.
  void addStuffToDiagonal() {
    //  Using this method from tl, tools library.
    //  Problem is, that #matrix should be publicly visible.
    //  tl.boxInList(_r, _c, __l, _matrix);
  }

  ///  Form diagonal List and plant boxed search-data inside it.
  void getDiagonalList(String caller) {
    print('-->>--   effort : getDiagonalList    -->>-->>  ');
    List<String> diagonalL = [];
    diagonalL.addAll(iterableDiagonalM(effortLM, 197));

    //  ***************************************************************
    //  **  print('--------- tl.valuesInStr and eff.effortLM test  ------');
    //  **  List<List<int>> intL = [];
    //  **  intL.addAll(tl.valuesInStr(eff.effortLM, 'V:', 'D:'));
    //  **  intL.forEach(print);
    //  **  intL.clear();

    //  ** print('----- tl.valuesInStr phaseM with Strings in.  test  ------');
    // **  example howTo extract only int values, like: [3, 4] [4, 5] ..
    List<List<int>> phaseIntL = [];
    List<Map<String, String>> tmpM = [];
    tmpM.add(eff.phaseM);
    //  now we got phaseM as only Map in List<Map<String, String>>
    phaseIntL.addAll(tl.valuesInStr(tmpM, 'V:', 'D:'));
    List<String> phaseIntLStr = ['* phaseM *'];

    phaseIntLStr.addAll(tl.listListIntToListString(phaseIntL));
    //  phaseIntL.forEach(print);
    //  ***************************************************************

    ///  Three lists used to hold box-shaped effort-data from effort-maps.
    List<String> _l1 = ['* Valuable: *'];
    List<String> _l2 = ['* Effort: *'];
    List<String> _l3 = ['* Done: *'];
    List<String> _l4 = ['* Recommendation: *']; //  Value - effort  HIGH!!
    List<String> _l5 = ['* PING *'];

    ///  Three lists that get their data from effort / user_json
    List<String> _lBus = ['JSON-BUS'];
    List<String> _lFury = ['JSON-FURY'];
    List<String> _lHuman = ['JSON-HUMAN'];

    _l1.addAll(effortTable(effortLM, 'V:', 7, 12));

    ///  Take  22 items where #Effort (E:N) value is high, key 12 wide text.
    _l2.addAll(effortTable(effortLM, 'E:', 12, 22));
    _l3.addAll(effortTable(effortLM, 'D:', 8, 9));

    //  build List _l4   * Recommendation: *
    //  OLD   _l4.addAll(['1', '2', '3', '4', '5', '6']);
    //  call::  highValue(effortLM, 15, 6)
    _l4.addAll(getRecommendation('caller'));

    //  build List _l5
    _l5.addAll(['1', '2', '3', '4', '5', '6']);

    ///  calling class Effort method
    _lBus.addAll(eff.getUserData('bus', ':ef:g-diag:'));
    _lFury.addAll(eff.getUserData('fury', ':ef:g-diag:'));
    _lHuman.addAll(eff.getUserData('human', ':ef:g-diag:'));

    List<String> dayL = [
      'Meetings:',
      'Monday   8',
      'Tuesday 11',
      'Friday  15',
      'Chat 13.30'
    ];
    tl.boxInList(9, 2, 100, 100, dayL, diagonalL);
    List<String> priorityL = [
      'Priority:',
      '1 Customs',
      '2 Deals',
      '3 Bugs',
      '4 Example'
    ];
    //  new parameters 3 and 4: _items, _w ( width of text)
    //  100, 100 is often harmless guess, but too long list breaks.
    tl.boxInList(2, 72, 100, 100, priorityL, diagonalL);
    //  If you do not know list length and what width you want, try 100
    tl.boxInList(2, 94, 100, 100, _l1, diagonalL);
    tl.boxInList(2, 160, 100, 100, _l2, diagonalL);
    tl.boxInList(18, 19, 100, 100, _l3, diagonalL);

    tl.boxInList(18, 39, 100, 100, _l4, diagonalL);
    tl.boxInList(18, 1, 100, 100, _l5, diagonalL);

    ///  devl:MIS  new  phaseIntLStr List with 5, 7 ..  3, 6  aso values
    tl.boxInList(26, 166, 100, 100, phaseIntLStr, diagonalL);

    ///  Adding json-to-List data to diagonalL matrix.
    tl.boxInList(26, 65, 100, 100, _lFury, diagonalL);
    tl.boxInList(29, 33, 100, 100, _lBus, diagonalL);
    tl.boxInList(15, 1, 100, 100, _lHuman, diagonalL);
    tl.boxInList(14, 0, 100, 100, ['peg'], diagonalL);
    tl.boxInList(1, 30, 100, 100, [':effort:get:diagonal:list:'], diagonalL);
    tl.boxInList(1, 170, 100, 100, ['dartlang app  Dawo 0.1.0+'], diagonalL);

    print(diagonalL.length);
    diagonalL.forEach(print);
    print('--<<--<<--   effort : getDiagonalList  done   ...... \n');
  } //  -----  getDiagonalList

  ///  This must be in effort.dart
  ///  Getting json data from UserJson class from user_json.dart.
  void showUserDiagonal(String caller) {
    print('\n * * * * *  user-JSON-diagonal-data-in  C: $caller  * * * * *  ');

    List<List<String>> userJSONInL = [];
    userJSONInL.add([userJson.busJSONEnc]);
    print(userJSONInL.length);
    userJSONInL.add([userJson.furyJSONEnc]);
    userJSONInL.add([userJson.humanInEnc]);
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
///  From now on there is ONLY ONE instance of Effort class.
///  All it's activity is rolled via chore.dart
Effort eff = Effort();

///  Chaining calls to serve userJson.
void effortCallingUserJson(String caller) {
  renderUserJson(':effort-callX:');
}

//
