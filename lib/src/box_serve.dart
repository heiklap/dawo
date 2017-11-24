library box_serve;

import '../tools.dart';
//  import '../shower.dart';






///  Schedule connect, opJoin corporate, bind, binding
class BoxServe {
  int sw = 195; //  default:  screen width
  int rc = 47; //  default:  row count
  String pm = '-';  //  default
  List<String> _matrix = new List();    //  (rc);  lets nat decide here lists length
  int _fakeRow = 100; //  Get nice  100 - 147 numbers
  List<String> _resAllocL = []; //  Some extra resource
  ///  Forming vertical line for screen.
  List<String> verticalLineL = [];  //  max: rc - 2)

  //  Methods to be called from outside class
  //  Init may have been called from outside.
  //  also this form outside  construct('$_caller :roll:');
  //  build('$_caller :roll:');

  ///  Initialize measure values by parameters
  ///  //  TODO  set min-max-maxWidthString values
  void init(int h, w, String _pm) {
    pm = _pm;
    ///  Use default, unless parameters are > 0
    if ((h>0) && (w>0) ){
      rc = h;
      sw = w;
    }
    // :BUG: in headerLine logo length
    verticalLineL.addAll(tl.strToList('|', rc - 2));
    String rowS = ' '.padRight(sw);
    for (var x = 0; x < rc; x++) {   //  add to matrix rc items.
      _matrix.add(rowS);
    }
  }

  ///
  void construct(String _caller) {
    for (var z = 1; z < _matrix.length -1; z++) {
      //  do not handle first row.
      _fakeRow++;
      //  TODO  choose nice background mark for matrix.
      //  pad with low-density mark.
      _matrix[z] = '$_fakeRow '.padRight(sw, pm);  //  NO: '-'
    };
    String m0ro = '--m-boxServe--$_caller-------';
    int m0roI = m0ro.length;
    String m0row = m0ro.padRight(sw, pm);
    _matrix[0] = m0row;
    //  TODO  StampLeft ' '  // there is pm ! = ' '
    ///  Last row of matrix for range-10 marks; NOTE: rc - 1
    String bRowLong = '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70-----';
    //  :BUG:  TODO  Make sure that this row is ==  sw !!!
    //.substring(0, sw);

    String bRow = bRowLong.substring(0,sw);
    _matrix[rc-1] = bRow;
    //   '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';
  }

  void build(String _caller) {}

  //  Fill list-data in matrix in r, _c coordinates.
  //  parameters now::  int _r, int _c, List<String> boxL, List<String> _mL)
  //  new parameters 3 and 4: _items, _w
  //  TODO :BUG: No error check for over-sized lists.
  //  anchorBox
  void aBox(int _r, _c, _items, _w, List __l) {
    //  If not know list length / wanted items and width, try 100. lol
    tl.boxInList(_r, _c, _items, _w, __l, _matrix);
  }

  ///   Lay String in a certain place in matrix.
  ///   :QUEST:  This is too complicated, lol.
  void aHeader(int _r, _c, String s) {
    String _s1 = _matrix[_r].substring(0, _c);
    int _pos = _s1.length;
    int _length = _matrix[_r].length;
    String _s3 = _matrix[_r].substring(_pos + s.length, _length);
    _matrix[_r] = '$_s1$s$_s3';
  }

  //  Set vertical line to screen matrix
  void vertLine(int _x, _y, count){
    String _newS;
    int toX = _x + count;
    for (var x = _x; x < toX; x++){
       _newS = tl.changeLetter(_matrix[x], _y, '|');
       //  print(_newS);
      _matrix[x] = _newS;
    }
    //  print('---vertLine done ---------------');
  }

  ///  Lets see, if this will eventually be List<String>
  void boxDone(String _caller, String action) {
    print(_matrix.length);
    if (action == 'print') _matrix.forEach(print);  //  only way!!
    //  return _matrix;  //  if type is: List<String>
    _matrix.clear();
    //  :BUG:  so clear all
    _resAllocL.clear();
    verticalLineL.clear();
    _fakeRow = 100;
  }

  ///  TODO : Constructor, to give shapes and measures


} //  -----  class BoxServe

BoxServe boxServe = new BoxServe();
