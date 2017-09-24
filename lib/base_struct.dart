///  ##  base structures, classes in dawo
///   copyright  Heikki K. Lappalainen
///   dawo version:  0.0.3  25.9.2017
/// * READY-STATE:  0%            // for 0.0.4 version
/// * Hist: hkl  8.9.2017  0.0.1  dawo/lib  base_struct.dart
///
//

library base_struct;

String baseStructMotto = 'Base rules for building classes';

///  base class for most dawo classes
///  DawoApp, BLib, Chore, Flag  use this
abstract class BaseStruct {
  String name;
  String infoS;
  String motto;

  StringBuffer buf;

  ///  controlling objects state, working-condition-state values
  bool offB;
  bool onB;
  bool pauseB;
  bool doneB;

  //  TODO  add fields for incoming and outgoing data
  //  var clayIn;
  //  var clayOut;  //  like screen part;  topLeft aso.

  ///  Method for setting class field values
  ///  TODO  add parameters
  void init();

  ///  method for setting class in working condition
  void build();

  ///  #run-like method
  void roll();

  ///  presentation method
  void show();

  ///  close method
  void done();
}

///  every app-mission-chore creates new Placard for EVERY new operation (?)
///  or at-least gives it as parameter, to functions
abstract class BasePlacard {
  //  Order: #actor #sender #receiver #command #msg
  String actor;
  String sender;
  String receiver;
  String command;
  String msg;
}

//
