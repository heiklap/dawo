// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.
///
///  ##  Model structure, base class, that is used everywhere in dawo:
/// * BaseStruct,
/// * dwv: version:   0.9.9.  7.4.2022.
/// *
//


part of alpha;

//  Chore-extends, DawoHist implements. Flag  use this
///     usage:   chore, connector, box_serve, dawo_hist
abstract class BaseStruct {
  String name = '';
  String info = '';
  ///  using now Map:  say
  Map<String, String> say = {};
  String motto = '';

  ///  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  ///  Combination of #LANG words in sentence.
  String clause = '';
  ///  devMemo: PLAN: Two fields for to better shape outPut stuff in console.
  /// like:  ":DAWO-APP:";
  String seal = '';
  ///  or this emblem.
  String emblem = '';
  ///  3-5-7 empty marks or something visible.
  ///  like:  "      ";
  String indent = '';
  ///  Object that owns this.
  String master = '';
  //  yes / no   ..  printing now.
  //  :BUG:001 to 1.0.0 version       bool _pB = true;
  bool _pB = false;
  StringBuffer buf = StringBuffer();

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': false,
    'work': false,
    'pause': false,
    'done': false,
  };

  //  TODO  Add fields for incoming and outgoing data.
  //  var clayIn;
  //  var clayOut;  //  like screen part;  topLeft aso.

  ///  Method for setting class field values.
  ///  TODO  add parameters
  void init(){
    //  to mark print-state used
    _pB;
  }

  ///  Method for setting class in working condition.
  void build(String _emblem, String _master);

  ///  #run-like method, it my have sub-methods; do, run.
  void roll();

  ///  Presentation method.
  void show(String action);
  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'

  ///  Close method.
  void done();

///
}     //     -----     abstract class BaseStruct

