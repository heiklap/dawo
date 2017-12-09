// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Rumba : Loop, that runs dawoApp and some other stuff.
///  Runs it's loops forced, only once, without possibility of user action.
///  * Primary functionality:  loop, inside it: dawoApp
///  * dawo version:  0.0.6 :  27.11.2017  -   functionality: 70%
///  * in GitHub :  yes  NEXT: parameters for output?
///  * NEXT: bool values, that stop loops #FromInside dawo-app.
///  * If program parts have a certain amount of 'self consciousness' or other
///  . upper level activities, they are engaged from here.
///
// history:  hkl  14.9.2017  dawo/lib  rumba.dart   main loop of dawoApp
//
///Visibility:  only dawo_src.dart sees this class

library rumba.dart;

import 'alpha.dart';
import 'beta.dart';
import 'shower.dart';
import 'tools.dart';

import 'corp/connector.dart';
import 'dev/dawo_dev.dart';

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

  ///  control for printing.
  bool _pB = false;

  ///  Loop counter.
  int rumbaCount = 0;

  ///  Info about *this* actor.
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
      String connectorMsg = '';
      String rumbaLoopRumbaS = '**  rumbaLoop is rolling  **';
      _flowC('   -->---->--  rumba-loop-usher', true);

      ///  --  usher loop
      do {
        String rumbaLoopUsherS = '**  usherLoop is rolling  **';

        ///  duplicating this to get ListOverArea-message
        ///  duplicating this to get ListOverArea-message
        print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');

        connector.scoutJoin(placardM, ':USHER :LOOP :START', ':R:u:');
        connector.roll();
        print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');

        connector.scoutJoin(placardM, ':NEXT :CONNECT :TO :SCOUT', ':R:u:');
        connector.roll();

        /// ----------------------  usher loop code  ---------------------

        ///  --  dawoApp loop
        do {
          String rumbaLoopDawoAppS = '**  dawoAppLoop is rolling  **';
          //  ---------------------  dawo app loop code ------------------
          _flowC('      -->---->--  rumba-loop-dawoApp', true);

          ///  duplicating this to get ListOverArea-message
          print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');
          connector.scoutJoin(placardM, ':RUMBA :3 :TEST :CON', ':R:u:');
          connector.roll();
          connector.box(':R:.do:');

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

        ///
        dawoApp.box(':rumba:');
        usherB = false; //  force loop to run only once.
      } while (usherB);
      _flowC('    --<----<--  rumba-loop-usher: done', true);
      print('-->>-->>--  :rumba:usher: calling :connector:  -->>-->>--');
      connectorMsg = ':ALL :DO :ANSWER ;FAST => :HOW:MANY #Process :ON ?';

      connector.scoutJoin(placardM, connectorMsg, ':R:done:');
      connector.roll();

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

  ///  Calling print/print-to-buffer function from beta.
  ///  Getting local variables; Actor and Buffer right.
  void _flowC(String msg, bool prB) {
    ///  Call flowServe with #LOCAL variables.
    flowServe(':R:', out.outTl, msg, prB); //  Location:  in beta
  }
} //  --   rumba class
