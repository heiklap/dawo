///  ##  connecting  ( as #client's) app - mission - chore together,  mediating them
///   copyright  Heikki K. Lappalainen
///   dawo version:  0.0.3  25.9.2017  * READY-STATE:  0 %  for  0.0.4 version
///
/// * Hist: hkl  10.9.2017  0.0.1  dawo/lib  dawo_connector.dart
/// #name:  connector ..is not nice. change to: ______ ??
/// Connector is in deeply imaginary level of construction. We know, that app -
/// mission - chore work together in same sphere, and there must be something, that
/// they have in common; abstraction layer, in which they must work together.
///
/// * Sending messages between objects. Stance, approach
//  * Find common interests, i've been here.. follow-me, give-take
//  NOTE:  intentional error here now in class (constructor); how doe's it look?
//          Analyzer / dartdoc do not allow this, so correct it.
//  devNote: tracking begins.

library connector;

import 'package:dawo/base_struct.dart';

///  Buffering out-data ( #clayOut )
StringBuffer connectorBuf = new StringBuffer();

///  This other motto is just for to get more visibility to word: connector.
String connectorMotto =
    'connecting app - mission - chore together, mediating them';

///  ***********************************************************************
/*      connector:  very weak idea, how to accomplish this. 10 %
        Not much of this functionality is yet done.
        
        Name:   #connector is not the right one. Not nice.
        #clients: = app - mission's - chore's

* Get "service calls" from #members:  app - mission - chore; and solve them.
* Have rules of privilege for precedence of missions - chores.
* Give TO > mill commands, "work-orders".
* Should have access to class-buffers to seek data.
* Special language #Lang, to force commands to certain shape.
* #baton : to carry only-one-can-have-at-a-same-time magic thing.
*
* COMMAND ROLL:
* 1. get command, handle parameters.
* 2. Check command against rules. Take - return - reject.
* 3. Full-fill command;  void obey(sender, receiver, baton, msg, flags)
* 4. Get answer, serve back.
* 5. Mark done.
*
* Questions:
* 1. Where do connector work?  Is it upper-level loop?
*    ..  or is it available all the time.  No need to wake it.
* 2. Where, how, and why is #connector invoked?
* 3. ?
*
* IDEA:  All (commands) might happen in #mill. ( an order processor system ).
* IDEA:  #Callback-like service calls.
* IDEA:  #serviceKey #baton, that only one client can have at a time.
* IDEA:  Privilege key.
*
* MAYBE: Incoming commands have certain form. Classes?  Strings?
* MAYBE: Access to #GOAL aso. variables.
* MAYBE:
* MAYBE:
*
* NOT:  Handle #area #resource #time #money aso. properties.
* NOT:
* NOT:



 */
///  ***********************************************************************

///  This class gets same structure base, as other important classes.
///  Connecting clients (app-mission-chore) to work together.
class Connector extends BaseStruct {
  String name = 'connector class';
  String info = 'connecting app - mission - chore together, mediating them';
  String motto = 'do my job, connector, mediates';
  // Buffer inside class for output.
  StringBuffer buf = new StringBuffer();

  ///  Controlling connectors state, working-condition-state values.
  bool offB = true;
  bool onB = false;
  bool pauseB;
  bool doneB = false;

  ///  #New: #Gear Something turns around this.
  var pivot;

  ///  just an idea.. PING
  void ping(var sender, var receiver, var key) {
    ///  code
  }

  ///  get / collect bindings
  Map<String, Map<dynamic, dynamic>> bindingM = {};

  //  Connect something to other. One more empty idea:
  String binding(var customer, var thing) {
    //  Idea: Have some ideas?
    //  add / find from bindingM Map
    return 'binding: #one to #second';
  }

  ///  Just copy methods body from other class.  lol
  ///  Method for setting class field values to their run-time-values.
  void init() {
    buf.writeln('---  Connector buffer output initialized  ---');

    //  Set fields values.
    buf.writeln('init done');
  }

  ///  Method for setting class in working condition.
  void build() {
    offB = false; //  off-state ends
    onB = true; //   Connector is in on-state.
    buf.writeln('build done');
  }

  ///  #run / roll method
  void roll() {
    buf.writeln('Connector::    $info   :: roll engaged ');
    init(); //  calling init and build methods in this class.
    build();
    //  code for roll
    //  ***   code missing, see on top of this file
    //
    show();
    done();
    //  code here
  }

  ///  Solve one unambiguous textual find-decide problem.
  String touche(String sender, String key, String source) {
    //  TODO problem
    return 'solved:toucheStr: ';
  }

  ///  Search big amount of #clay data for #customer:s key / order.
  ///  .. solve textual problems based on keywords / search in textual data
  String solver(String sender, String key, String source) {
    //  TODO problem
    return 'solved: solveString';
  }

  ///  TODO:  connector one-time calls must have parameters;
  ///  Sketching one-time commands, coming from clients.
  void obey(String sender, receiver, baton, msg) {
    /// #baton  to carry only-one-can-have-at-a-same-time magic thing
    //  TODO  code, badly missing
    //  handle command / message
  }
  //  *****************************************************************

  ///  Presentation method.
  void show() {
    print(buf);
  }

  ///  close method
  void done() {
    print('Connector::    $info   :: engaged ');
    //  code here
    buf.write('---  Connector buffer output app: done  ---');
    print(buf);
    buf.clear(); //  empty buffer
  }

  ///  constructor
  Connector(this.name, this.info);
}

///  Construct almost same class: but for collecting data.
///  Would like to extend this from Connector: class, but it do not have
///  a none argument constructor.
///  ..  but Connector do not have  ..
///  NOTE  howTo extend class that have constructor with arguments?
class Collector {
  String name;
  String info;

  Collector(this.name, this.info);

  ///  howTo: constructor:  Wanna easy-extend this, but can not :(
  /// Error: the superclass Collector does'nt have a zero argument constructor
}

///  Usual render, presentation, function.
void renderConnector() {
  //  var connector = new Connector();
  //  or: shorthand
  var c = new Connector('render-test-connector', 'just for testing');
  c.info;
}
