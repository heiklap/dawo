///   hkl  4.5.2014  0.0.1  dawo/lib    info with streams to dawo-staff
///   examples wrapped from:   https://www.dartlang.org/docs/tutorials/streams/
///   READY-STATE:    90%            in GitHub :  yes
///   Ugly snapping examples inside to my functions..  thanks :)
///   NEXT:  modify these, connect to classes and lists.
///   Copyright notice should not concern this file... since it's from dartlang

part of dawo_src;

///  getters..
num dawLibStreamReadiness = 90; // readiness for version 0.0.1

///TODO  teamNext   PLAN:    Use futures for outPut
//------------------------------------------------functions
//    new stream    13 pcs

///   how to add new data into stream?? =>   use  streamController
void addToStream(Stream thisStream, var SenderListener) {
//  dlData.add(7);
//  dlStream.
}

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
    print("Super Received: $value"); // onData handler
  });
}

///  String?  streamReceiver  "hyperStream"  makes it better
void presentHyperStream(var sData, var sListen, String sReceiver) {
//  var data = streamData; // some sample data
  var stream = new Stream.fromIterable(sData); // create the stream

  // subscribe to the streams events
  stream.listen((value) {
    //
    print("Hyper Received:   $value"); // onData handler
    print('Stream receiver:  $sReceiver');
  });
  //Study it here:    stream.
}

///    basic stream example...
void presentStreamBase() {
  var _data = [1, 2, 3, 4, 5]; // some sample data
  var _psbStream = new Stream.fromIterable(_data); // create the stream

  // subscribe to the streams events
  _psbStream.listen((value) {
    //
    print("Received: $value"); // onData handler
  });
  //NOTE: using name: stream, gives you too wide amount of values- Stydy this:
  // _psbStream.   contrary to using:   stream
}

//  stream = new Stream.fromIterable([1,2,3,4,5]);
//  stream.first.then((value) => print("stream.first: $value"));  // 1

///    another basic stream example
void presentStreamExmpl() {
  var data = [1, 2, 3, 4, 5];
  var stream = new Stream.fromIterable(data);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream //   using   method   cascades...
    ..listen((value) => print("stream.listen: $value"))
    ..first.then((value) => print("stream.first: $value")) // 1
    ..last.then((value) => print("stream.last: $value")) // 5
    ..isEmpty.then((value) => print("stream.isEmpty: $value")) // false
    ..length.then((value) => print("stream.length: $value")); // 5
}

///    samples of broadcast stream
void presentBroadcastStream() {
  var data = [1, 2, 3, 4, 5];
  var stream = new Stream.fromIterable(data);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream
      .where((value) => value % 2 == 0) // divisible by 2
      .listen((value) => print("where: $value")); // where: 2
  // where: 4

  broadcastStream
      .take(3) // takes only the first three elements
      .listen((value) => print("take: $value")); // take: 1
  // take: 2
  // take: 3

  broadcastStream
      .skip(3) // skips the first three elements
      .listen((value) => print("skip: $value")); // skip: 4
  // skip: 5

  broadcastStream
      .takeWhile((value) => value < 3) // take while true
      .listen((value) => print("takeWhile: $value")); // takeWhile: 1
  // takeWhile: 2

  broadcastStream
      .skipWhile((value) => value < 3) // skip while true
      .listen((value) => print("skipWhile: $value")); // skipWhile: 3
  // skipWhile: 4
  // skipWhile: 5
}

///   howToNote:   how to add to stream.. with streamController !!
void presentStreamTransform() {
//TODO  teamHowTo    make roundWay
  var thisEveningStream = new Stream.fromIterable(goals); // create the stream
//  var thisEveningStream = new Stream.fromIterable(eveningStream);  // create the stream

  /// define a stream transformer
  var transformer =
      new StreamTransformer.fromHandlers(handleData: (value, sink) {
    // create two new values from the original value
    sink.add("Message: $value").add("Body: $value");
  });

  // transform the stream and listen to its output
  thisEveningStream
      .transform(transformer)
      .listen((value) => print("listen: $value"));
}

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
}

///  ..
void presentStreamValidate() {
  var data = [1, 2, 3, 4, 5];
  var stream = new Stream.fromIterable(data);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream
      .any((value) => value < 5)
      .then((result) => print("Any less than 5?: $result")); // true

  broadcastStream
      .every((value) => value < 5)
      .then((result) => print("All less than 5?: $result")); // false

  broadcastStream
      .contains(4)
      .then((result) => print("Contains 4?: $result")); // true
}

///
void presentSingleValueStream() {
  var data = [1, 2, 3, 4, 5];
  var stream = new Stream.fromIterable(data);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream
      .singleWhere((value) => value < 2) // there is only one value less than 2
      .then((value) => print("single value: $value"));
  // outputs: single value: 1
}

///   more stream methods
void presentUnsubscribeFromStream() {
  var data = [1, 2, 3, 4, 5]; // some sample data
  var stream = new Stream.fromIterable(data); // create the stream

  var subscription = stream.listen(null);
  subscription.onData((value) {
    print("listen: $value");
    if (value == 2) subscription.cancel(); // cancel the subscription
  });
  subscription.onError((err) => print("error: $err"));
  subscription.onDone(() => print("done"));
}

///  ..
void presentGenericStream() {
  var data = [1, 2, 3, 4, 5]; // ints, valid
// var data = ["1","2","3","4","5"]; // strings, not valid
  var stream = new Stream<int>.fromIterable(data); // Stream<int>
  stream.listen((value) {
    // value must be an int
    print("listen: $value");
  });
}

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
}
*/

/*
var tempsStream = new Stream.fromIterable(musicTemps);


 // subscribe to the streams events
void listenMusicStream() {
   tempsStream.listen((value) {       //
   print("Received: $value");  // onData handler
   });
}
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

//
