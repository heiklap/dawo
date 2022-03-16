///  ##  Dart Streams, example and learning-code.
///  This do not bring any value to dawoApp.  Just sample code-snippets.
///  NOTE:  Only some of these streams are executed, when called in row,
///  but however, they work.
/// * dawo version:  0.0.6  -  27.11.2017  -  in gitHub : yes
/// * READY-STATE:    for 0.0.7 : 0%
/// *  NEXT:  modify these, connect to classes and lists. use stream_channel pack
///   Examples pasted from:   https://www.dartlang.org/docs/tutorials/streams/
///   Copyright notice should not concern this file... since it's from dartlang
// Hist: hkl  4.5.2014  0.0.1  dawo/lib    info with streams to dawo-staff
//

library learn_stream_sync;

import 'dart:async';

///  getters..
num dawLibStreamReadiness = 90; // readiness for version 0.0.1

///TODO  every stream-function adds own message to batonMsg and ++ batonCount
///  So we can at the end see, what had happened
StringBuffer batonMsg = new StringBuffer();
int batonCount = 0;

StringBuffer streamBuf = new StringBuffer();
String streamMotto = 'Streams are not my friends :-|  ';

///TODO  teamNext   PLAN:    Use futures for outPut
//------------------------------------------------functions
/*  Stack example : To get a value from a Future:
Future foo() async {
  var val = await theFuture;
  print(val);
}
*/

///  try to make it a class
class LearnStreamSync {
  ///  ugly hack: list here
  var letterList = ['a', 'b', 'c']; //  used here
  var stringList = ['How are you?', 'Good morning!', 'Have a nice day.'];
  var intList = [1, 2, 3, 4, 5];

//    new stream    13 pcs

  ///   how to add new data into stream?? =>   use  streamController
  ///   healthIssue:  line 45 col 41: Avoid types as parameter names.
  ///   var SenderListener  CHANGED to:  var senderListener
  void addToStream(Stream thisStream, var senderListener) {
//  dlData.add(7);
//  dlStream.
    print('***  nothing to see here  ***');
  }     //     -----     addToStream

  ///  PLAN:  some functions with long names..
  void presentStreamCreate() {}

  ///
  void presentStreamListen() {}

  ///  ..
//TODO  aSync stream   is there something special in "superStream"   ??
  void presentSuperStream(var streamData, var streamListen) {
//  var data = streamData; // some sample data
    var stream = new Stream.fromIterable(streamData); // create the stream

    // subscribe to the streams events
    stream.listen((value) {
      //
      print('\n---   presentSuperStream   ---');
      print("Super Received: $value"); // onData handler
      print('---           OK           --- \n');
    });
  }     //     -----     presentSuperStream

  ///  String?  streamReceiver  "hyperStream"  makes it better
  void presentHyperStream(var sData, var sListen, String sReceiver) {
//  var data = streamData; // some sample data
    var stream = new Stream.fromIterable(sData); // create the stream

    // subscribe to the streams events
    stream.listen((value) {
      //
      print('\n ---   presentHyperStream    ---');
      print("Hyper Received:   $value"); // onData handler
      print('Stream receiver:  $sReceiver');
      print('---            OK          --- \n ');
    });
    //Study it here:    stream.
  }     //     -----     presentHyperStream

  ///    basic stream example...
  void presentStreamBase() {
    var _data = intList; // some sample data
    var _psbStream = new Stream.fromIterable(_data); // create the stream

    // subscribe to the streams events
    _psbStream.listen((value) {
      //
      print("---   presentStreamBase   ---");
      print("Received: $value"); // onData handler
      print("---         ok            --- \n");
    });
    //NOTE: using name: stream, gives you too wide amount of values- Study this:
    // _psbStream.   contrary to using:   stream
  }     //     -----     presentStreamBase

//  stream = new Stream.fromIterable([1,2,3,4,5]);
//  stream.first.then((value) => print("stream.first: $value"));  // 1

  ///    another basic stream example
  void presentStreamExmpl() {
    var data = intList;
    var stream = new Stream.fromIterable(data);
    var broadcastStream = stream.asBroadcastStream();

    broadcastStream //   using   method   cascades...
      //TODO  Test:  can we NOT use shorthand function?
      ..listen((value) => print("SUCCESS_1_:: stream.listen: $value"))
      ..first.then((value) => print("SUCCESS_2_:: stream.first: $value")) // 1
      ..last.then((value) => print("SUCCESS_3_:: stream.last: $value")) // 5
      ..isEmpty.then(
          (value) => print("SUCCESS_4_:: stream.isEmpty: $value")) // false
      ..length
          .then((value) => print("SUCCESS_5_:: stream.length: $value")); // 5
  }     //     -----     presentStreamExmpl

  ///    samples of broadcast stream
  void presentBroadcastStream() {
    var data = intList;
    var stream = new Stream.fromIterable(data);
    var broadcastStream = stream.asBroadcastStream();

    broadcastStream
        .where((value) => value % 2 == 0) // divisible by 2
        .listen((value) => print("pBS::  where: $value")); // where: 2
    // where: 4

    broadcastStream
        .take(3) // takes only the first three elements
        .listen((value) => print("pBS::  take: $value")); // take: 1
    // take: 2
    // take: 3

    broadcastStream
        .skip(3) // skips the first three elements
        .listen((value) => print("pBS::  skip: $value")); // skip: 4
    // skip: 5

    broadcastStream
        .takeWhile((value) => value < 3) // take while true
        .listen((value) => print("pBS::  takeWhile: $value")); // takeWhile: 1
    // takeWhile: 2

    broadcastStream
        .skipWhile((value) => value < 3) // skip while true
        .listen((value) => print("pBS:: skipWhile: $value")); // skipWhile: 3
    // skipWhile: 4
    // skipWhile: 5
  }     //     -----     presentBroadcastStream

