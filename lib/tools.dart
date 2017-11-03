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
  ///  Pad List right and left with: _leS, _raS and make all even length
  void padListRL(List<String> _l, String _leS, _raS) {
    //  Using here new Tools, tl class.
    int long = tl.longestItemInList(_l);
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

  //  Fill list-box-data in matrix in r, _c coordinates.
  //  Modify _mL to be NOT PRIVATE and name to: masterL
  void boxInList(int _r, int _c, List<String> boxL, List<String> masterL) {
    padListRL(boxL, ' ', ' ');
    int _count = boxL.length;
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

  ///  Screen-sized matrix pierced with staggered list elements.
  ///  TODO  change all box-methods to use Map<String,String>
  List<String> iterableDiagonal(List<List<String>> _il, int sw) {
    int _sw = sw; //  screen width.
    int _ilC = countInnerList(_il); //  serves also as row-count.
    int cStep = ((sw - 50) ~/ _ilC); //  spread info to screen.
    //  TODO  More complicated than 1 by 1 system.
    int cInd = 0; //  colon index.

    int rInd = 0; //  row-index if needed.
    String _s = '';
    String infoS1 = '  INFO: V:Value E:Effort D:Done :';
    String infoS2 = ' ** Diagonal list describing Chore-Effort user-data  **';
    String infoS3 =
        ' - Finally this data is best when get by server to client. -';
    List<String> _ol = [': tl.it-d-First Item    $infoS1 $infoS2 $infoS3'];
    for (var x = 0; x < _il.length; x++) {
      for (var y = 0; y < _il[x].length; y++) {
        _s = '';
        String ts = ''; //  temporary String for padding
        cInd = cInd + cStep;
        ts = _s.padLeft(cInd, '_');
        _s = (ts + _il[x][y]);

        ///  is this really needed??
        int _wl = _il[x][y].length; //  current item length
        ts = _s.padRight((_sw), '_'); //  to be visible: _
        _ol.add(ts);
        //  empty String
      } //  ---------------    Items in one list.
      cInd + 6; //  extra tick.
      _ol.add(
          '.--------------------------------'); //TODO  Make something more visible and useful.
    } //  -----------------    All incoming lists.3
    return _ol;
  }

  ///  Version, that uses Map in incoming data.  ******************** map ***
  ///  Screen-sized matrix pierced with staggered list elements.
  ///  TODO  change all box-methods to use Map<String,String>
  List<String> iterableDiagonalM(List<Map<String, String>> _ilM, int sw) {
    int _sw = sw; //  screen width.
    ///  Using different,  count Map method.
    int _ilMC = countInnerMap(_ilM); //  serves also as row-count.
    int cStep = ((sw - 50) ~/ _ilMC); //  spread info to screen.
    //  TODO  More complicated than 1 by 1 system.
    int cInd = 0; //  colon index.
    int rInd = 0; //  row-index if needed.
    String _s = '';
    String infoS1 = '  INFO: V:= Value E: = Effort D: = Done :    ';
    String infoS2 = ' ** Diagonal list describing Chore-Effort user-data  **  ';
    String infoS3 =
        '      - Finally this data is best when get by server to client. -';
    List<String> _ol = [': tl.it-d-First Item    $infoS1 $infoS2 $infoS3'];

    for (var x = 0; x < _ilM.length; x++) {
      ///  Loop to handle all map values
      for (var y in _ilM[x].keys) {
        _s = '';
        String ts = ''; //  temporary String for padding
        cInd = cInd + cStep;
        ts = _s.padLeft(cInd, '_');
        //  Must get key AND value to String.
        //  hklTry  glorious:  y
        _s = (ts + y + _ilM[x][y]);
        // _s = (ts + _ilM[x][y]);
        ///  is this really needed??
        int _wl = _ilM[x][y].length; //  current item length
        ts = _s.padRight((_sw), '_'); //  to be visible: _
        _ol.add(ts);
        //  empty String
      } //  ---------------    Items in one list.
      cInd + 6; //  extra tick.
      //  pad String to _sw, screen width.
      String _nlS = '.'.padRight(sw - 2, ' ');
      String _nlS2 = _nlS + '.';
      _ol.add(_nlS2); //TODO  Make something more visible and useful.
    } //  -----------------    All incoming lists.3
    return _ol; //  ----------   ********************************** map ****
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
