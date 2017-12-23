// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Helper tools, like: longestItemInList() and  changeLetter(String..)
///  Mostly String and list manipulation and Map printing aso. This kind of
///  stuff is most valuable to beginner programmers, and developing this has
///  taken time. Fixing bugs only when something throws.
/// * Also some #stamp date-time aso. functions.
/// * dawo version:  0.0.7.  18.12.2017    devState : 50 %
/// * Includes certainly some mistakes, miss-namings and You-Can-Do-It-Better #QUEST
/// * in GIT:  yes.  Blog post:  should b.
/// * PLAN:  develop some _private inside functions and variables.??
// Hist:  hkl  2014  0.0.1  dawo/lib

library tools.dart;

import 'dart:math';
import 'package:intl/intl.dart';

///  Was statistics and getter practice.
num toolsReadiness = 96;

///  Buffer also outside class, for testing and adding visibility.
var toolsBuf = new StringBuffer();

///  instantiated as: tl  Very handy, you gonna like it!
class Tools {
  ///  Return iterable List from StringBuffer.
  List<String> bufToList(StringBuffer buf) {
    List<String> _l = new List();
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

  ///  :QUEST:  ??
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

  ///  Return List of items, where #String exist. from dawo-tools.
  List<String> StrInList(List<String> _l, String _s) {
    List<String> _queryL = new List();
    for (var x = 0; x < _l.length; x++) {
      if (_l[x].indexOf(_s) > -1) {
        _queryL.add(_l[x]);
      }
    }
    return _queryL; // 0-length check in the receiver side.
  }

  ///  Return String from List of Strings.
  String listToString(List<String> _l) {
    print(_l);
    print(_l[0]);
    String s;
    StringBuffer sBuf = new StringBuffer();
    for (var x = 0; x < _l.length; x++) {
      print(_l[x]);
      sBuf.write(_l[x]);
      sBuf.write(' ');
    }
    s = sBuf.toString();
    return s;
  }

  ///  Add padLeft & padRight Strings to make this common.
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
  }

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

    int leftOver = boxL.length - _asked; // count not printed items
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
  } //  -----  boxInList

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
    StringBuffer b = new StringBuffer();
    thisMap.forEach((k, v) {
      String _kS = k; //  key-String,  value_String
      String _vS = v;
      if (kw > 0) _kS = k.substring(0, kw);
      if (vw > 0) _vS = k.substring(0, vw);
      b.write('$_kS $_vS  '); //  write modified key-value to buffer
    });
    return b.toString();
  }

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
        _ks = k.padRight(_kl + 1); //  ? + 1
      } else {
        _ks = k.substring(0, _kl); //  but it may be shorter
      }
      ;

      if (v.length < _vl) {
        _vs = v.padRight(_vl + 1);
      } else {
        _vs = v.substring(0, _vl); //  but it may be shorter
      }
      ;
      String _s = '';
      _s = '$_ks $_vs';
      _l.add(_s);
    } // --  thisMap
        ); //  --  forEach k v
    return _l;
  } //  --  maptofineList

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
      int _l = _map[name].length;
      print('\n mapName: $name -------------- length: $_l -----------------');
      //  TODO  Return map in sort-order: value.
      _map[name].forEach((k, v) => print('$k, $v'));
    }
  }

  ///  TODO  did it go right? No.
  ///  print Map<String, Map<String, String>>  map nicely
  void printStringMapMapFail(Map<String, Map<String, String>> _map) {
    int _length = _map.length;
    List<String> nameL = _map.keys.toList();
    for (var x = 0; x < _length; x++) {
      String name = nameL[x];
      int _l = _map[name].length;
      print('\n mapName: $name -------------------------------');
      for (var z = 0; z < _l; z++) {
        print(_map[name][z]);
      }
      print(_map[x]);
    }
  }

  ///  QUEST:  sure you can do better?
  ///  is it number?
  bool isNumber(String _s) {
    bool retB = false;
    if ('0123456789'.indexOf(_s) > -1) {
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
  }

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
    var start = new DateTime.now();
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
    var now = new DateTime.now();
    var formatterYmd = new DateFormat('yyyy-MM-dd');
    String formattedYmd = formatterYmd.format(now);
    var formatterHms = new DateFormat('Hms');
    String formattedHms = formatterHms.format(now);
    var dateTimeStampNow = (' $formattedYmd  $formattedHms ');
    return dateTimeStampNow;
  }

  ///  Small sleep-methods, to get time, to see, what is happening in tests.
  void sleepSimple(int waitingTime) {
    //  1000 =  one second
    //var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
    var goalTime =
        new DateTime.now().add(new Duration(milliseconds: waitingTime));
    do {} while (new DateTime.now().compareTo(goalTime) < 0);
  }

  ///  Sleep method with time and optional info.
  void sleepMS(int waitingTime, [bool info]) {
//var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
    var goalTime =
        new DateTime.now().add(new Duration(milliseconds: waitingTime));
    bool _info = info;
    if (_info) (print('Waiting for  $waitingTime'));
    do {
      //  var timeNow = new DateTime.now();
    } while (new DateTime.now().compareTo(goalTime) < 0);
    if (_info) (print('waiting time over over'));
  }

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
} //  -----  class Tools

Tools tl = new Tools();
