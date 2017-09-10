///  ## Modeling common, reusable controls and operations for libraries.
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
class GlobalOperation{
  var operation;
  var sender;
  var receiver;
  void showInfo() {
    print('\n ***  no code in GlobalOperations yet :)  *** \n');
  }
}


/// do not look out unprofessionally and spam your code with print-clauses!
/// Instead use: flow !!
void flow() {
  // code here
}

///  shaping common functionality for  series of commands
void commonRoll(){
  //  code here
}


///  shaping common functionality for messages
void commonMsg(){
  //  code here
}


///  shaping common functionality for
void commonProcess(){
  //  code here
}


///  shaping common functionality for presentation
void commonShow(){
  //  code here
}


///  usual presentation / play function
void renderBaseLib() {
  /// and instance;
  var glbVar = new GlobalVariables();
  glbVar.showInfo();

  /// and instance;
  var glbOp = new GlobalOperation();
  glbOp.showInfo();

}

//
