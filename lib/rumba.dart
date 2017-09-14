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

///  creating instance of DevTest class. New for every library (?)
var dt = new DevTest();

///
class Rumba {
  ///  boolean values for controlling loop
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

  ///  setting loop variables to beginning state
  void doneRumba() {
    print('-------------------  done Rumba -----------------------');
    rumbaB = false;
    usherB = false;
    dawoAppB = false;
    missionB = false;
  }

  ///  is class better than function?  better looking/finding in editor?
  StringBuffer dance(var dawoApp) {
    dt.devTestLine('rumba');

    ///TODO  rumbaLoop is executed for now only 1-3 times
    ///  primary rumba Loops, over it is usher loop
    ///  --  rumba loop
    initRumba();

    ///  --  rumbaLoop
    dt.devTestLine('rumba');
    do {
      /// -----------------------  rumbaB loop code   ---------------------------

      dt.devTestLine('usher');

      ///  --  usher loop
      do {
        /// ----------------------  usher loop code  ----------------------------

        ///  --  dawoApp loop
        do {
          //  ---------------------  dawo app loop code ------------------------------
          dt.devTestLine('dawoApp');
          dawoApp.roll();

          ///  --  mission loop
          do {
            //  ************  call mission from inside dawoApp
            dawoApp.rollMissions();
            dt.devTestLine('mission');
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
