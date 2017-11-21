// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  glb   keeping important everybody-uses variables and constants.
///
///  dawo version: 0.0.5  19.11.2017.   READY-STATE  for version 0.0.6  2%
/// *      GitHub:
/// * Hist:hkl  19.11.2017  Moved stuff out from beta to make clarity.
/// * State:  schema
//

library glb;

///  Global, everybody to use variables and constants.
class GlobalClass {
  // Aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout. Grabbed.
  var signature;
  var output;
  var input;

  var register; //  register of objects that participate in Dawo / glb.
  //  Actor: String actor;  //  too important to be a String
  //  Not used anymore, everybody uses flowC() and local :ACTOR :buf:
  String actor = ':UNKNOWN: - :UNUSED:';

  ///  states. PLAN: many levels of flow-printing.
  ///  TODO  howTo mediate these to xPrint?
  Map<String, bool> st = {
    'flow': false, //  false prevents all "flow" printing via flowServe();
    //  Shorten output 2 screens.
    'buf': false, // TODO   controls bufPrint
    'info': false,
    'help': false,
    'bug': false,
    'test': false,
    'msg': false,
    'dev': false,
    'header': false,
    'footer': false,
    'state': false, //  state
  };

  ///  User dan set print variables like this.
  void setGlbPrint(bool tOrF) {
    for (var x in st.keys) {
      st[x] = tOrF; //  set it true or false.
    }
  }

  ///  Not much use, #Actor is announced in function parameter.
  void changeActor(String _actor) {
    actor = _actor;
  }

  ///  Minimize / stop console-flow printing.
  void printControl() {}

  //  code
  void showInfo() {
    print('\n ***  no code in :glb:  GlobalClass yet :)  *** \n');
  }
}

GlobalClass glb = new GlobalClass();
