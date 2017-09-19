///  testing mission in dawo
///
//

import 'package:dawo/dawo.dart';
import 'package:dawo/dawo_mission.dart';






  var myMission = new Mission('ToDo glorious stuff', 'test');

  String msg = 'greetings from mission_test.dart';

  void greetings(){
    print(msg);
  }


void main() {

  myMission.opRoll(3, greetings);




  //  print(missionError);
  //  var missionI = 34;
  //  print(missionI);

}