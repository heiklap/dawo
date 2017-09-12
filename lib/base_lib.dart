///  ## Modeling common, reusable controls and operations for libraries.
///  dawo/base_lib,  version 0.0.2
///
///  Time to start thinking 6.th floor's furniture, when you are only just
///  laying base foundations for your 20-floor building.
///
///  All dawo code-constructing should depend on code, that is here, and all
///  thinking about dawo should concentrate on collecting reusable code here.
///
///  idea:   some base / flow  functionality, that is too small for packages,
///  and too big for tools.dart or dawo_app.dart.
///  Connections to packages, that we do not want to import fully.
///  Some extra control / flow variables for processes/events/jobs
///
///  Hist:  hkl  9.10.2013  0.0.1  dawo/lib    daw lib_base.dart
///  Returned 10.9.2017 to same idea with empty hands.
///
///  READY-STATE for version 0.0.2   1 %   in GIT  Yes
///  Open for all ideas, when seeking common functionality between app / lib /
///  classes / process aso.


//TODO  Global variables
//TODO  Global operations

library base_lib;

//TODO  this is not
final num dawLibBaseReadiness = 2; //  readiness for  version  0.0.1

///  buffer also outside class, for testing and adding visibility
var baseLibBuf = new StringBuffer();

String baseLibMotto = 'Serving common reusable functionality to all files';

///  for testing
void helloDawo() {
  print('   **  hello from dawo app /base_lib    ***');
}

//  common, joint, shared, communal, mutual, concerted
//  yhteis- common, joint, concerted, shared, collective, coed

//  yleinen : general, common, overall, public, universal, generic
//  tavallinen : usual, ordinary, plain, normal, common, regular
//


/// ..  or is it class BasePlacard ?
///  common information, that is in hand for every operation
///  model for id-data in common handshake method
Map<String,String> placardM = {
  'actor' : '',
  'sender' : '',
  'receiver' : '',
  'command' : '',
  'msg' : '',
};



///  TODO   Global variables
///  Try to imagine, what we will need
class GlobalVariables {
  // aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout
  var signature;
  var output;
  var input;
  void showInfo() {
    print('\n ***  no code in GlobalVariables yet :)  *** \n');
  }
}


///  TODO  Global operations
///  Every dawo #operation could relay on these
///  order: #actor #sender #receiver #command #msg
class GlobalOpClass{
  //  BaseStruct is known here
  //  BasePlacard is known also

  String actor;
  String sender;
  String receiver;
  /// can it be a function?
  Function cmd;
  String msg;

  var operation;  //  not used

  //TODO  constructor add
  GlobalOpClass(this.actor, this.sender, this.receiver, this.cmd, this.msg);

  void showInfo() {
    print('\n***************  global op class-showInfo  ********************');
    print('** actor: $actor ');
    print('** sender: $sender   receiver: $receiver ');
    print('** cmd: $cmd.toString() ');
    cmd();
    print('** msg:   $msg');
    print('** ');
    print('***************  global op class-showInfo  done *************** n');
    print('\n ***  no code in GlobalOperations yet :)  *** \n');
  }
}


/// do not look out unprofessionally and spam your code with print-clauses!
/// Instead use: flow !!
void flow() {
  // code here
}

///  Change "Automatic messages" to buf messages
String commonParamToStr(var sender, receiver, op, msg){
//  or return List
  String s = sender.toString();
  String r = receiver.toString();
  String o = op.toString();
  String _rStr = "$s $r $o $msg";
  return _rStr;
}


///  Automatic messages to buf, in operations
///  Formulate String for buffer message
String commonBufMsg(String sender, receiver, op, msg){
  String _s = "s: $sender  r: $receiver oop: $op msg: $msg";
  //  code here
  return _s;
}

///  shaping common functionality for  series of commands
void commonRoll(){
  //  code here
}


///  shaping common functionality for messages
void commonMsg(){
  //  code here
}


///  caller:  chore-op
///  shaping common functionality for..
///  TODO
StringBuffer commonProcess(GlobalOpClass glOpC, Function _command){
  print('--------------  commonProcess -------------------------------------');
  //TODO  start info and statistics
  StringBuffer _retBuf;
  //  code here

  // actual command.
  _command();

  glOpC.showInfo();
  glOpC.operation;  //  no operation, just show info now.

  //TODO  end info and statistics
  print('--------------  commonProcess done---------------------------------');
  return _retBuf;
}


///  shaping common functionality for presentation
void commonShow(){
  //  code here
}


///  usual presentation / play function
StringBuffer renderBaseLib() {
  StringBuffer _retBuf;
  /// and instance;
  var glbVar = new GlobalVariables();
  glbVar.showInfo();

  /// and instance;
  var renderBaeLibClass = new GlobalOpClass('n:name', 'renderBaseLib', 'rec:test', helloDawo(), 'all ok');
  commonProcess(renderBaeLibClass);

  renderBaeLibClass.showInfo();

return _retBuf;
}

//
