//  Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file.
//
///  ##  mixin   Constructing base-class and mixin elements
///              for 64 classes in dawo
/// * dwv: version:   1.0.1.  11.4.2022.  -  devState:  5%
/// * GitHub: .
/// * State:  schema
/// *
/// * howToMixin  Learn to use first letters:  mx, jn, jng, rll,
/// * howToMixin   FIND usages and calls
/// * howToMixin   START:  choose 4-5  usage classes
/// * howToMixin   input - output means
/// * howToMixin
/// * howToMixin DO:    NAME:  stir()  stirGo()
/// * howToMixin DO:    NAME:  howl()  howlGo()
/// * howToMixin DO:    NAME:  mixy()  mxGo()
//
/*  howTo:mixin
Mixins in Dart are a way of using the code of a class again in multiple class
hierarchies. We make use of the with keyword followed by one or more mixins names.
Mixins encourage code reuse and can be used to avoid the inheritance ambiguity
that multiple inheritance can cause (the "diamond problem"), or to work around
lack of support for multiple inheritance in a language.
A mixin can also be viewed as an interface with implemented methods.
There are two main situations where mixins are used:
You want to provide a lot of optional features for a class.
You want to use one particular feature in a lot of different classes.



 */

part of alpha;

///  keep mixin's common data and methods
///  Mixin helper and commander Boss class
class MxBossMixin {
  ///  print State bool
  bool prSt = true;

  ///
  String mxChainSSample = ':97531mx13579:';

  ///
  String mxChainS = ':97531 mx13579 :xxmClass';
  //
  String mxName = ':mixin:Class:name:';
  //
  int mxCallCount = 0;
  //
  String mxReadyMsg = ':mixin:Class:Ready:';
  //
  String mxLOGO = ':mx:LOGO:';

  String mxInfoS = '* mixin in dawo: ';
  //
  StringBuffer mxBossBuf = StringBuffer();

  /// presenting:   print(' $mxC.mxLOGO : ....
  List<String> mxMsgL = [];

  ///
  List<String> mxLogL = [];

  ///
  List<String> mxRegL = [];

  ///
  List<String> mxSigL = [];

  ///
  Map<String, String> mxSayM = {
    'a': '',
    'b': '',
    'c': '',
  };

  //   Call: mxC.mxActMsg(':caller:', ':msg:)
  String mxActMsg(String _caller, String _msg) {
    //  use:  _mxChainS  from  mixin
    mxCallCount++;
    String caller = '';
    caller = _caller;
    String msg = '';
    msg = _msg;

    String _sS = (':mx:mixin:act:N:  $mxCallCount C: $caller  Msg:$msg');
    mxSigL.add(_sS);

    String _sS2 = (':mx:mixin:act:N:  $mxCallCount C: $caller  Msg:$msg');
    mxSigL.add(_sS2);

    print(':mx:mixin:act:N:  $mxCallCount C: $caller  Msg:$msg');
    return ':mx:mixin:act:N:  $mxCallCount C: $caller  Msg:$msg';
  } //     -----      mxActMsg

  //  String _mxChainS = ':97531 mx135 79:JoinMxx';
  ///  String :  "mx135 " marks box-method for mixin system
  //  Out:paste from glb:   void mxxBox (String _caller) { //  :code:box:   }
  ///  Calling boxServe-class for info.
  ///  Name: TODO   can not be simple box  =>  mxBossBox
  ///  Error:  box can not be used in alpha-library
  ///  mxBossBox moved to venue library

} //     -----     MxBossMixin   -------------------------------------------

//  instance:mixin,  mixinClass
//  usage:   27  Using this instance in example
MxBossMixin mxC = MxBossMixin();

///  Other instance:mixin
///  usage:
MxBossMixin mxBossNotUsed = MxBossMixin();

///  TODO: mixin    Use in classes, for to see behaviour

