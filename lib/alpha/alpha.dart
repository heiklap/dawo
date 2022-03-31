// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///
///  ##  Model structures, base classes, that are used everywhere in dawo:
/// * Out, BaseStruct, BasePlacard, Group, Member, Actor, Action.
/// * dawo version:   0.9.0.  30.3.2022.
/// *  30.3.2022  new alpha folder
/// *
// * Hist: hkl  8.9.2017  0.0.1  dawo/lib  alpha.dart
//  devNote:  No notes.
//

library alpha;

String alphaMotto = 'Basic rules for building classes';

///  NOTE abstract classes cant be created with new keyword.

///  Mess, when trying to extend OutBase.
///
class Out {
  String name = 'Out-Class';
  //  Quest: shorter way?
  ///  Return iterable List from StringBuffer. Also in tools.
  List<String> bufToList(StringBuffer buf) {
    List<String> _l = [];
    String _s = buf.toString();
    _l.addAll(_s.split('\n'));
    return _l;
  }

  ///  Must use static, if this is inside a class
  ///  10 StringBuffers named for output to screen areas.
  StringBuffer outHeader = StringBuffer(); //  app - roll

  StringBuffer outTl = StringBuffer(); //  rumba
  StringBuffer outTMid = StringBuffer(); //  ?  mission
  StringBuffer outTr = StringBuffer(); //  dev

  StringBuffer outMTop = StringBuffer(); //  m - packDawo
  StringBuffer outMid = StringBuffer(); //  m - dartlang
  StringBuffer outMBot = StringBuffer(); //  m - helsinki

  StringBuffer outBl = StringBuffer(); //  m - myMusic
  StringBuffer outBr = StringBuffer(); //  m - myTime

  StringBuffer outFooter = StringBuffer(); // m -  nParks

  ///  List containing all outBuffers for special browser screen areas.
  ///  Changed this to Map<String, StringBuffer> to get names.
  Map<String, StringBuffer> outBufM = {
    /*  This map is filled in build-method.
    'outHeaderBuf': outHeader,
    'outTlBuf': outTl,
    'outTMidBuf': outTMid,
    'outTrBuf': outTr,
    'outMTopBuf': outMTop,
    'outMidBuf': outMid,
    'outMBotBuf': outMBot,
    'outBlBuf': outBl,
    'outBrBuf': outBr,
    'outFooterBuf': outFooter,
    */
  };

  ///  = new List:  called in rumba.dart
  List<List<String>> outBufListsForBox() {
    List<List<String>> _ll = [];
    List<String> outHeaderBufL = [];
    List<String> outTlBufL = [];
    List<String> outTMidBufL = [];
    List<String> outTrBufL = [];
    List<String> outMTopBufL = [];
    List<String> outMidBufL = [];
    List<String> outMBotBufL = [];
    List<String> outBlBufL = [];
    List<String> outBrBufL = [];
    List<String> outFooterBufL = [];

    outHeaderBufL.addAll(bufToList(outHeader));
    outTlBufL.addAll(bufToList(outTl));
    outTMidBufL.addAll(bufToList(outTMid));
    outTrBufL.addAll(bufToList(outTr));
    outMTopBufL.addAll(bufToList(outMTop));
    outMidBufL.addAll(bufToList(outMid));
    outMBotBufL.addAll(bufToList(outMBot));
    outBlBufL.addAll(bufToList(outBl));
    outBrBufL.addAll(bufToList(outBr));
    outFooterBufL.addAll(bufToList(outFooter));

    _ll.addAll([outHeaderBufL, outTlBufL, outTMidBufL, outTrBufL, outMTopBufL]);
    _ll.addAll([outMidBufL, outMBotBufL, outBlBufL, outBrBufL, outFooterBufL]);

    return _ll;
  }

  ///  return all out-buffers combined in one buffer.
  StringBuffer outBuffersAll() {
    StringBuffer _sB = StringBuffer();
    _sB.write(outHeader);
    _sB.write(outTl);
    _sB.write(outTMid);
    _sB.write(outTr);
    _sB.write(outMTop);
    _sB.write(outMid);
    _sB.write(outMBot);
    _sB.write(outBl);
    _sB.write(outBr);
    _sB.write(outFooter);
    return _sB;
  }

