// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Helper tools, like: longestItemInList() and  changeLetter(String..)
///  Mostly String and list manipulation and Map printing aso. This kind of
///  stuff is most valuable to beginner programmers, and developing this has
///  taken time. Fixing bugs only when something throws.
/// * Also some #stamp date-time aso. functions.
/// * dawo version:   0.3.0.  23.3.2022.    devState : 50 %
/// * Includes certainly some mistakes, miss-namings and You-Can-Do-It-Better #QUEST
/// * in GIT:  yes.  Blog post:  should b.
/// * PLAN:  develop some _private inside functions and variables.??
/// * PLAN: ? Move to own directory, tools.
/// * PLAN: Split: tools_base, tools_tricks, tools_stamps, tools_coll, tools.
// Hist:  hkl  2014  0.0.1  dawo/lib

library tools;

import 'dart:math';
import 'package:intl/intl.dart';

///  Was statistics and getter practice.
num toolsReadiness = 96;

///  Buffer also outside class, for testing and adding visibility.
StringBuffer toolsBuf = StringBuffer();

///  Class Tools is instantiated as: tl  Very handy, you gonna like it!
class Tools {
  ///  QUEST: can this be done in one row?
  ///  Return iterable List from StringBuffer.
  List<String> bufToList(StringBuffer buf) {
    List<String> _l = [];
    String _s = buf.toString();
    _l.addAll(_s.split('\n'));
    return _l;
  }

  ///  Longest item in List<String>
  int longestItemInList(List<String> _l) {
    int _longest = 0;
    for (var x = 0; x < _l.length; x++) {
      if (_l[x].length > _longest) {
        _longest = _l[x].length;
      }
    }
    return _longest;
  }

  ///  Method for informative list-printing.
  void listShow(List _l, String caller) {
    String l = _l.length.toString();
    print('\n       :ls:-->-->  caller:: $caller  length:: $l   -->-->--');
    _l.forEach(print);
    print('      --:ls:--<<--<<--<<    done    --<<--<<--<<--<< \n');
  }

  ///  Counts items in inner list
  int countInnerList(List<List<String>> _l) {
    int i = 0;
    for (var x in _l) {
      int z = (x.length);
      i = (i + z);
    }
    return i;
  }

  ///  Counts items in inner list
  int countInnerMap(List<Map<String, String>> _l) {
    int i = 0;
    for (var x in _l) {
      int z = (x.length);
      i = (i + z);
    }
    return i;
  }

  ///  Making for example vertical lines for box
  List<String> strToList(String str, int count) {
    List<String> l = [];
    for (int i = 0; i < count; i++) {
      l.add(str);
    }
    return l;
  }

  ///  :QUEST:  ??  Make it better with regExp?
  ///  Change letter/s in a String
  String changeLetter(String inS, int pos, String newS) {
    //print(inS);
    int length = inS.length;
    String _s1 = inS.substring(0, pos - 1);
    //print(_s1);
    String _s2 = inS.substring(pos, pos + 1); //  wanted OLD letter for change
    _s2 = newS; //  Now it is changed
    //print(_s2);
    String _s3 = inS.substring(pos, length);
    //print(_s3);
    String s4 = '$_s1$_s2$_s3';
    //print(s4);
    return s4;
  }

