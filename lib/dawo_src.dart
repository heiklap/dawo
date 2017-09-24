///  ##  Home of dawo libraries
///   copyright  Heikki K. Lappalainen
/// * dawo version:  0.0.3  25.9.2017
/// * READY-STATE:  0 %   or 0.0.4 version
/// * Hist: hkl  18.12.2013  0.0.1  dawo/lib  dawo.dart package
///

//TODO  teamEdu  ---------   notes are essential part of dawo package --------
//      so they are left here.. and they show direction and serve as tools here
//TODO  myOwn    Remember this & myOwn-special hashtag & special-projects

library dawo_src; //  naming this to _src...

//  unused import
import 'dart:async';

import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'base_lib.dart';
import 'base_struct.dart'; //  unused
import 'dawlib_chore.dart';
import 'dawlib_coll.dart';

import 'dawo_app.dart';
import 'dawo_connector.dart'; //  unused
import 'dawo_dev.dart';
import 'dawo_mill.dart';
import 'dawo_mission.dart';
import 'dawo_tools.dart';
import 'rumba.dart'; //  unused

///  Data (clay) is in clay-folder.
import 'package:dawo/clay/clay_roll.dart';

//  *team* became independent. How to use team in future.. that's the question
//  *team* was collaboration system to serve as tool for dawo development
//  small elements of team are presented

//teams  teamAdm  'favorite Dev, kill inno :), save money & time'
//       teamDev  'create fine new complicated things'
//       teamEdu   'this works, show it to everybody'
//       teamHowTo 1-9 -valued   answers and questions
//       teamInno  'crazy' ideas  (..that  adm often crushes :)
//       teamNext  for  next dawo versions

//TODO  teamAdm  package  Not yet:  import 'package:game_loop/game_loop_html.dart';
//TODO  teamAdm  pack     to avoid complications, better not to use too many packages
///
//TODO  teamDev   NOT using collection package anymore
//  should make alphabetical .txt  list of suggestions & not-used things.

//-------------------   (libraries/) parts of dawo package in ABC-order

part 'src/awesome.dart';

//TODO  teamNext   not yet :  part 'wrap_game_loop.dart';

///---------------------  count how long way to 0.0.1 version
num dawoDartReadiness = 92;

String missionError = 'Yes there is mission error';

//using getters to collect sums of variables from dawo-part files
num get dawoReadiness =>
    (aldenteFuncReadiness +
        batLoopReadiness +
        dawLibBaseReadiness +
        dawlibCollReadiness +
        dawLibStreamReadiness +
        dawLibWorkReadiness +
        dawoDartReadiness +
        dawoAppReadiness +
        dawoDevReadiness +
        demoToolsReadiness) /
    11;

///---------------------     initialization at the beginning
//TODO  teamInno: Can it be done?:  special initialization process at the beginning
num get dawoInit => aldenteFuncInit();

///  high-level function to get Map data
Map getClay(String _mapS) {
  Map _retM = getClayMap(_mapS);
  return _retM;
}

// Need to create instance of BLib class here?

///  example of library usage: dawo_app can be accessed from here,
///  but users of package can access it only by importing it.
///  all render.. functions are tests or example-like files.
StringBuffer renderDawo() {
  print('\n ---------------  renderDawo rolling -------------------------');
  var renderBuffer = new StringBuffer();
  renderBuffer.writeln('\n ------ renderBuffer starting  ------------ \n');

  var dawoApp = new DawoApp('dawoTestApp', 'in void renderDawo ');
  var dawoFlags = new DawoMill();
  dawoApp.agenda; //  just naming it

  /// just another instance, shorter, for testing
  var da = new DawoApp('dawoApp', 'playing in renderDawo-function');
  var df = new DawoMill();
  renderBuffer.writeln(da.infoS);
  df.userChoice;

  /// -------------------------------- testing  getters and setters
  /// remark:  with getters you can make code, that works NOW
  /// -------------       bool.. use some getters for testing
//NOTE: howTo:   getters can not be defined withing methods or functions;
//  bool get dawoOn   => dawoFlags.on;
//  bool get dawoActive => dawoFlags.active;  //stupid name
  var dawoOn = dawoFlags.active;
  dawoOn; //  just naming it
  var dawoActive = dawoFlags.active;
  dawoActive;
  renderBuffer
      .writeln('------- renderBuffer data-------------------------- \n');
  var missionY = new Mission('mission in dawo_src-render', 'test-mission');
  missionY.opCount;

  renderBuffer
      .writeln('--------renderBuffer done -------------------------  \n');
  print(renderBuffer);
  print('---------------  renderDawo * done *  --------------------- \n');

  return renderBuffer;
}

///  temporary test for rumba
void renderRumba() {
  //  rumba  //  7 variables
}