  ///  Sizes of out-buffers
  void outBuffersSizes(String caller) {
    String outHeaderLS = outHeader.length.toString();
    String outTlLS = outTl.length.toString();
    String outTMidLS = outTMid.length.toString();
    String outTrLS = outTr.length.toString();
    String outMTopLS = outMTop.length.toString();
    String outMidLS = outMid.length.toString();
    String outMBotLS = outMBot.length.toString();
    String outBlLS = outBl.length.toString();
    String outBrLS = outBr.length.toString();
    String outFooterLS = outFooter.length.toString();

    //  NOTE  Will eventually be list, for devBox.
    print('--------------- outBuffersSizes  C: $caller  ----------------');
    print(' outHeader::  $outHeaderLS');
    print(' outTl::  $outTlLS ');
    print(' outTMid::  $outTMidLS ');
    print(' outTr::  $outTrLS ');
    print(' outMTop::  $outMTopLS ');
    print(' outMid:  $outMidLS ');
    print(' outMBot::  $outMBotLS ');
    print(' outBl::  $outBlLS ');
    print(' outBr::   $outBrLS');
    print(' outFooter::  $outFooterLS ');
    print('--------------- outBuffersSizes  C: $caller   :done: ----------');
  }

///
  void build() {
    //  outBufM.put
    outBufM.putIfAbsent('outHeaderBuf', () => outHeader);
    outBufM.putIfAbsent('outTlBuf', () => outTl);
    outBufM.putIfAbsent(
      'outTMidBuf',
      () => outTMid,
    );
    outBufM.putIfAbsent(
      'outTrBuf',
      () => outTr,
    );
    outBufM.putIfAbsent(
      'outMTopBuf',
      () => outMTop,
    );
    outBufM.putIfAbsent(
      'outMidBuf',
      () => outMid,
    );
    outBufM.putIfAbsent(
      'outMBotBuf',
      () => outMBot,
    );
    outBufM.putIfAbsent(
      'outBlBuf',
      () => outBl,
    );
    outBufM.putIfAbsent(
      'outBrBuf',
      () => outBr,
    );
    outBufM.putIfAbsent(
      'outFooterBuf',
      () => outFooter,
    );
  }     //     -----     void build

  ///
}      //     -----  class out

///  Creating instance of class with constructor.
Out out = Out();

///  Other buffer-classes are not yet in use.
//  var outA = new OutBase();  //  app
//  var outD = new OutBase();  //  dev
//  var outM = new OutBase();  //  mission

//  TODO  bring here from dawoApp serialized outBuffersPrint - function

//  Chore-extends, DawoHist implements. Flag  use this
///     usage:   chore, connector, box_serve, dawo_hist
abstract class BaseStruct {
  String name = '';
  String info = '';
  ///  using now Map:  say
  Map<String, String> say = {};
  String motto = '';

  //  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  String clause = ''; //  Combination of #LANG words in sentence.
  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  /// like:  ":DAWO-APP:";
  String seal = '';
  ///  or this emblem.
  String emblem = '';
  ///  3-5-7 empty marks or something visible.
  ///  like:  "      ";
  String indent = '';
  ///  Object that owns this.
  String master = '';

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
  void init();

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

///  Every app-mission-chore creates new Placard for EVERY new operation (?)
///  or at-least gives it as parameter, to functions.
abstract class BasePlacard {
  //  Order: #actor #sender #receiver #command #msg
  String actor = '';
  String sender = '';
  String receiver = '';
  String command = '';
  String msg = '';
}     //     -----     BasePlacard

///  base class that serves objects that can have members.
///  #connector is using this
class Group {
  String name = '';
  Map<String, Member> memberM = {};
}

///  base class that serves objects that can be members in some group.
///  #connector is using this
class Member {
  String name = '';
  String group = '';
}

///  Base for this class. Representation of an object, that does something.
class Actor {
  String name = '';

  ///  Structure of say-map elsewhere:
  Map<String, String> say = {
    'purpose': '',
    'lang': '',
    'area': '',
    'product': '',
    'sell': '',
    'buy': '',
    'ask': '',
    'always': '',
    'newer': ''
  };
}     //     -----     class Actor

///  Base
class Action {
  String name = '';
  ///
  Map<String, String> say = {
    'purpose': '',
    'lang': '',
    'area': '',
    'product': '',
    'sell': '',
    'buy': '',
    'ask': '',
    'always': '',
    'newer': '',
  };
  /// IDEA: Map<String, Map<String, String>> reason = {};
  Map<String, String> reason = {
    'anti': '',
    'why': '',
    'whyNot': '',
    'plus': '',
    'minus': '',
    'desicion': '',
  };

}      //     -----     class Action
//