  ///  Copied schema from shower.dart highValue List.
  ///  Demand number 0-9 to be in formats:   X:N,   T:7  U:5 aso.
  ///  Find 2 int in Strings like:  V:3 E:7  >  3, 7
  ///  Map value: 'January x-plan is for V:3 and that demands E:7 to complete.'
  List<List<int>> valuesInStr(
      List<Map<String, String>> _inlM, String _inS1, _inS2) {
    List<List<int>> _retL = [];
    for (var x = 0; x < _inlM.length; x++) {
      for (var y in _inlM[x].keys) {
        //  howTo NULL indexOf
        int _pos1 = _inlM[x][y]!.indexOf(_inS1); //  like 'V:'
        int _pos2 = _inlM[x][y]!.indexOf(_inS2); //  like 'E:'

        int val_1 = -1;
        int val_2 = -1;
        //  check if we got 2 numbers and act for it
        //  howTo NULL  hklTry  new String
        //  String check = _inlM[x][y].substring(_pos1 + 2, _pos1 + 3);
        //  2 String fields for check
        String check1 = ''; //  make String instance
        //  OK with !
        check1 = _inlM[x][y]!.substring(_pos1 + 2, _pos1 + 3);

        if (tl.isNumber(check1)) {
          val_1 = int.parse(_inlM[x][y]!.substring(_pos1 + 2, _pos1 + 3));
        }
        //  hklTry: !
        String check2 = _inlM[x][y]!.substring(_pos2 + 2, _pos2 + 3);
        if (tl.isNumber(check2)) {
          val_2 = int.parse(_inlM[x][y]!.substring(_pos2 + 2, _pos2 + 3));
        }
        _retL.add([val_1, val_2]); //  like: 5, 4  /  -1, 3
      } //  --  for (var y in _inlM[x].keys)
    }
    return _retL; //  [1,3 ], [5,4], [6,4], [3,8], [9,5] ....
  }     //     -----     valuesInStr

  ///  Return List of items, where #String exist. from dawo-tools.
  List<String> StrInList(List<String> _l, String _s) {
    List<String> _queryL = [];
    for (var x = 0; x < _l.length; x++) {
      //  using now #contains instead of: if (_l[x].indexOf(_s) > -1)
      if (_l[x].contains(_s)) {
        _queryL.add(_l[x]);
      }
    }
    return _queryL; // 0-length check in the receiver side.
  }

  ///  Return String from List of Strings.
  String listToString(List<String> _l) {
    print('>>----:dawo:tools:--:listToString:---- >>');
    print(_l);
    String s;
    StringBuffer sBuf = StringBuffer();
    for (var x = 0; x < _l.length; x++) {
      print(_l[x]);
      sBuf.write(_l[x]);
      sBuf.write(' ');
    }
    print('<< -----------------------------------  <<');
    s = sBuf.toString();
    return s;
  }     //     -----     listToString

  ///
  List<String> listListIntToListString(List<List<int>> inL) {
    List<String> retL = [];
    for (var x in inL) {
      String s = x.toString();
      retL.add(s);
    }

    return retL;
  }     //     -----     listListIntToListString

  ///  Add padLeft & padRight Strings to make this more useful.
  ///  Pad List right and left with: _leS, _raS and make all even length
  void padListRL(List<String> _l, int _w, String _leS, _raS) {
    //  Add new parameter, asked width: _w
    //  Using here new Tools, tl class.
    //  If asked shorter rows.
    int long = min(tl.longestItemInList(_l), _w);
    //  looks funny, surely we can make better :)
    for (var x = 0; x < _l.length; x++) {
      //  int itemLength = _l.length;  //  length NOW
      String _thisItem = _l[x];
      String _s = ('$_leS$_thisItem');
      String _ss = _s.padRight(long + 2, _raS);
      _l[x] = _ss;
      //  Pad every item right with _leS, _raS to length of the longest item.
    }
  }     //     -----     padListRL

  //  Want to get List items to max certain length.
  void shortenItemsInList(List<String> _l, int _w) {
    String s;
    for (var x = 0; x < _l.length; x++) {
      s = _l[x];
      if (_l[x].length > _w) {
        _l[x] = s.substring(0, _w);
      }
    }
  }

