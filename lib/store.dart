// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

///  Here are streams, supply and demand, all in store
///  history: 2017.11.13.   development-state: 5%
///
///  TODO  all methods are:  supplyX and  demandX
///
///
//

library store;

import 'dart:async';



class Store{

  ///  ***********************************************************************
  ///  #Word 's for stream-like processes. What 3 words to use?
  ///  chain, procession, queue, order, request, stream, river, flow, rune
  ///  19.10.2017  adapt this structure everywhere, until find better.
  ///  These are upper-level streams, others are inside classes.
  void orderStream() {} //  is not async, just normal wait-a-little-in-queue.
  void chainStream() {} //  real stream, slow answer.
  void fireStream() {} //
  ///  ***********************************************************************
  ///  Elementary stream example, not yet used here in reasonable way.
  ///  dawoApp.roll drives this.  When thinking about #stream / #order / #chain
  ///  better name, we think for different nature of them, One is quick, one is
  ///  slow, and one: we-do-not-mind: wait, but not synchronously: like queue.
  ///  So: "joint"Order, ...""Chain, ""Queue  #TODO  Name
  ///  ***********************************************************************
  void demandStream(String caller, var streamData, var streamListen) {
//  var data = streamData; // some sample data
    var stream = new Stream.fromIterable(streamData); // Create the stream.

    // Subscribe to the streams events.
    stream.listen((value) {
      //
      print('\n--- :stream: #phase:1 bLib:demandStream Listened     ---');
      print("   :stream: #phase:2:value:  $value"); // onData handler
      print('---  :stream: #phase:3:ok  caller: $caller        OK    --- \n');
    });
  }



  ///  Another basic stream example, grabbed from dartlang.org
  ///  Not used yet here.
  void demandStreamBroad(String caller, Iterable streamData, var streamListen) {
    //  var data = intList;
    var stream = new Stream.fromIterable(streamData);
    var broadcastStream = stream.asBroadcastStream();

    broadcastStream //   Using method cascades...
    //  TODO  Test:  Can we NOT use shorthand function?
      ..listen((value) => print("SUCCESS_1_:: stream.listen: $value"))
      ..first.then((value) => print("SUCCESS_2_:: stream.first: $value")) // 1
      ..last.then((value) => print("SUCCESS_3_:: stream.last: $value")) // 5
      ..isEmpty
          .then((value) => print("SUCCESS_4_:: stream.isEmpty: $value")) // false
      ..length.then((value) => print("SUCCESS_5_:: stream.length: $value")); // 5
  }







}

Store store = new Store();
