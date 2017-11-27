///  testing mission in dawo
///  dawo version:  0.0.5  6.11.2017
//

import 'package:dawo/mis/missions.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/dawo_app.dart';

var myMission = new Mission('ToDo glorious stuff', 'test');

String msg = 'greetings from mission_test.dart';

//  TODO  Functions should be in form:
//    //  TODO  Better hello-function, to do something real.
// void helloMission() => print('d-ex-exmpl: * * Mission!  Message-bus. * ');
//  :BUG:
//  TODO  Better hello-function, to do something real.
void courierGreetings() => print('* * :M:Test:courier:Greetings  *');

//  :debug:  assuming this is #must:
// No?    var dawoApp = new DawoApp('mission-test-app', 'solve mission test.');

void main() {
  //  :debug:  assuming this is #must:
  //  No?  dawoApp.appRollMissions('mission_test.dart');

  //  At the end renderMission() is playing another mission.
  //  myMission is used here only to play opX
  myMission.opRoll(3, courierGreetings);
  print('  rolling mission op-functions  ');

  ///  Eventually opRoll handles all these others.
  //  myMission.opInit(1, 'empty parameter');
  myMission.opInit(1, 'empty parameter');
  myMission.opOpen(2, 'second empty parameter');
  myMission.opOpen(2, 'second empty parameter');
  myMission.opRoll(3, courierGreetings);

  //  is now in shower   myMission.scheduleBox(':t-m:');
  scheduleBox.roll(':t-m:');

  myMission.opReport();
  //  Close is last one in row.
  myMission.opClose();

  print('----- :m-t:  :mission:opReport and opClose done----');
  // :bug:  this fails, calling renderMission in mission.dart
  renderMission(':mission_test:');
}