  ///  box_serve aBox(int _r, _c, _items, _w, List __l) calls this
  ///  Fill list-box-data in big matrix List, in r, _c coordinates.
  ///  change to bool!
  boxInList(
      //:BUG:DEBUG:  if field-length <_w  => rangeError in called functions.
      int _r,
      int _c,
      _asked,
      _w,
      List<String> boxL,
      List<String> masterL) {
    //  new parameters _asked, _w :  items and asked output width
    if (_w < longestItemInList(boxL)) {
      shortenItemsInList(boxL, _w);
    }

    ///  Only >2 width lists are padded
    if (_w > 2) padListRL(boxL, _w, ' ', ' ');
    int _take = min(boxL.length, _asked); //  All or asked amount.
    //  Take to var, how many items was left out.
    //  Strict type, use:  toInt
    int leftOver = (boxL.length - _asked).toInt(); // count not printed items
    if (leftOver > 0) {
      String _loS = leftOver.toString();
      String _loS2 =
          boxL[_take - 1].substring(0, _w - 7) + ':+:' + _loS; //  nearly _w.
      //  Modify last item in list_
      boxL[_take - 1] = _loS2; //  done: Like:  Item
    }
    for (var x = 0; x < _take; x++) {
      //  Control for range errors
      int itemLength = boxL[x].length;

      int matrixRowLength = masterL[_r].length; // ?

      String _s1 = masterL[_r].substring(0, _c);
      String _s2 = boxL[x]; //  current list value.
      String _s3 = masterL[_r].substring(_c + itemLength, matrixRowLength);
      masterL[_r] = '$_s1$_s2$_s3';
      _r++;
    }
  }      //     -----     boxInList

  ///  Just a note, howTo print a map.
  void operationMapPrint(Map thisMap) {
    thisMap.forEach((k, v) {
      print('$k, $v');
    });
  }

  ///  Just to print map in one row.
  void shortMapPrint(Map thisMap) {
    print(thisMap);
  }

  ///  Return String from map<String, String>.
  ///  parameters: Key_width: kw, Value_width  vw
  String rowFromMap(Map<String, String> thisMap, int kw, vw) {
    StringBuffer b = StringBuffer();
    thisMap.forEach((k, v) {
      String _kS = k; //  key-String,  value_String
      String _vS = v;
      if (kw > 0) _kS = k.substring(0, kw);
      if (vw > 0) _vS = k.substring(0, vw);
      b.write('$_kS $_vS  '); //  write modified key-value to buffer
    });
    return b.toString();
  }

  //  howTo Map increment
//  https://stackoverflow.com/questions/56943363/dart-map-increment-the-value-of-a-key
//** flutter:  extension CustomUpdation on Map<dynamic, int> {
//** flutter:    int increment(dynamic key) {
//** flutter:      return update(key, (value) => ++value, ifAbsent: () => 1);
//** flutter:    }
//** flutter:  }

  /*
void main() {
  final map = <String, int>{};
  map.increment("foo");
  map.increment("bar");
  map.increment("foo");
  print(map); // {foo: 2, bar: 1}
}
 */

  ///  Return list<String> from map<String, String>.
  List<String> mapToFineList(Map<String, String> thisMap, int _kl, _vl) {
    //  parameters int _kl, _vl for value and key lengths in "table"
    List<String> _l = [];
    thisMap.forEach((k, v) {
      //  Truncate or padRight it
      //  Must guarantee to length and minimum
      String _ks = '';
      String _vs = '';
      if (k.length < _kl) {
        //  ? + 1
        _ks = k.padRight(_kl + 1);
      } else {
        //  but it may be shorter
        _ks = k.substring(0, _kl);
      }
      ;

      if (v.length < _vl) {
        _vs = v.padRight(_vl + 1);
      } else {
        //  but it may be shorter
        _vs = v.substring(0, _vl);
      }
      ;
      String _s = '';
      _s = '$_ks $_vs';
      _l.add(_s);
    } // --  thisMap
        ); //  --  forEach k v
    return _l;
  }      //     -----     mapToFineList

  /*


      */

  ///  Return list<String> from map<String, String>.
  List<String> mapToList(Map<String, String> thisMap) {
    List<String> _l = [];
    thisMap.forEach((k, v) {
      String _s = '';
      _s = '$k$v';
      _l.add(_s);
    });
    return _l;
  }

