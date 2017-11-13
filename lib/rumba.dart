// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Rumba : maintaining main loops of app - mission
///  Primary functionality:  loop, inside it: dawoApp
///  dawo version:  0.0.5  6.11.2017   ReadyState for 0.0.6 = 0%
///  in GitHub  yes
///  Program might have a certain amount of 'self consciousness'. This is start.
///
/// * hkl  14.9.2017  dawo/lib  rumba.dart   main loop of dawoApp
///
/// Visibility:  only dawo_src.dart sees this class

library rumba.dart;

import 'base_lib.dart';
import 'base_struct.dart';
import 'connector.dart';
import 'dawo_dev.dart';
import 'shower.dart';
import 'tools.dart';

///  Collecting Rumba output.
StringBuffer rumbaBuf = new StringBuffer();

///
class Rumba {
  ///  boolean values for controlling loop; run now only once.
  ///  Eventually these values are triggered to false-state by sub-programs,
  ///  or some value / event in subprograms, but for now, this (fake)-done
  bool rumbaB = false;
  bool usherB = false;
  bool dawoAppB = false;
  bool missionB = false;

  bool _pB = false;

  int rumbaCount = 0;

  Map<String, String> placardM = {
    'actor': 'Rumba',
    'sender': 'Rumba instance',
    'receiver': 'All sub',
    'command': 'R=>-cmd:',
    'msg': 'R=>-msg:',
  };

  ///  setting loop variables to beginning state
  void initRumba() {
    print('------------>>-->>--  init Rumba  ------------>>-->>--');
    dev.howToN
        .add(':initRumba:  howTo : Keep track that ALL notes get marked ');
    dev.innoN.add(
        ':init:Rumba: CHECK-IN-NUMBER for every NOTE, that all notes are in count.');
    rumbaBuf.writeln('------------>>-->>--  init Rumba  ------------>>-->>--');
    rumbaB = true;
    usherB = true;
    dawoAppB = true;
    missionB = true;
  }

  ///  Setting loop variables to (fake-) force-stop state.
  void doneRumba() {
    rumbaBuf.writeln('--<<--<<------------ done Rumba  --<<--<<------------');
    dev.admN.add('>>ADM:CHECK-IN  doneRumba  >>');
    dev.innoN.add(':doneRumba:  innovative: testing  ');

    print('--<<--<<------------  done Rumba --<<--<<------------');
    rumbaB = false;
    usherB = false;
    dawoAppB = false;
    missionB = false;
  }