  ///   howToNote:   how to add to stream.. with streamController !!
  void presentStreamTransform() {
    //  TODO  teamHowTo    make roundWay
    //  TODO  goals  error;  make list here
    var thisEveningStream =
        new Stream.fromIterable(letterList); // create the stream
//  var thisEveningStream = new Stream.fromIterable(eveningStream);  // create the stream

    //  check properties: Just nime one, and play.
    thisEveningStream.toString();

    /// define a stream transformer
    var transformer =
        new StreamTransformer.fromHandlers(handleData: (value, sink) {
      // create two new values from the original value
      //  The method "add" is not defined for method void.
      //  sink.add("Message: $value").add("Body: $value");
      //  sink asks (dynamic event)
      //  hklTry: ("Body: $value"  ok. error away.
      sink.add("Body: $value"); // add("Message: $value").add("Body: $value");
    });

    //  Just use it: watch properties.
    transformer.runtimeType;
    /// transform the stream and listen to its output
    ///  TODO  check Null update NNBD for new functioning code year 2022
    ///  TODO  Temporarily away
    //** AWAY   thisEveningStream
    //** AWAY       //  howTo Stream transformer
    //** AWAY       .transform(transformer)
    //** AWAY       .listen((value) => print("listen: $value"));
  }     //     -----     presentStreamTransform

//TODO  bin  note   no io-operations allowed in HTML
  void presentFileStream() {
/* ERROR   The class 'File' does not have a default constructor
  File file = new File("some_file.txt");
  file.openRead()
      .transform(UTF8.decoder) // use a UTF8.decoder
      .listen((String data) => print(data), // output the data
          onError: (error) => print("Error, could not open file"),
          onDone: () => print("Finished reading data"));
 */
    print('***   nothing hyet here  *** \n');
  }     //     -----     presentFileStream

  ///  ..
  void presentStreamValidate() {
    var data = intList;
    var stream = new Stream.fromIterable(data);
    var broadcastStream = stream.asBroadcastStream();

    broadcastStream.any((value) => value < 5).then((result) => print(
        "\n  ***  resentStreamValidate  *** \n  Any less than 5?: $result")); // true

    broadcastStream
        .every((value) => value < 5)
        .then((result) => print("All less than 5?: $result")); // false

    broadcastStream.contains(4).then(
        (result) => print("Contains 4?: $result  \n  --  OK  --  \n")); // true
  }     //     -----     presentStreamValidate

  ///
  void presentSingleValueStream() {
    var data = intList;
    var stream = new Stream.fromIterable(data);
    var broadcastStream = stream.asBroadcastStream();

    broadcastStream
        .singleWhere(
            (value) => value < 2) // there is only one value less than 2
        .then((value) =>
            print("\n  single value: $value  \n ---    OK  ----  \n "));
    // outputs: single value: 1
  }     //     -----     presentSingleValueStream

  ///   more stream methods
  void presentUnsubscribeFromStream() {
    var data = intList; // some sample data
    var stream = new Stream.fromIterable(data); // create the stream

    var subscription = stream.listen(null);
    subscription.onData((value) {
      print("listen: $value");
      if (value == 2) subscription.cancel(); // cancel the subscription
    });
    subscription.onError((err) => print("error: $err"));
    subscription.onDone(() => print("done"));
  }     //     -----     presentUnsubscribeFromStream

  ///  ..
  void presentGenericStream() {
    var data = intList; // int's, valid
// var data = ["1","2","3","4","5"]; // strings, not valid
    var stream = new Stream<int>.fromIterable(data); // Stream<int>
    stream.listen((value) {
      // value must be an int
      print("listen: $value  \n  ---   OK  --- \n");
    });
  }     //     -----     presentGenericStream

  ///  TODO  HTML  not allowed in VM
  ///
/*
void presentButtonClickStream() {
  var button = new ButtonElement();
  document.body.children.add(button);

  button.text = "Foo";
  var clickCount = 0;
  button.onClick.listen((mouseEvent) {
    print("clicked"); // remain subscribed for all clicks
  });

  var subscription = button.onClick.listen(null);
  subscription.onData((mouseEvent) {
    print("copy that");
    clickCount++;
    window.alert("Clicked");
    if (clickCount == 3) {
      subscription.cancel(); // unsubscribe after the third click
    }
  });
}     //     -----     presentButtonClickStream
*/

/*
var tempsStream = new Stream.fromIterable(musicTemps);


 // subscribe to the streams events
void listenMusicStream() {
   tempsStream.listen((value) {       //
   print("Received: $value");  // onData handler
   });
}     //     -----     listenMusicStream
 */

/*  io.example.   do  not work on html / browser side
import 'dart:io';

main() {
  File file = new File("some_file.txt");
  file.openRead()
      .transform(UTF8.decoder) // use a UTF8.decoder
      .listen((String data) => print(data), // output the data
        onError: (error) => print("Error, could not open file"),
        onDone: () => print("Finished reading data"));
}
 */

  ///  testing and playing with above streams, show output
  void renderDawoStreams() {
    //  code here
    print('\n ***   renderDawoStream   Nothing to see here now   *** \n ');
  }

  ///  get instance with this constructor,
  LearnStreamSync();
} //     -----     class LearnStreamSync

///   create instance constructor
LearnStreamSync lSS = LearnStreamSync();

//
