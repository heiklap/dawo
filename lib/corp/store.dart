// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// ## Store is, or simulates: shop, or market place, serving and selling.
/// Here it is stream-based.
///  * Here are streams, supply and demand, all in store, and they: deliver.
///  * dawo version: 0.0.7. - 18.12.2017  devState: 3%
///  * NEXT: when main methods are sync, it is hard to find practical usage.
///  * NEXT: try box_serve for output-
///  * OutPut:  :demand:stream: search gives 15 results in output.
//  history: 2017.11.13.   development-state: 5%
//
// TODO  all methods are:  supplyX and  demandX
//

library store;

import 'dart:async';
import '../src/box_serve.dart';

///
class Store {
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
  ///  USAGE:  dawoApp uses this 4 times.
  ///  :demand:stream search gives 15 results in output
  ///  ***********************************************************************
  void demandStream(String caller, var streamData, var streamListen) {
//  var data = streamData; // some sample data
    var stream = new Stream.fromIterable(streamData); // Create the stream.

    // Subscribe to the streams events.
    stream.listen((value) {
      //
      Map<String, String> _answerM = {
        '1. ': '---:river: :stream: #phase:1 store:demandStream Listened     ---',
        '2. ': '   :demand:stream: #phase:2:value:  $value',
        '3. ': '---  :stream: #phase:3:ok  caller: $caller        OK    ---',
      };
      List<String> infoTwo = boxServe.infoBox(_answerM, 8, 65, 49);
      infoTwo.forEach(print);

      print('\n--- :stream: #phase:1 store:demandStream Listened     ---');
      print("   :demand:stream: #phase:2:value:  $value"); // onData handler
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
      ..isEmpty.then(
          (value) => print("SUCCESS_4_:: stream.isEmpty: $value")) // false
      ..length
          .then((value) => print("SUCCESS_5_:: stream.length: $value")); // 5
  }
}

Store store = new Store();
