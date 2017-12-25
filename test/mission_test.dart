///  testing mission in dawo
///  dawo version:  0.0.5  6.11.2017
//

import 'package:dawo/mis/camp.dart';
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


void main() {
  ///  Instance of dawoApp is already created inside package.
  dawoApp.init(':mission_test:','Testing in mision_test_app' );

  //  :debug:  assuming this is #must:
  //  No?  dawoApp.appRollMissions('mission_test.dart');

  //  At the end renderMission() is playing another mission.
  //  myMission is used here only to play opX
  scout.roll(3, courierGreetings);
  print('  rolling mission op-functions  ');

  ///  Eventually opRoll handles all these others.
  //  myMission.opInit(1, 'empty parameter');
  scout.init(1, 'empty parameter');
  scout.open(2, 'second empty parameter');
  scout.open(2, 'second empty parameter');
  scout.roll(3, courierGreetings);

  //  is now in shower   myMission.scheduleBox(':t-m:');
  scheduleBox.roll(':t-m:');

  scout.report();
  //  Close is last one in row.
  scout.close();

  print('----- :m-t:  :mission:opReport and opClose done----');
  // :bug:  this fails, calling renderMission in mission.dart
  renderMission(':mission_test:');
}
