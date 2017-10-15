///  testing mission in dawo
///  dawo version:  0.0.4  16.10.2017
//

import 'package:dawo/dawo.dart';
import 'package:dawo/missions.dart';

var myMission = new Mission('ToDo glorious stuff', 'test');

String msg = 'greetings from mission_test.dart';

void greetings() {
  print(msg);
}

void main() {
  myMission.opRoll(3, greetings);

  print('  rolling mission op-functions  ');

  ///  Eventually opRoll handles all these others.
  myMission.opInit(1, 'empty parameter');
  myMission.opOpen(2, 'second empty parameter');
  myMission.opRoll(3, helloMission);

  myMission.opSchedule();
  myMission.opReport();
  //  Close is last one in row.
  myMission.opClose(6, helloMission);
}
