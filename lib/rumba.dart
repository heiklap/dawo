///  ##  Rumba : maintaining main loops of app - mission
///  Primary functionality:  loop
///
///  Program might have a certain amount of 'self consciousness'. This is start.
/// * ReadyState:   1 %  in version 0.0.3   in GitHub  no
/// * hkl  14.9.2017  0.0.3  dawo/lib  rumba.dart   main loop of dawoApp
///
/// Visibility:  only dawo_src.dart sees this class

library rumba.dart;

///  import 'base_struct.dart';
///  TODO  import all necessary ?? here
//  import 'dawo_app.dart'; //  no need to import dawoApp

import 'dawo_dev.dart';

///  collecting Rumba output
StringBuffer rumbaBuf = new StringBuffer();
//  TODO  get some fill to rumbaBuf

/// TODO create classes but where
/* hardly here
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
    print('-------------------  init Rumba  -----------------------');
    rumbaB = true;
    usherB = true;
    dawoAppB = true;
    missionB = true;
  }

  ///  setting loop variables to (fake-) force-stop state
  void doneRumba() {
    print('-------------------  done Rumba -----------------------');
    rumbaB = false;
    usherB = false;
    dawoAppB = false;
    missionB = false;
  }

  ///  is class better than function?  better looking/finding in editor?
  ///  TODO #QUEST howTo and where bring #dawoApp to rumba's scope. Constructor?
  ///  Now it is just a methods parameter.
  StringBuffer dance(var dawoApp) {
    devTest.devTestLine('rumba');

    ///TODO  rumbaLoop is executed for now only 1-3 times
    ///  primary rumba Loops, over it is usher loop
    ///  --  rumba loop
    initRumba();

    //  test #word ; is clay here?
    //  Clay  clay ??

    ///  --  rumbaLoop
    devTest.devTestLine('rumba');
    do {
      /// -----------------------  rumbaB loop code   -------------------
      /// some loopS variables to test visibility
      String rumbaLoopRumbaS = '**  rumbaLoop is rolling  **';
      devTest.devTestLine('usher');

      ///  --  usher loop
      do {
        String rumbaLoopUsherS = '**  usherLoop is rolling  **';
        /// ----------------------  usher loop code  ---------------------

        ///  --  dawoApp loop
        do {
          String rumbaLoopDawoAppS = '**  dawoAppLoop is rolling  **';
          //  ---------------------  dawo app loop code ------------------
          devTest.devTestLine('dawoApp');
          dawoApp.roll();

          ///  --  mission loop
          do {
            String rumbaLoopMissionS = '**  missionLoop is rolling  **';
            //  ************  call mission from inside dawoApp
            //  roll already includes rollMissions
            //  NO!! dawoApp.rollMissions();

            devTest.devTestLine('mission');
            // -- chore

            missionB = false; //  emergency exit, while testing
          } while (missionB);

          dawoAppB = false;
        } while (dawoAppB);

        usherB = false;
      } while (usherB);

      doneRumba(); //  --  do it only once now
      rumbaB = false;
    } while (rumbaB);

    /// --  usher loop

    return rumbaBuf;
  } //  ----------   StringBuffer rumba

} //  --   rumba class