  ///  Is class better than function?  Better looking/finding in editor?
  ///  Class prevents polluting nameSpace with variable names.
  ///  TODO #QUEST howTo and where bring #dawoApp to rumba's scope?
  ///  Now it is just a methods parameter.
  ///  TODO  Add all other buffers to rumbaBuf.
  StringBuffer dance(var dawoApp) {
    //  TODO  Parameters for screen-output wanted.
    _flowC('-->---->--  rumba-dance', true);
    dev.admN.add('>>ADM:CHECK-IN  rumba-dance  >>');

    ///  TODO  rumbaLoop is executed for now only 1-3 times
    ///  primary rumba Loops, over / outside it is: usher loop
    ///  --  rumba loop
    initRumba();

    //  test #word ; is clay here?
    //  Clay  clay ??  packDawo?

    //  TODO  Add 2 pcs. of Stream / async / wait / then
    ///  --  rumbaLoop
    _flowC('  -->---->--  rumba-loop', true);
    do {
      /// -----------------------  rumbaB loop code   -------------------
      /// some loopS variables to test visibility, and carry msg.
      /// TODO  add some functionality to rumbaLoop____  messages.
      String rumbaLoopRumbaS = '**  rumbaLoop is rolling  **';
      _flowC('   -->---->--  rumba-loop-usher', true);
      print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');
      String connectorMsg = ':DO :NOT :USE #dawolang without #BUILD => :ERROR';
      con.opJoin(placardM, connectorMsg, ':R:u:');
      con.roll();

      ///  --  usher loop
      do {
        String rumbaLoopUsherS = '**  usherLoop is rolling  **';

        /// ----------------------  usher loop code  ---------------------

        ///  --  dawoApp loop
        do {
          String rumbaLoopDawoAppS = '**  dawoAppLoop is rolling  **';
          //  ---------------------  dawo app loop code ------------------
          _flowC('      -->---->--  rumba-loop-dawoApp', true);

          ///  TODO  dawoApp returns: Map<String, StringBuffer> 10 maps
          ///  Running base activity of dawo.
          dawoApp.roll();

          ///  --  mission loop
          do {
            String rumbaLoopMissionS = '**  missionLoop is rolling  **';

            //  roll already includes rollMissions
            //  NO!! dawoApp.rollMissions();

            //  Handle rumbaLoop___ messages.
            //  Save rumbaLoop__ messages to buffer.
            rumbaBuf.writeAll([rumbaLoopRumbaS, rumbaLoopUsherS]);
            rumbaBuf.writeAll([rumbaLoopDawoAppS, rumbaLoopMissionS]);

            _flowC('     -->---->--  rumba-loop-mission', true);

            // -- chore:  All chore ops go via: Mission

            missionB = false; //  Emergency exit, while testing.
          } while (missionB);
          _flowC('        --<----<--  rumba-loop-mission: done', true);

          dawoAppB = false; //  force loop to run only once.
        } while (dawoAppB);
        _flowC('      --<----<--  rumba-dawo-app: done', true);

        usherB = false; //  force loop to run only once.
      } while (usherB);
      _flowC('    --<----<--  rumba-loop-usher: done', true);
      print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');
      connectorMsg = ':ALL :DO :ANSWER ;FAST => :HOW:MANY #Process :ON ?';
      con.opJoin(placardM, connectorMsg, ':R:done:');
      con.roll();

      doneRumba(); //  --  Do it only once now.
      rumbaB = false;
    } while (rumbaB);
    _flowC('  --<----<--  rumba: done', true);

    /// --  usher loop
    //  No need, it is in next:  dev.showNotes(':RUMBA:');
    rumbaBuf.write(devBox('By:RUMBA-DANCE:', [dev.admN, dev.devN], 0));
    rumbaBuf
        .write(devBox('By:RUMBA-DANCE:', [dev.innoN, dev.howToN, dev.secN], 0));
    print('--:R:----  one more funny list test   ------');
    //  TODO  add all boxes to rumbaBuf.
    devBox(':R-D:', [dev.innoN, dev.admN, dev.devN, dev.secN], 0);

    var _ll = out.outBufListsForBox();
    print('\n -:R:--->>-->>-->>  outBuffers    --->>-->>-->>-->>--');
    rumbaBuf.write(devBox(':R-D:', [_ll[1], _ll[2], _ll[3]], 32));
    print(' ');
    devBox(':R-D:', [_ll[4], _ll[5], _ll[6]], 0);
    print(' ');
    devBox(':R-D:', [_ll[7], _ll[8]], 0);

    ///  Header and footer from out-buffers-
    devBox(':R-D:', [_ll[0], _ll[9]], 0);
    print('--<<--;R:--<<--<<  outBuffers  done --<<--<<--<<--<<-- \n');
    //  flowFind(':RUMBA-DANCE:', '->>-', 35);
    //  flowFind(':RUMBA-DANCE:', 'build', 30);
    if (_pB) flowFind(':RUMBA-DANCE:', '-->---->--', 35);

    tl.listShow(dev.doneL, ':R:');
    rumbaBuf.writeln('--<<--<<------------  Rumba.dance  done ----------');

    return rumbaBuf;
  } //  ----------   StringBuffer dance

  ///  Calling print/print-to-buffer function from base_lib.
  ///  Getting local variables; Actor and Buffer right.
  void _flowC(String msg, bool prB) {
    ///  Call flowServe with #LOCAL variables.
    flowServe(':R:', out.outTl, msg, prB); //  Location:  in base_lib
  }
} //  --   rumba class
