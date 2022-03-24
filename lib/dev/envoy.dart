// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  envoy,  messenger
///  PLAN maybe:  Sending permanent active messages between objects
/// * dawo version:   0.3.0.  23.3.2022.
/// * devState : 2%    in GitHub : yes
// hist>  9.1.2018  Separated from dawoDev.
//

part of dawo_dev.dart;

///  NOTE: Messages might be something that demand immediately action.
///  For more complicated cases of note-message-handling.
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
