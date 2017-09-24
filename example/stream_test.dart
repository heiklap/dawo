///  testing streams in dawo stream_test
///  These streams are executed kind of in "sync" order.
//    So usually only some of them "complete. After main.
///  dawo_stream_test   dawo version 0.0.3  25.9.2017
/// streams, stream controllers, and stream subscriptions?
/// simple code example using them by; Gitter Jacob MacDonald
/// https://gist.github.com/jakemac53/68d006b31dd1d62e0109fbe04bab226b

import 'dart:async';

import 'package:dawo/dawo.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';
import 'package:dawo/dawo_dev.dart';

///  create instance of DevTest class
var dt = new DevHelp();
String thisModule = 'dawo_stream_test';

void main() {
  testSuperStream();

  testAllStreams();
}

///  test only superStream
void testSuperStream() {
  //TODO  what is StreamListener??
  //  just any value
  print(':stream: calling');

  var hklTryListen = "hklTryListen";
  presentSuperStream(letterList, hklTryListen);
  print(':stream: call done');
}

///  To test all streams
void testAllStreams() {
  dt.line('main begin  $thisModule');
  //  stream  16  functions

  //TODO  what is StreamListener??
  //  just any value
  var hklTryListen = "hklTryListen";
  presentSuperStream(letterList, hklTryListen);

  /// hklTry:
  presentHyperStream(stringList, 'hklListening:', 'hkl-receiver');

  dt.line('***  Stream: presentStreamBase  $thisModule');

  ///  OK
  presentStreamBase();

  dt.line('***  Stream: presentStreamExmpl  $thisModule');

  ///
  presentStreamExmpl();

  dt.line('***  Stream: presentBroadcastStream  $thisModule');

  ///
  presentBroadcastStream();

  dt.line('***  Stream: presentStreamTransform  $thisModule');

  ///
  /// error:  this seems to fail.  Or is it just too many streams?
  //  presentStreamTransform();

  dt.line('***  Stream: presentFileStream  $thisModule');

  ///
  //  presentFileStream();

  dt.line('***  Stream: presentStreamValidate  $thisModule');

  ///  nothing here
  // NO!!   presentStreamValidate();

  dt.line('***  Stream: presentSingleValueStream  $thisModule');

  ///
  presentSingleValueStream();

  dt.line('***  Stream: presentUnsubscribeFromStream  $thisModule');

  ///
  presentUnsubscribeFromStream();

  dt.line('***  Stream: presentGenericStream  $thisModule');

  ///
  presentGenericStream();

  print('   * * *    Streams are all in going      * * * ');

  print('   * * *    Streams are not my frends    * * * \n');
  dt.end('main ends  $thisModule');
}
