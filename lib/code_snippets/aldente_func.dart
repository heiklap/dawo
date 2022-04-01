///  ##     AlDente-functions in dawo
///  This lib do not participate to dawoApp: here are only sample code-snippets.
///  Bunch of simple functions, acting variously, mostly boolean conditions.
///  Including some funny logical-naming-errors, where name do not correspond to
///  functionality.  Seeking common, reusable functions.
/// *  dwv: version:   0.3.0  23.3.2022
/// *  devState:  50%    in gitHub:  YES  22.04.2015
/// *  PLAN:  Total check for logic.
//

library aldente_func;

///  from punch/tools/signal
///  simple  sleep method
void sleep(int _wTime) {
  var gTime = DateTime.now().add(new Duration(milliseconds: _wTime));
  do {} while (new DateTime.now().compareTo(gTime) < 0);
}

///  collecting some numeric data with getters
final num aldenteFuncReadiness = 90;

///  boolean value for handling function values
bool isAlDente = false;

///  Series of simple functions using & returning different types
///  simple function returning a number
num aldenteFuncInit() {
  print('---------    Hello world!  I am init. ');
  return 7;
}

///  ------------------   3 return true-false functions
///TODO  teamDev Function return : add some logic to return values (no-bool)
bool aFunc() {
  print('dawo alDente true/false  aFunc');
  return true;
}

///  bool
bool bFunc() {
  print('dawo alDente true/false bFunc');
  return false;
}

///  another simple bool
bool cFunc() {
  print('dawo alDente true/false  cFunc');
  return false;
}

///  ------------------   3 void -functions
///  void functions do not return any value
void avFunc() {
  print('dawo alDente void avFunc');
}

///  ..
void bvFunc() {
  print('dawo alDente void bvFunc');
}

///  ..
void cvFunc() {
  print('dawo alDente void cvFunc');
}

///  ------------------   3 return-bool-functions
bool abFunc() {
  print('dawo alDente bool abFunc');
  return true;
}

/// ..2
bool bbFunc() {
  print('dawo alDente bool bbFunc');
  return false;
}

///  ..3
bool cbFunc() {
  print('dawo alDente bool cbFunc');
  return false;
}

///  ------------------   3 return-String-functions
///  for to allow easy hacking: modify these as you like
String asFunc() {
  print('dawo alDente String asFunc');
  return 'asFunc done..';
}

///  ..2
String bsFunc() {
  print('dawo alDente String bsFunc');
  return 'bsFunc done..';
}

///  ..
String csFunc() {
  print('dawo alDente String csFunc');
  return 'csFunc done..';
}

///  ------------------   3 return-num-functions
///  For to give material to hackings
num anFunc() {
  print('dawo alDente num anFunc');
  return 7;
}

///  ..
num bnFunc() {
  print('dawo alDente num bnFunc');
  return 19;
}

///  ..
num cnFunc() {
  print('dawo alDente num cnFunc');
  return 21;
}

///   Set values of 3 bool functions to local variables
bool abcSetBFunc() {
  print('dawo alDente abcSetBFunc --------');
  bool _aa, _bb, _cc;
  _aa = abFunc();
  _bb = bbFunc();
  _cc = cbFunc();
  print('----- -----  $_aa $_bb $_cc  end  dawo alDente abcSetBFunc');
//TODO  teamDev  Function return : make code to return something meaningful
  return false;
}

///-------   Using team Lists, or something useful...listHandler.. Great Name..
///  ..
//TODO  teamDev  List    include some list here..?
void listHandler(var thisCom, var thisOp, String msg) {
  //    some plan here..
  //    if (thisOp == ('print')) (thisList.forEach.print());
  //    else (thisList.add(thisOp));
  // no lists in this class     thisList.add(thisOp);
  thisCom; // run  two commands from parameters
  thisOp;
  print('-----------------------------------  listHandler        ' + msg);
}

///  just for to remember this handy  .forEach(print)  command
void listPrint(var thisList, String msg) {
  //  if (operation == ('print')) (thisList.forEach.print());
  //    else (thisList.add(operation));
  print('---------------' + msg);
  thisList.forEach(print);
  print('------------------------------------end');
}

/// PLAN:  common method for "meddling" between different functions (maybe)
///TODO  teamAdm  not-ready,  Untested..  ..use-cases for this ?
void commandHandler(var thisCommand, var thisOp, var msg) {
  //  if (operation == ('print')) (thisList.forEach.print());
  //    else (thisList.add(operation));
  //  no lists in this class     thisList.add(operation);
  //  rendering actual commands / functions
  thisCommand;
  thisOp;
  print('---------------------------------  :  ' + msg);
}

