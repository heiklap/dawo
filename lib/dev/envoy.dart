// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.
///
///  ##  envoy,  messenger
///  PLAN maybe:  Sending permanent active messages between objects
///  - Using some outside package, like: punch-hermes, or dch-signal
///
/// * dwv: version:   0.8.5.  29.3.2022.
/// * devState : 2%    in GitHub : yes
//

part of dawo_dev;

///  NOTE:9 Messages might be something that demand immediately action.
///  For more complicated cases of sig:  note-message-handling.
class Envoy {
  ///  PLAN:  envoy should keep record of all "envoys" sent.
  var messageL = ['* * *  envoyMessages   * * *', '', ''];

  ///  Map for envoyMessages.
  Map<String, String> envoyM = {'': ''};
  ///
  void envoyAdd() => print('addNewEnvoy();');
  ///
  void show() => print('Showing all envoyMessages..');

//  #Code #Sample
//  add code:
//  devTestStream.join('New one')         //  add some streams
//    .join(String 'Second one')
//    .add('we are shutting down!');
// ('New note joined to devStream');

}     //     -----     class end envoyMessage

///  Creating instance of (mostly unused) envoyMessage class:
///  Usage:  not used.
var envoy = Envoy();
