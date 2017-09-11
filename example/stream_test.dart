///  testing streams in dawo stream_test
///  These streams are executed kind of in "sync" order.
//    So usually only some of them "complete. After main.
///  dawo_stream_test   dawo version 0.0.2  11.9.2017

import 'dart:async';

import 'package:dawo/dawo.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';
import 'package:dawo/dawo_dev.dart';


///  create instance of DevTest class
var dt = new DevTest();
String thisModule = 'dawo_stream_test';

void main() {
  dt.devTestLine('main begin  $thisModule');
  //  stream  16  functions


  //TODO  what is StreamListener??
    //just any value
    var hklTryListen = "hklTryListen";
    presentSuperStream(letterList, hklTryListen);


  /// hklTry:
   presentHyperStream(stringList, 'hklListening:', 'hkl-receiver');

  dt.devTestLine('***  Stream: presentStreamBase  $thisModule');
  ///  OK
    presentStreamBase();

  dt.devTestLine('***  Stream: presentStreamExmpl  $thisModule');
  ///
    presentStreamExmpl();

  dt.devTestLine('***  Stream: presentBroadcastStream  $thisModule');
  ///
    presentBroadcastStream();

  dt.devTestLine('***  Stream: presentStreamTransform  $thisModule');
 ///
  /// error:  this seems to fail.  Or is it just too many streams?
  //  presentStreamTransform();

  dt.devTestLine('***  Stream: presentFileStream  $thisModule');
  ///
  //  presentFileStream();

  dt.devTestLine('***  Stream: presentStreamValidate  $thisModule');
  ///  nothing here
  // NO!!   presentStreamValidate();

  dt.devTestLine('***  Stream: presentSingleValueStream  $thisModule');
  ///
    presentSingleValueStream();

  dt.devTestLine('***  Stream: presentUnsubscribeFromStream  $thisModule');
  ///
    presentUnsubscribeFromStream();

  dt.devTestLine('***  Stream: presentGenericStream  $thisModule');
  ///
    presentGenericStream();

  print('   * * *    Streams are all in going      * * * ');


  print('   * * *    Streams are not my frends    * * * \n');
  dt.devTestEnd('main ends  $thisModule');
}


