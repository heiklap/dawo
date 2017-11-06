///  dawo-dartlang package by Heikki K. Lappalainen 10.9.2017
///  dawo version: 0.0.5  16.10.2017
//

import 'package:dawo/dawo_app.dart';
import 'package:dawo/rumba.dart';

/// hello-world and m ain method
void main() {
  print('\n Hello world from dawo package! ');
  print('Presenting dawo data in console. \n');
  //  Constructor asks name and agenda.
  var dawoApp =
      new DawoApp('dawoApp in bin', 'Showing dawo activity in bin folder');
  var rumba = new Rumba();
  rumba.dance(dawoApp);
}