  ///  Return list<String> from map<String, Bool>.
  List<String> mapToListB(Map<String, bool> thisMap) {
    List<String> _l = [];
    thisMap.forEach((k, v) {
      String _s = '';
      _s = '$k, $v';
      _l.add(_s);
    });
    return _l;
  }

  ///  Return list<String> from map<String, Int>.
  List<String> mapToListI(Map<String, int> thisMap) {
    List<String> _l = [];
    thisMap.forEach((k, v) {
      String _s = '';
      _s = '$k $v';
      _l.add(_s);
    });
    return _l;
  }

  ///  Return list<String> from map<String, Int>.
  Map<String, String> map_SI_toMapSS(Map<String, int> thisMap) {
    Map<String, String> _rM = {};
    thisMap.forEach((k, v) {
      //  _rM.putIfAbsent(k, () => null);
      ///  :hkl:fix:  4.9.2020
      _rM.putIfAbsent(k, () => v.toString());
    });
    return _rM;
  }

  ///  TODO Trying to handle String, Mission with this for connector
  ///  Is #Object enough?
  ///  Return list<String> from map<String, Bool>.
  List<String> mapToListO(Map<String, Object> thisMap) {
    List<String> _l = [];
    thisMap.forEach((k, v) {
      //  we get:  Instance of 'Mission',  unless use: toString()
      String _v;
      _v = v.toString();
      String _s = '';
      _s = '$k, $_v';
      _l.add(_s);
    });
    return _l;
  }

  ///  print Map<String, Map<String, String>>  map nicely
  void printStringMapMap(Map<String, Map<String, String>> _map) {
    int _length = _map.length;
    print(':D-T: #printStringMapMap : length:  $_length  ');
    List<String> nameL = _map.keys.toList();
    for (var x = 0; x < _length; x++) {
      String name = nameL[x];
      //  howTo NULL int num :  int _l   OR: ready value  int _l = 0;
      //  NO-toInt   int _l = _map[name].length.toInt();
      int _l = 0;
      //  howTo NULL Map-field-length    noComprendo
      //  OK with  !  and  toInt()
      _l = _map[name]!.length.toInt();

      print('\n mapName: $name -------------- length: $_l -----------------');
      //  TODO  Return map in sort-order: value.
      //  howTo NULL Map  ! OK
      _map[name]!.forEach((k, v) => print('$k, $v'));
    }
  }     //     -----     printStringMapMap

  ///  TODO  did it go right? No.
  ///  print Map<String, Map<String, String>>  map nicely
  void printStringMapMapFail(Map<String, Map<String, String>> _map) {
    int _length = _map.length;
    List<String> nameL = _map.keys.toList();
    for (var x = 0; x < _length; x++) {
      String name = nameL[x];
      //  howTo NULL int
      int _l = _map[name]!.length;
      print('\n mapName: $name -------------------------------');
      for (var z = 0; z < _l; z++) {
        //  howTo NULL  Map-index  OK
        print(_map[name]![z]);
      }
      print(_map[x]);
    }
  }     //     -----     printStringMapMapFail

  ///  QUEST:  sure you can do better?
  ///  is it number?
  bool isNumber(String _s) {
    bool retB = false;
    //  using #contains, instead of if   ('0123456789'.indexOf(_s) > -1)
    if ('0123456789'.contains(_s)) {
      retB = true;
      //  print('------------yep, is number');
    }
    return retB;
  }

  /// some class tests.. for #teamNext use
  var strLin = '----------------------------------------         ';

  ///  Long line with same mark.
  String strMark(String mark, int l) {
    String _s = '';
    String _r = '';
    //  String padding = mark;
    _r = _s.padRight(l, mark);
    return _r;
  }

