///  ##  base structures, classes in dawo
///   copyright  Heikki K. Lappalainen
/// * READY-STATE:  10%            // for 0.0.2 version
/// * Hist: hkl  8.9.2016  0.0.1  dawo/lib  base_struct.dart
///
//

library base_struct;

///  base class for most dawo classes
///  DawoApp, BLib, Chore, Flag  use this
abstract class baseStruct {
  String name;
  String info;
  String motto;

  StringBuffer buf;
  ///  controlling app state
  bool offB;
  bool onB;
  bool pauseB;
  bool doneB;

  ///  Method for setting class values
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