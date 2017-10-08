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

///  List containing all outBuffers for special browser screen areas.
///  Change this to Map<String, StringBuffer> to get names.
//  List<StringBuffer> outBufL = [
Map<String, StringBuffer> outBufM = {
  'outHeaderBuf': outHeader,
  'outTlBuf': outTl,
  'outTMidBuf': outTMid,
  'outTrBuf': outTr,
  'outMTopBuf': outMTop,
  ' outMidBuf': outMid,
  'outMBotBuf': outMBot,
  'outBlBuf': outBl,
  'outBrBuf': outBr,
  'outFooterBuf': outFooter,
};

///  Sizes of out-buffers
void outBuffersSizes(String caller) {
  String outHeaderLS = outHeader.length.toString();
  String outTlLS = outTl.length.toString();
  String outTMidLS = outTMid.length.toString();
  String outTrLS = outTr.length.toString();
  String outMTopLS = outMTop.length.toString();
  String outMidLS = outMid.length.toString();
  String outMBotLS = outMBot.length.toString();
  String outBlLS = outBl.length.toString();
  String outBrLS = outBr.length.toString();
  String outFooterLS = outFooter.length.toString();

  //  NOTE  Will eventually be list.
  print('\n --------------- outBuffersSizes  C: $caller  ----------------');
  print(' outHeader::  $outHeaderLS');
  print(' outTl::  $outTlLS ');
  print(' outTMid::  $outTMidLS ');
  print(' outTr::  $outTrLS ');
  print(' outMTop::  $outMTopLS ');
  print(' outMid:  $outMidLS ');
  print(' outMBot::  $outMBotLS ');
  print(' outBl::  $outBlLS ');
  print(' outBr::   $outBrLS');
  print(' outFooter::  $outFooterLS ');
  print('--------------- outBuffersSizes  C: $caller   :done: ---------- \n');
}

//  TODO  bring here from dawoApp serialized outBuffersPrint - function

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
