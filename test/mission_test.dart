///  testing mission in dawo
///  dawo version:  0.0.5  6.11.2017
//

import 'package:dawo/missions.dart';
import 'package:dawo/shower.dart';

var myMission = new Mission('ToDo glorious stuff', 'test');

String msg = 'greetings from mission_test.dart';

//  TODO  Functions should be in form:
//    //  TODO  Better hello-function, to do something real.
// void helloMission() => print('d-ex-exmpl: * * Mission!  Message-bus. * ');
//  :BUG:
//  TODO  Better hello-function, to do something real.
void courierGreetings() => print('* * :M:Test:courier:Greetings  *');


void main() {
  myMission.opRoll(3, courierGreetings);
  print('  rolling mission op-functions  ');

  ///  Eventually opRoll handles all these others.
  //  myMission.opInit(1, 'empty parameter');
  myMission.opInit(1, 'empty parameter');

  myMission.opOpen(2, 'second empty parameter');

  myMission.opOpen(2, 'second empty parameter');

  print('debug #: 4  :BUG: mission opRoll do not run this function');
  myMission.opRoll(3, courierGreetings);

  //  is now in shower   myMission.scheduleBox(':t-m:');
  scheduleBox(':t-m:');

  myMission.opReport();
  //  Close is last one in row.

  myMission.opClose();

  renderMission(':mission_test:');
}
