// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Some helper tools
/// *  dawo version:  0.0.4  16.10.2017    READY-STATE for  0.0.5   0 %
/// *  in GIT:  yes           Hist:  hkl  2014  0.0.1  dawo/lib
///

library tools.dart;

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

  ///  Counts items in inner list
  int countInnerList(List<List<String>> _l) {
    int i = 0;
    for (var x in _l) {
      int z = (x.length);
      i = (i + z);
    }
    return i;
  }

  ///  Return List of items, where #String exist
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
  ///  Pad List right and left with ' ' and make all even length
  void padListRL(List<String> _l) {
    //  Using here new Tools, tl class.
    int long = tl.longestItemInList(_l);
    //  looks funny, surely we can make better :)
    for (var x = 0; x < _l.length; x++) {
      //  int itemLength = _l.length;  //  length NOW
      String _thisItem = _l[x];
      String _s = (' $_thisItem');
      String _ss = _s.padRight(long + 2, ' ');
      _l[x] = _ss;
      //  Pad every item right with ' ' to length of the longest item.
    }
  }

  //  Fill list-box-data in matrix in r, _c coordinates.
  void boxInList(int _r, int _c, List<String> boxL, List<String> _mL) {
    print('-----  box in list starting  ---------');
    padListRL(boxL);

    print(_mL);
    print(boxL);
    print('------- done pad  -----------');

    int _count = boxL.length;
    print(_count);
    for (var x = 0; x < _count; x++) {
      String _s1 = _mL[_r].substring(0, _c);
      boxL.forEach(print);
      print(_s1);
      String _s2 = boxL[x]; //  current list value.
      print(_s2);
      int itemLength = boxL[x].length;
      int matrixRowLength = _mL[_r].length; // ?
      String _s3 = _mL[_r].substring(_c + itemLength, matrixRowLength);
      print(_s3);
      _mL[_r] = '$_s1$_s2$_s3';
      print(_mL[_r]);
      _r++;
      print('------- done row  -----------');
    }
  } //  -----  boxInList

  ///  Screen-sized matrix pierced with staggered list elements.
  List<String> iterableDiagonal(List<List<String>> _il, int sw) {
    int _sw = sw; //  screen width.
    int _ilC = countInnerList(_il); //  serves also as row-count.
    print('- >->- _tl:-id: ------  counted inner list length -------------');
    int cStep = ((sw - 50) ~/ _ilC); //  spread info to screen.
    print('InnerList-length::  $_ilC');
    print(':tl:-id:   Step: $cStep');
    print('- <-<- -------  counted inner list length  done  ------------');
    //  TODO  More complicated than 1 by 1 system.
    int cInd = 0; //  colon index.

    int rInd = 0; //  row-index if needed.
    String _s = '';
    List<String> _ol = ['First Item']; //  out-list
    //  All incoming lists.
    for (var x = 0; x < _il.length; x++) {
      //  in-list handle all.
      //  Items in one list.
      for (var y = 0; y < _il[x].length; y++) {
        _s = '';
        String ts = ''; //  temporary String for padding
        cInd = cInd + cStep;
        //  pad string left count: cInd.
        ts = _s.padLeft(cInd, '_');
        //  add list item to string, pad right
        _s = (ts + _il[x][y]);

        ///  is this really needed??
        int _wl = _il[x][y].length; //  current item length
        print(_il[x][y]);
        // ts = _s.padRight((_sw - (_s.length - wl)), '_'); //  to be visible: _
        ts = _s.padRight((_sw), '_'); //  to be visible: _
        _ol.add(ts);
        //  empty String
      } //  ---------------    Items in one list.
      cInd + 6; //  extra tick.
      print('cInd::  $cInd');
      _ol.add('.');
    } //  -----------------    All incoming lists.
    _ol.add('.');
    return _ol;
  }

  ///  Just a note, howTo print a map.
  void operationMapPrint(Map thisMap) {
    thisMap.forEach((k, v) {
      print('$k, $v');
    });
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

  /// some class tests.. for #teamNext use
  var strLin = '----------------------------------------         ';

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
