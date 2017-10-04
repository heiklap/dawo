///  ##  base structures, classes in dawo
///   copyright  Heikki K. Lappalainen
///   dawo version:  0.0.3  25.9.2017
/// * READY-STATE:  0%            // for 0.0.4 version
/// * Hist: hkl  8.9.2017  0.0.1  dawo/lib  base_struct.dart
///  devNote:  No notes.
//

library base_struct;

String baseStructMotto = 'Base rules for building classes';

///  10 StringBuffers named for output to screen areas.
StringBuffer outHeader = new StringBuffer(); //  app - roll

StringBuffer outTl = new StringBuffer(); //  rumba
StringBuffer outTMid = new StringBuffer(); //  ?  mission
StringBuffer outTr = new StringBuffer(); //  dev

StringBuffer outMTop = new StringBuffer(); //  m - packDawo
StringBuffer outMid = new StringBuffer(); //  m - dartlang
StringBuffer outMBot = new StringBuffer(); //  m - helsinki

StringBuffer outBl = new StringBuffer(); //  m - myMusic
StringBuffer outBr = new StringBuffer(); //  m - myTime

StringBuffer outFooter = new StringBuffer(); // m -  nParks

///  List containing all outBuffers.
List<StringBuffer> outBufL = [
  outHeader,
  outTl,
  outTMid,
  outTr,
  outMTop,
  outMid,
  outMBot,
  outBl,
  outBr,
  outFooter
];

///  base class for most dawo classes
///  DawoApp, BLib, Chore, Flag  use this
abstract class BaseStruct {
  String name;
  String infoS;
  String motto;

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //  like:  ":DAWO-APP:";
  String emblem; //  or this emblem.
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.
  String master; //  Object that owns this.

  StringBuffer buf;

  ///  controlling objects state, working-condition-state values
  bool offB;
  bool onB;
  bool pauseB;
  bool doneB;

  //  TODO  Add fields for incoming and outgoing data.
  //  var clayIn;
  //  var clayOut;  //  like screen part;  topLeft aso.

  ///  Method for setting class field values.
  ///  TODO  add parameters
  void init();

  ///  Method for setting class in working condition.
  void build(String _emblem, String _master);

  ///  #run-like method, it my have sub-methods; do, run.
  void roll();

  ///  Presentation method.
  void show();

  ///  Close method.
  void done();
}

///  Every app-mission-chore creates new Placard for EVERY new operation (?)
///  or at-least gives it as parameter, to functions.
abstract class BasePlacard {
  //  Order: #actor #sender #receiver #command #msg
  String actor;
  String sender;
  String receiver;
  String command;
  String msg;
}

//
