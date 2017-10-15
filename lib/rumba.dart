// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Rumba : maintaining main loops of app - mission
///  Primary functionality:  loop, inside it: dawoApp
///  dawo version:  0.0.4  16.10.2017   ReadyState for 0.0.4 = 0%
///  in GitHub  yes
///  Program might have a certain amount of 'self consciousness'. This is start.
///
/// * hkl  14.9.2017  dawo/lib  rumba.dart   main loop of dawoApp
///
/// Visibility:  only dawo_src.dart sees this class

library rumba.dart;

///  TODO  import all necessary ?? here
//  import 'dawo_app.dart'; //  no need to import dawoApp

import 'base_lib.dart';
import 'base_struct.dart';
import 'dawo_dev.dart';

///  Collecting Rumba output.
StringBuffer rumbaBuf = new StringBuffer();
//  TODO  Get some fill to rumbaBuf.
bool pB = false;

/// TODO create classes, but where?
/* hardly here; but in example and user files.
var dawoApp = new DawoApp('dap in rumba', 'rumbaPlay');

*/

///
class Rumba {
  ///  boolean values for controlling loop; run now only once.
  ///  Eventually these values are triggered to false-state by sub-programs,
  ///  or some value / event in subprograms, but for now, this (fake)-done
  bool rumbaB = false;
  bool usherB = false;
  bool dawoAppB = false;
  bool missionB = false;

  int rumbaCount = 0;

  ///  setting loop variables to beginning state
  void initRumba() {
    print('------------>>-->>--  init Rumba  ------------>>-->>--');
    dev.howToNotes
        .add(':initRumba:  howTo : Keep track that ALL notes get marked ');
    dev.innoNotes.add(
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
    dev.admNotes.add('>>ADM:CHECK-IN  doneRumba  >>');
    dev.innoNotes.add(':doneRumba:  innovative: testing  ');

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
    flowC('-->---->--  rumba-dance', true);
    dev.admNotes.add('>>ADM:CHECK-IN  rumba-dance  >>');

    ///  TODO  rumbaLoop is executed for now only 1-3 times
    ///  primary rumba Loops, over / outside it is: usher loop
    ///  --  rumba loop
    initRumba();

    //  test #word ; is clay here?
    //  Clay  clay ??  packDawo?

    ///  --  rumbaLoop
    flowC('  -->---->--  rumba-loop', true);
    do {
      /// -----------------------  rumbaB loop code   -------------------
      /// some loopS variables to test visibility, and carry msg.
      /// TODO  add some functionality to rumbaLoop____  messages.
      String rumbaLoopRumbaS = '**  rumbaLoop is rolling  **';
      flowC('   -->---->--  rumba-loop-usher', true);

      ///  --  usher loop
      do {
        String rumbaLoopUsherS = '**  usherLoop is rolling  **';

        /// ----------------------  usher loop code  ---------------------

        ///  --  dawoApp loop
        do {
          String rumbaLoopDawoAppS = '**  dawoAppLoop is rolling  **';
          //  ---------------------  dawo app loop code ------------------
          flowC('      -->---->--  rumba-loop-dawoApp', true);

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

            flowC('     -->---->--  rumba-loop-mission', true);

            // -- chore:  All chore ops go via: Mission

            missionB = false; //  Emergency exit, while testing.
          } while (missionB);
          flowC('        --<----<--  rumba-loop-mission: done', true);

          dawoAppB = false; //  force loop to run only once.
        } while (dawoAppB);
        flowC('      --<----<--  rumba-dawo-app: done', true);

        usherB = false; //  force loop to run only once.
      } while (usherB);
      flowC('    --<----<--  rumba-loop-usher: done', true);

      doneRumba(); //  --  Do it only once now.
      rumbaB = false;
    } while (rumbaB);
    flowC('  --<----<--  rumba: done', true);

    /// --  usher loop
    //  No need, it is in next:  dev.showNotes(':RUMBA:');
    rumbaBuf.write(devBox('By:RUMBA-DANCE:', [dev.admNotes, dev.devNotes], 0));
    rumbaBuf.write(devBox(
        'By:RUMBA-DANCE:', [dev.innoNotes, dev.howToNotes, dev.secNotes], 0));
    print('------  one more funny list test   ------');
    //  TODO  add all boxes to rumbaBuf.
    devBox('T', [dev.innoNotes, dev.admNotes, dev.devNotes, dev.secNotes], 0);

    var _ll = out.outBufListsForBox();
    print('\n >>>>>>>>>>>>>>>>>>>>>>  outBuffers  <<<<<<<<<<<<<<<<<<<<<<<<<');
    rumbaBuf.write(devBox('T', [_ll[1], _ll[2], _ll[3]], 32));
    print(' ');
    devBox('T', [_ll[4], _ll[5], _ll[6]], 0);
    print(' ');
    devBox('T', [_ll[7], _ll[8]], 0);

    ///  Header and footer from out-buffers-
    devBox('T', [_ll[0], _ll[9]], 0);
    print('>>>>>>>>>>>>>>>>>>>>>>  outBuffers  done <<<<<<<<<<<<<<<<<<<< \n');
    //  flowFind(':RUMBA-DANCE:', '->>-', 35);
    //  flowFind(':RUMBA-DANCE:', 'build', 30);
    if (pB) flowFind(':RUMBA-DANCE:', '-->---->--', 35);
    dev.doneL.forEach(print);

    rumbaBuf.writeln('--<<--<<------------  Rumba.dance  done ----------');

    return rumbaBuf;
  } //  ----------   StringBuffer dance

} //  --   rumba class

///  Calling print / print-to-buffer function.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.
  flowServe(':R:', out.outTl, msg, p); //  Location:  in base_lib
}
