// Copyright (c) 2017, Heikki L. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo version:  0.0.5  6.11.2017

import 'dart:html';
import 'dart:io';
import 'package:http/browser_client.dart';

import 'package:dawo/dawo.dart';


import 'package:dawo/alpha.dart';
import 'package:dawo/beta.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/rumba.dart';

import 'package:dawo/mis/chore.dart';
import 'package:dawo/mis/missions.dart';


import 'package:dawo/corp/bind.dart';
import 'package:dawo/corp/connector.dart';
//  import 'package:dawo/tools.dart';
import 'package:dawo/src/glb.dart';
import 'package:dawo/src/box_serve.dart';


void main() {
  print('-------------------  main running  ------------------------------');

  var bc = new BrowserClient();
  //  error:bug:  bc.get('https://github.com/heiklap/dawo/commit/d00887ebe75b1b70b6da537a5befbb8bbd0350cb');
  //  TODO  Client
  

  var dawoApp = new DawoApp('Pplay-rumba:dawoApp', 'By: dawo_example: dawoApp rolls missioms');
  var rumba = new Rumba();
  rumba.dance(dawoApp);


  StringBuffer createBuffer(String footer) {
    StringBuffer boo = new StringBuffer();
    boo.writeln('new string buffer');
    /*
    for (var x in _matrix) {
      boo.writeln(x);
    }
    */
    boo.writeln(footer);
    return boo;
  }

  /// just calling some dawo methods;
  print('.............. :glb:boxServe:buf: length and names  ............');
  //  create glb.buffers.  That are create din dawo_example.dart
  glb.boxServeBuffers.putIfAbsent(':glb:box:1', () => createBuffer('glb-box footer'));
  glb.boxServeBuffers.putIfAbsent(':connector:box: :R:.do:2', () => createBuffer('connector box footer'));
  glb.boxServeBuffers.putIfAbsent(':dap:box:3', () => createBuffer('dab-bo footer'));
  glb.boxServeBuffers.putIfAbsent(':dap:box:4', () => createBuffer('dab-box 4 footer'));
  glb.boxServeBuffers.putIfAbsent(':connector:box: :d:ex:5', () => createBuffer('connector box 5 footer'));
  glb.boxServeBuffers.putIfAbsent(':dawoHist:dailyAction:friday:6', () => createBuffer('dawo-hist-daily friday-buf'));


  print(glb.boxServeBuffers.length);
  for (var z in glb.boxServeBuffers.keys) {
    print(glb.boxServeBuffers[z].length);
    print(z);
  }
  print('...<<<  ........... :glb:boxServe:buf: length and names  done ........');


  String rumbaS = rumbaBuf.toString();  //  void
  String dawoAppS = dawoBuf.toString();
  String missionS = packDawoMission.say.toString();
  String choreS = packDawoMission.joyChr.buf.toString();

  ///  StringBuffers that collect dawo-data, from out-class
  String ohText = out.outHeader.toString();
  String oTlText = out.outTl.toString();
  String oTmText = out.outTMid.toString();
  String oTrText = out.outTr.toString();
  String oMtText = out.outMTop.toString();
  String oMmText = out.outMid.toString();
  String oMbText = out.outMBot.toString();

  String oBlText =  out.outBl.toString();
  String oBrText = out.outBr.toString();
  String footText = out.outFooter.toString();

  //  glb.buffers:
  //:glb:box:1
 // String bufGlbBox1 = glb.boxServeBuffers[':glb:box:1'].toString();
  String bufGlbBox1 = '  hello buffer  ';

  print(bufGlbBox1);
     // :connector:box: :R:.do:2
  //  String bufConnector2 = glb.boxServeBuffers[':connector:box: :R:.do:2'].toString();
  String bufConnector2 = ' hello second buffer';

     // :dap:box:3
  String bufDapBox3 = glb.boxServeBuffers[':dap:box:3'].toString();

     // :dap:box:4
  String bufDapBox4 = glb.boxServeBuffers[':dap:box:4'].toString();

     // :connector:box: :d:ex:5
  String bufConnector5 = glb.boxServeBuffers[':connector:box: :d:ex:5'].toString();

     // :dawoHist:dailyAction:friday:6
  String bufDawoHist6 = glb.boxServeBuffers[':dawoHist:dailyAction:friday:6'].toString();




  String rText = 'rumbaBuf::  $rumbaS  .';
  String dText = 'dawoBuf::   $dawoAppS .';
  String mText = 'packDawoMission:say::  $missionS  .';
  String cText = 'packDawoMission.joyChr.buf is running $choreS .';

  querySelector('#glb-box1').text = bufGlbBox1;
  querySelector('#con-box2').text = bufConnector2;
  querySelector('#dap-box3').text = bufDapBox3;
  querySelector('#dap-box4').text = bufDapBox4;
  querySelector('#buf-con5').text = bufConnector5;
  querySelector('#dawo-hist6').text = bufDawoHist6;




  // querySelector('#output').text = 'Your Dart app is running $s.';
  // querySelector('#rumba').text = rText;  //  BIG!! OUTPUT
  // querySelector('#dawo-buf').text = dText;  //  OK:  dawoBuf:: .
  // querySelector('#pack-dawo').text = mText;  //  OK  say-Map
  // querySelector('#joy-chore').text = cText;  //  empty

  /*
  querySelector('#oh-text').text = ohText;
  querySelector('#otl-text').text = oTlText;
  querySelector('#otm-text').text = oTmText;
  querySelector('#otr-text').text = oTrText;

  querySelector('#omt-text').text = oMtText;
  querySelector('#omm-text').text = oMmText;
  querySelector('#omb-text').text = oMbText;

  querySelector('#obl-text').text = oBlText;
  querySelector('#obr-text').text = oBrText;
  querySelector('#ofoot-text').text = footText;
  */




  print('-------------------  main done  --------------------------------');
}
