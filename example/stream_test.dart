///  testing streams in dawo stream_test
///  These streams are executed kind of in "sync" order.
//    So usually only some of them "complete. After main.
///  dawo_stream_test   dawo version:  0.0.7. - 18.12.2017
/// streams, stream controllers, and stream subscriptions?
/// simple code example using them by; Gitter Jacob MacDonald
/// https://gist.github.com/jakemac53/68d006b31dd1d62e0109fbe04bab226b

import 'package:dawo/code_snippets/learn_stream_sync.dart';
import 'package:dawo/dev/dawo_dev.dart';

///  create instance of DevTest class
Aide dt = Aide();
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
  lSS.presentSuperStream(lSS.letterList, hklTryListen);
  print(':stream: call done');
}

///  To test all streams
void testAllStreams() {
  dt.line('main begin  $thisModule');
  //  stream  16  functions

  //TODO  what is StreamListener??
  //  just any value
  var hklTryListen = "hklTryListen";
  lSS.presentSuperStream(lSS.letterList, hklTryListen);

  /// hklTry:
  lSS.presentHyperStream(lSS.stringList, 'hklListening:', 'hkl-receiver');

  dt.line('***  Stream: presentStreamBase  $thisModule');

  ///  OK
  lSS.presentStreamBase();

  dt.line('***  Stream: presentStreamExmpl  $thisModule');

  ///
  lSS.presentStreamExmpl();

  dt.line('***  Stream: presentBroadcastStream  $thisModule');

  ///
  lSS.presentBroadcastStream();

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
  lSS.presentSingleValueStream();

  dt.line('***  Stream: presentUnsubscribeFromStream  $thisModule');

  ///
  lSS.presentUnsubscribeFromStream();

  dt.line('***  Stream: presentGenericStream  $thisModule');

  ///
  lSS.presentGenericStream();

  print('   * * *    Streams are all in going      * * * ');

  print('   * * *    Streams are not my friends    * * * \n');
  dt.end('main ends  $thisModule');
}
