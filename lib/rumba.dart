///  ##  Rumba : maintaining main loops of app - mission
///  Primary functionality:  loop
///  dawo version:  0.0.3  25.9.2017
/// * ReadyState:   0 %  for version 0.0.4   in GitHub  no
///  Program might have a certain amount of 'self consciousness'. This is start.
///
/// * hkl  14.9.2017  dawo/lib  rumba.dart   main loop of dawoApp
///
/// Visibility:  only dawo_src.dart sees this class

library rumba.dart;

///  import 'base_struct.dart';
///  TODO  import all necessary ?? here
//  import 'dawo_app.dart'; //  no need to import dawoApp

import 'base_lib.dart';
import 'base_struct.dart';
import 'dawo_dev.dart';

///  collecting Rumba output
StringBuffer rumbaBuf = new StringBuffer();
//  TODO  get some fill to rumbaBuf
bool pB = false;

/// TODO create classes, but where?
/* hardly here; but in example and user files.
var dawoApp = new DawoApp('dap in rumba', 'rumbaPlay');

*/

///
class Rumba {
  ///  boolean values for controlling loop
  ///  Eventually these values are triggered to false-state by sub-programs,
  ///  or some value / event in subprograms, but for now, this (fake)-done
  bool rumbaB = false;
  bool usherB = false;
  bool dawoAppB = false;
  bool missionB = false;

  int rumbaCount = 0;

  ///  primary rumba loop
  ///

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

  ///  setting loop variables to (fake-) force-stop state
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
  ///  TODO #QUEST howTo and where bring #dawoApp to rumba's scope. Constructor?
  ///  Now it is just a methods parameter.
  StringBuffer dance(var dawoApp) {
    //  TODO  Parameters for screen-output wanted.
    flowC('-->---->--  rumba-dance', true);
    dev.admNotes.add('>>ADM:CHECK-IN  rumba-dance  >>');

    ///TODO  rumbaLoop is executed for now only 1-3 times
    ///  primary rumba Loops, over it is usher loop
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

          ///TODO  dawoApp returns: Map<String, StringBuffer> 10 maps

          dawoApp.roll();

          ///  --  mission loop
          do {
            String rumbaLoopMissionS = '**  missionLoop is rolling  **';
            //  ************  call mission from inside dawoApp
            //  roll already includes rollMissions
            //  NO!! dawoApp.rollMissions();

            //  Handle rumbaLoop___ messages.
            //  Save rumbaLoop__ messages to buffer.
            rumbaBuf.writeAll([rumbaLoopRumbaS, rumbaLoopUsherS]);
            rumbaBuf.writeAll([rumbaLoopDawoAppS, rumbaLoopMissionS]);

            flowC('     -->---->--  rumba-loop-mission', true);

            // -- chore

            missionB = false; //  emergency exit, while testing
          } while (missionB);
          flowC('        --<----<--  rumba-loop-mission: done', true);

          dawoAppB = false;
        } while (dawoAppB);
        flowC('      --<----<--  rumba-dawo-app: done', true);

        usherB = false;
      } while (usherB);
      flowC('    --<----<--  rumba-loop-usher: done', true);

      doneRumba(); //  --  do it only once now
      rumbaB = false;
    } while (rumbaB);
    flowC('  --<----<--  rumba: done', true);

    /// --  usher loop
    //  No need, it is in next:  dev.showNotes(':RUMBA:');
    devBox('By:RUMBA-DANCE:', [dev.admNotes, dev.devNotes], 0);
    devBox('By:RUMBA-DANCE:', [dev.innoNotes, dev.howToNotes, dev.secNotes], 0);

    //  flowFind(':RUMBA-DANCE:', '->>-', 35);
    //  flowFind(':RUMBA-DANCE:', 'build', 30);
    if (pB) flowFind(':RUMBA-DANCE:', '-->---->--', 35);

    rumbaBuf.writeln('--<<--<<------------  Rumba.dance  done ----------');

    return rumbaBuf;
  } //  ----------   StringBuffer rumba

} //  --   rumba class

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.
  flowServe(':RUMBA:', outTl, msg, p);
}