///  ?  Mixin, that has a name, acts name-based information
///  ? and can be registered to dcReg, dawo-class-Register
///  For to FIND: extends MisInterfaceBasis with RllMxx, ParcelMxx
///     with search: "with Mxx" should be TODO  rename to  MxxName  aso.
///     but:  Search Mxx {    brings now all the mixin's Mxx...  7 pcs
///  1. Stupid Name.. DONE:  change to =   JoinMxx
///  2. Change methods DONE:   jnXXX   jn :0x
///  3. Mixin for making contacts, glutch, and changing information
///  4.
mixin JoinMxx {
  ///
  String _jnChainSSample = ':97531mx13579 :';

  ///
  String _jnChainS = ':97531 mx1357 9:JoinMxx';
  String jnName = ':JoinMxx:';
  String jnNameLOGO = ':jnName:LOGO:';

  ///
  String jnMotto = '';

  ///  Register object to...group aso
  String jnReg = '* reg where this is regisgtered';
  //
  Map<String, bool> jnRegStM = {
    'jnDoB': true,
    'jnIsB': false,
    'jnCanB': false,
    'jnConduct': false,
  };
  //
  void jnAct(String caller, String msg) {}

  ///
  List<String> jnMembL = [];

  ///  Action to other registered members
  void jnActViaReg(String _caller, String _msg) {
    print(':name:mxx:  :jn:Act:Via:reg:  C: $_caller  msg:  $_msg ');
    String sLOGO = 'c:LOGO  $mxC.mxLOGO  mLOGO: $jnNameLOGO msg:  $_msg';
    if (jnRegStM['jnDoB']!) {
      print(' $mxC.mxLOGO : doing Reg-op:  $sLOGO');
    } else if (jnRegStM['jnIsB']!) {
      print(' $mxC.mxLOGO : Waving hands for jnJoinMe * ');
    } else {
      print(' $mxC.mxLOGO : Humming to self');
    } //  if else else
    mxC.mxLogL.add(':jn:msg:C: $jnNameLOGO  $sLOGO  $_caller  Msg: $_msg');
    mxC.mxActMsg(_caller, _msg);
    //  mxActMsg(String _caller, String _msg)
  } //  void

  ///
  void jnJoinMe(String _caller, String _msg) {
    if (jnRegStM['jnDoB']!) {
      print(' $mxC.mxLOGO : doing Reg-op');
    } else if (jnRegStM['jnIsB']!) {
      print(' $mxC.mxLOGO : Waving hands for jnJoinMe * ');
    } else {
      print(' $mxC.mxLOGO : Humming to self');
    } //  if else else
    mxC.mxLogL.add(':jn:msg:C:  $_caller  Msg: $_msg');
  } //  void

} //     -----      mixin NameReg

///  Mixin, that has roll aso. methods,  can roll  APG-like textual data
///  IDEA:  master calls these methods
///  IDEA:can  play   roll-like activities on coming data
///  IDEA:has loop with init-build-act-roll-done-show-sleep methods
///  IDEA: Might act simultaneously with classes ROLL-action
///  IDEA:has ready counters and statistics
///  IDEA: is kind of super-parallel roll
///
///  NAME:   ra is too common,   rl 85x  TODO  rll 0x
///  Usage:    corp:Affair
mixin RllMxx {
  String rllChainSSample = ':97531mx13579:';
  String rllChainS = ':97531 mx1357 9:RllMxx:';
  String rllName = 'rllMxx';

  ///
  bool rllCanPlayB = false;
  bool rllCanComposeB = false;
  bool rllCanConductB = false;

  ///
  Map<String, bool> rllStM = {
    'first': true,
    'second': false,
    'rllCanPlay': false,
    'aCanCompose': false,
    'rllCanConduct': false,
  };
  //  howTo mixin connect master/host:method     init();
  void rllInit() {}

  ///
  void rllBuild() {}

  ///
  void rllAct() {}

  ///
  void rllRoll() {}

  ///
  void rllSleep() {}

  ///
  void rllDone() {}

  ///  mixin
  void rllCall(String _caller, String _msg) {
    print(':rll:Mxx:  :rll:Call: C: $_caller  msg:  $_msg ');
    if (rllStM['rllCanPlay']!) {
      print(' $mxC.mxLOGO : :rll:canPlay:');
    } else if (rllStM['rllCanConduct']!) {
      print(' $mxC.mxLOGO : :rll:Can:Conduct:');
    } else {
      print(' $mxC.mxLOGO : :no:Play:');
    }
    mxC.mxLogL.add(':rll:msg:   C:  $_caller  Msg: $_msg');
  } //  void
} //     -----      mixin RllMxx

///  Has lang methods to use, is optimized to use Word and phrases
///  Can act common dawo-textual information fields
///  Mixin, that has textual data, for objects,that do not have
///  NAME: change all properties to say??   no:  Tell
///  WORD: say  in dawo +100x
///  CHANGE:TO   tell   1x
///  WORD: parcel       relay:  1x
mixin TellMxx {
  //  TODO  bad for having 6 this-named fields in 5 mixin's
  //  usage:  no
  String tellChainSSample = ':97531mx13579:';

  ///  usage:   no
  String tellChainS = ':97531 mx1357 9:TellMxx';
  String tellName = ':TellMxx:';

  ///  Testing, Recording simple events, to track activity / flow.
  List<String> tellLogL = [];

  ///  Testing, Meaningful, demanding action events, to track activity / flow.
  List<String> tellSigL = [];
  //  LangLL #language
  List<List<String>> tellLangLL = [
    [' * * *        :mis:lang:basis:                * * *'],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    [' * * *                                          * * *']
  ]; //     langLL
  //   usage:    tellStM['']!
  Map<String, bool> tellStM = {
    'canPlayPiano': false,
    'canCompose': false,
    'canConduct': false,
    'a': false,
    'b': false,
  };

  Map<String, String> tellM = {};

  ///
  void tellCall(String _caller, String _msg) {
    print(':mx:Tell:Call:   mxx:   C: $_caller  msg:  $_msg ');
    print(' :mx:tellCall:start: ');
    // bug:   if (tellStM['canPlayPiano']!) {
    // bug:     print(' $mxC.mxLOGO : Playing piano');
    // bug:   } else if (tellStM['canCompose']!) {
    // bug:     print(' $mxC.mxLOGO : Waving hands');
    // bug:   } else {
    // bug:     print(' $mxC.mxLOGO : Humming to self');
    // bug:   }  //  if else else
    print(' :mx:tellCall:done: ');
    mxC.mxLogL.add(':tellb:msg:C:  $_caller  Msg: $_msg');
  } //  void  tellCall
} //     -----      mixin TellMxx