/// TODO  teamAdm  Suspended..(find errors)     partly   untested
/// Base type of alDente func   MAKE THIS TO BE SO
bool alDente(var myConditionFunc, var yourConditionFunc, bool condition) {
  //  supposing; condition =   false at the beginning.
  bool _condition = condition; //  copy parameter to local variable
  num _counter = 0; //  set local counter
  num _counterMax = 3; //  preventing endless loop

  bool _f = false;
  bool _s = false;
  do {
    _f = myConditionFunc();
    _s = yourConditionFunc();
    _counter++;
    if (_f == true) {
      if (_s == true) {
        (_condition = true);
        isAlDente = true;
      }
    }
    ;
    if (_counter == _counterMax) (_condition = true);
  } while (_condition);
  isAlDente = false; // set global variable to false again
  return _condition; // use this return value
}

///  alDenteXxx   functions roll until condition is set (but no more than 3 times)
//  TODO  teamAdm  Function :  seems to be too complicated
//  TODO  teamAdm  logic not checked.  So... very good material for classroom
bool alDenteOne(var myConditionFunc, var yourConditionFunc, bool condition) {
//NOTE:  should function parameters be bool?  Add msg-String parameter
  //  supposing; condition =  false..   at the beginning => don't execute
  //  set  condition to local variaböe
  num _counter = 0;
  num _counterMax = 3;
  bool _f = false;
  bool _s = false;
  do {
    _f = myConditionFunc(); //paraeter functions set values to local vars
    _s = yourConditionFunc();
    _counter++;
    if (_f == true) {
      if (_s == true) {
        (condition = true);
        isAlDente = true; //Global variable
      }
    }
    ;
    if (_counter == _counterMax) (condition = true);
  } while (condition);
  isAlDente = false; //return to default state
  return condition;
}

///  functions roll until condition is set (but no more than 3 times)
///  TODO  teamAdm Function : too complicated
///  logic not checked    lol
bool alDenteThree(var fFunc, var sFunc, bool condition) {
  //  supposing; condition =   false at the beginning.
//TODO  teamDev  stupid name /  condition makes .. troubles
  num _x = 0;
  bool _f = false;
  bool _s = false;
  do {
    _f = fFunc();
    _s = sFunc();
    _x++;
    if (_f == true) {
      if (_s == true) {
        (condition = true);
        isAlDente = true;
      }
    }
    ;
    if (_x == 3) (condition = true);
  } while (condition);
  return condition;
}

///  functions roll until condition is set (but no more than 3 times)
///  TODO  teamDev   Function : Make this async.    too complicated for nowOn..
///  nothing async here                 but in next version
bool alDenteAsync(var fFunc, var sFunc, bool condition) {
  //  supposing; condition =   false at the beginning.
  num _x = 0;
  bool _f = false;
  bool _s = false;
  do {
    _f = fFunc();
    _s = sFunc();
    _x++;
    if (_f == true) {
      if (_s == true) {
        (condition = true);
        isAlDente = true;
      }
    }

    ///TODO  DartFormat    funny lonely ; here..   no effect to code :)
    ;
    if (_x == 3) (condition = true);
  } while (condition);
  return condition;
}

///  TODO  teamDev  Future   make some return-value and isolate..in next version
///  purpose:    roll function inside isolate
///  nothing isolate here yet
void isolateFuncTwo(bool condition) {
  bool _condition = condition;
  int i = 0;
  //  runs 5x  if  false
  do {
    // backdoor out:
    i++;
    if (i == 5) _condition = true;
  } while (!_condition);
}

///  alDente  functions roll until condition is set true
///  TODO  control:   catch the loops inside both functions
///  and make these run parallel / aSync  &   'long'  logic
void alDenteLong(var firstFunction, var secondFunction, bool conduct) {
  ///  WORD:  conduct:    finish lang:    käytös, menettelytapa, hoito, johto
  bool _conduct = conduct;
  num _rollCount = 0;
  do {
    _rollCount++;
    firstFunction(); //  make bool return values
    secondFunction();
    //    planned 'long' functionality code comes here
    //    isolateFuncOne()     // roll inside isolate or aSync
    //    isolateFuncTwo()
    if (_rollCount == 4) (_conduct = true); // Backdoor

  } while (!_conduct); // Not-conduct.   Logic?
}

///  Function, that runs until BOTH parameter functions return: true
void alDenteShort(var boolFuncOne, var boolFuncTwo, bool fulfill) {
  bool _fulfill = fulfill;
  int _counter = 0;
  do {
    _counter++;
    // make these both functions return boolean value;
    // make: _fulfill = true ONLY when both return a true value
    boolFuncOne();
    boolFuncTwo();

    //    isolateFuncOne()     //coming:    roll inside isolate
    //    isolateFuncTwo()
    if (_counter == 4) (_fulfill = true); // Backdoor

  } while (!_fulfill);
}

///  TODO teamNext  Function  NOT-READY  Make: functions that DO NOT make alDente
void alDenteNot(var firstFunction, var secondFunction, bool clause) {
  bool _clause = clause;
  num _counter = 0;
  do {
    _counter++;
    firstFunction();
    secondFunction();
    //    CODE:   add logic  for  not.alDente

    //    isolateFuncOne()                 // roll inside isolate
    //    isolateFuncTwo()
    if (_counter == 4) (_clause = true); // Backdoor

  } while (!_clause);
}

//