  ///  To print class, that is commonly used in dawo
  void printClass(var thisClass, String str1, String str2, String str3) {
    print(strLin + thisClass.runtimeType.toString());
    print('Class runtime type:  ' + thisClass.runtimeType.toString());
    print('Class to string:  ' + thisClass.toString());
    // that presumes that class fas these fields
    print(thisClass.name);
    print(thisClass.motto);
    print(thisClass.info);
    print('');

    print(thisClass.description);

    print('par1:  ' + str1);
    print('par2:  ' + str2);
    print('par3:  ' + str3);

    print(' ');
    print(' ');
  }     //     -----     printClass

//   dawoMapApps.forEach((k,v) => print('Key:  $k  Value:  $v  '));

  ///  some functions for to print two values
  void printSS(String str, String str2) {
    print(str + '  ' + str2);
  }

//  Printing numeric and String values.
  void printNS(num n, String str2) {
    print(n.toString() + '  ' + str2);
  }

//  Printing numeric value.
  void printN(num n) {
    print(n.toString);
  }

  //
  String stampDateTime() {
    var start = DateTime.now();
    //  print('Start::  $start ');
    /*
    //NOTE:  dateFormat is in:   intl  package
    var formatterYmd = new DateFormat('yyyy-MM-dd');

    String formattedYmd = formatterYmd.format(now);
    //  print(formattedYmd); // something like 2013-04-20
    //  Hms
    var formatterHms = new DateFormat('Hms');
    String formattedHms = formatterHms.format(now);
    //  print(formattedHms); // something like 20:45:12

    String dateTimeStampNow = formattedYmd + ' ' + formattedHms;
    //  print(dateTimeStampNow);
    */
    //  testDateSlug();
    //  return dateTimeStampNow;
    //  TODO  Handle 'Start::' aso. with String parameter.
    return 'Start::  $start ';
  }

  ///  Look at the comments in previous function.
  ///  Output like:  2017-12-23  08:47:27
  String stampDateTimePlain() {
    var now = DateTime.now();
    var formatterYmd = DateFormat('yyyy-MM-dd');
    String formattedYmd = formatterYmd.format(now);
    var formatterHms = DateFormat('Hms');
    String formattedHms = formatterHms.format(now);
    var dateTimeStampNow = (' $formattedYmd  $formattedHms ');
    return dateTimeStampNow;
  }     //     -----     stampDateTimePlain

  ///  Small sleep-methods, to get time, to see, what is happening in tests.
  void sleepSimple(int waitingTime) {
    //  1000 =  one second
    //var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
    var goalTime =
        DateTime.now().add(new Duration(milliseconds: waitingTime));
    do {} while (new DateTime.now().compareTo(goalTime) < 0);
  }

  ///  Sleep method with time and optional infoB boolean for info-printing.
  ///  the parameter infoB can't cant have a value 'null' because of its tye,
  ///  but  implicit default value = null
  ///  try adding explicit non-null default value or the 'required' modifier
  ///  OK Done
  ///  void sleepMS(int waitingTime, [bool infoB]) {
  ///  callers:  No usages found
  void sleepMS(int waitingTime, [bool infoB = false]) {
    //  var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
    var goalTime =
        DateTime.now().add(new Duration(milliseconds: waitingTime));
    bool _infoB = infoB;
    if (_infoB) (print('Waiting for  $waitingTime'));
    do {
      //  var timeNow = new DateTime.now();
    } while (new DateTime.now().compareTo(goalTime) < 0);
    if (_infoB) (print('waiting time over over'));
  }     //     -----     sleepMS

//  Some sample maps for #teamNext use.
  Map<String, bool> toolsActive = {
    'leftActive': true,
    'rightActive': false,
    'topActive': false,
    'bottomActive': true,
    'middleActive': true
  };

  ///  sample map
  Map<num, String> toolsSpeed = {
    1: 'Speed',
    2: 'Hurry',
    3: 'Schedule',
    4: 'Slow',
    5: 'Delayed'
  };

  ///
}      //     -----     class Tools

///  Making instance with construcgtor
Tools tl = Tools();