///  Mixin, that has textual data for msg message mediating and handling.
///  Transports info-parcels in NODE-routes system ladder and
mixin ParcelMxx {
  String mxChainSSample = ':97531mx13579:';

  ///  Problem:  these do override previous mixin
  String mxChainS = ':97531 mx1357 9:ParcelMxx';
  String mxParcelName = ':mxParcel:';
  //
  Map<String, bool> msgStM = {
    'hasMsg': false,
    'hasConnect': false,
    'canAnalyze': false,
  };

  ///  Testing, Recording simple events, to track activity / flow.
  List<String> logL = [];

  ///  Testing, Meaningful, demanding action events, to track activity / flow.
  List<String> sigL = [];
  //  LangLL #language
  List<List<String>> langLL = [
    [' * * *        :mis:lang:basis:                * * *'],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    [' * * *                                          * * *']
  ]; //     langLL
  ///
  Map<String, String> sayM = {};

  ///
  void msgHandle(String _caller, String _msg) {
    print(':parcel:say:msg:Handle:   C: $_caller  msg:  $_msg ');
    //  TODO  Check : analyze msg
    if (msgStM['hasMsg']!) {
      print(' $mxC.mxLOGO : * :has:Msg: *');
    } else if (msgStM['hasConnect']!) {
      print(' $mxC.mxLOGO : * no-msg-inline');
    } else {
      print(' $mxC.mxLOGO :  *waiting idle * ');
    }
    mxC.mxLogL.add(':msgAb:msg:   C:  $_caller  Msg: $_msg');
  } //  void
} //     -----      mixin ParcelMxx

///  Mixin, that has textual data for msg message mediating and handling.
///  Simple VED elements generator and valuator
///  VED  =  Value, effort, done:  Like: VED:  V:3 E:8 D:0
mixin VedMxx {
  String mxChainSSample = ':97531mx13579:';

  ///  TODO: can this be changed to:   vedChainS ??
  String mxChainS = ':97531 mx1357 9:VedMxx:';
  String vedMxxName = ':vedMxx:';
  //
  Map<String, bool> vedStatM = {
    'hasMsg': false,
    'hasConnect': false,
    'canAnalyze': false,
  };

  ///  Testing, Recording simple events, to track activity / flow.
  List<String> vedlogL = [];

  ///  Testing, Meaningful, demanding action events, to track activity / flow.
  List<String> vedsigL = [];
  //  LangLL #language
  List<List<String>> vedlangLL = [
    [' * * *        :mis:lang:basis:                * * *'],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    [' * * *                                          * * *']
  ]; //     langLL
  ///
  Map<String, String> vedsayM = {};

  ///
  void vedMsgHandle(String _caller, String _msg) {
    print(':ved:mxx:   C: $_caller  msg:  $_msg ');
    //  TODO  Check : analyze msg
    if (vedStatM['hasMsg']!) {
      print(' $mxC.mxLOGO : * :has:Msg: *');
    } else if (vedStatM['hasConnect']!) {
      print(' $mxC.mxLOGO : * no-msg-inline');
    } else {
      print(' $mxC.mxLOGO :  *waiting idle * ');
    }
    mxC.mxLogL.add(':ved:msg:   C:  $_caller  Msg: $_msg');
  } //  --   void  vedMsgHandle

} //     -----      mixin VedMxx mxMsgHandle

///
mixin MusicalMxx {
  String mxChainSSample = ':97531mx13579:';
  String mxChainS = ':97531 mx1357 9:';
  String mxMusicalName = ':mx:musical:';

  ///
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  ///
  Map<String, bool> musicalM = {
    'a': true,
    'b': true,
    'c': true,
    'd': true,
  };

  ///
  void entertainMe(String _caller, String _msg) {
    print(':musical:mxx:     C: $_caller  msg:  $_msg ');
    if (canPlayPiano) {
      print(' $mxC.mxLOGO : Playing piano');
    } else if (canConduct) {
      print(' $mxC.mxLOGO : Waving hands');
    } else {
      print(' $mxC.mxLOGO : Humming to self');
    }

    ///
    mxC.mxLogL.add(':musical:msg:C:  $_caller  Msg: $_msg');
  } //  void

} //     -----      mixin MusicalMxx
