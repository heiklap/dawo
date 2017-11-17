// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Some helper tools
/// *  dawo version:  0.0.5  6.11.2017    READY-STATE for  0.0.6   0 %
/// *  in GIT:  yes           Hist:  hkl  2014  0.0.1  dawo/lib
///

library tools.dart;

import 'dart:math';
///
num toolsReadiness = 96;

///  Buffer also outside class, for testing and adding visibility.
var toolsBuf = new StringBuffer();

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
  void shortenItemsInList(List<String> _l, int _w){
    String s;
    for (var x = 0; x < _l.length; x++){
      s = _l[x];
      if (_l[x].length > _w) {
        _l[x] = s.substring(0,_w);
      }
    }
  }

  //  Fill list-box-data in matrix in r, _c coordinates.
  //  Modify _mL to be NOT PRIVATE and name to: masterL
  void boxInList(int _r, int _c, _items, _w, List<String> boxL, List<String> masterL) {
    //  new parameters _items, _w :  items and asked output width
    if (_w < longestItemInList(boxL)) {
      shortenItemsInList(boxL, _w );
    }
    padListRL(boxL, _w, ' ', ' ');
    int _count = min(boxL.length, _items);  //  All or asked amount.
    for (var x = 0; x < _count; x++) {
      //  Control for range errors
      int itemLength = boxL[x].length;
      int control = itemLength + _c;
      int matrixRowLength = masterL[_r].length; // ?
      if (matrixRowLength < control) {
        String errorRowS = masterL[_r];
        print('ALERT::: mrl:: $matrixRowLength < control:: $control  * * * ');
        print(':::$errorRowS:::');
      }

      String _s1 = masterL[_r].substring(0, _c);
      String _s2 = boxL[x]; //  current list value.
      String _s3 = masterL[_r].substring(_c + itemLength, matrixRowLength);
      masterL[_r] = '$_s1$_s2$_s3';
      _r++;
      if (_r > masterL.length) {
        print('ALERT::: * * *    _r > masterL.length   * * *   ');
      }
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

  ///  Return list<String> from map<String, String>.
  List<String> mapToList(Map<String, String> thisMap) {
    List<String> _l = [];
    thisMap.forEach((k, v) {
      String _s = '';
      _s = '$k, $v';
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

var tl = new Tools();
