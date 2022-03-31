// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///
///  ## Modeling joint, reusable controls and operations for libraries.
///  dawo/beta,  dawo version:   0.9.0.  30.3.2022.
///  devState   40 %   in GIT  Yes
///  idea:   some basic / flow  functionality, that is too small for packages,
///  and too big for tools.dart or dawo_app.
///  Connections to packages, that we do not want to import fully. (?)
///  Extra control / flow / actor variables for processes/events/jobs
//

part of beta;


///  call flow.fServe with #LOCAL variables
///  flow.fServe(':HELSINKI:', out.outMBot, msg, pB);
///
///  Moving all flow stuff inside here
///  Flow new class 30.3.2022
class FlowBase {
  ///  * *  This is main f-Print, that handles all flowC call from every library.
  ///  Do not look out unprofessionally and spam your code with print-clauses!
  ///  Instead use: flow !!
  ///  Actor and buf are not needed in parameter !!  They are get from caller.
  ///  void flow(String actor, StringBuffer buf, String msg, bool pr)
  ///  DONE:  To avoid messing with buffer and actor HOORAY: used local flowC().
  ///  ALL  local flowC() calls this fServe()
  ///  callers: 12 X      usage:
  ///  Short name inside class
  ///void flowServe(String actor, StringBuffer buf, String msg, bool pr) {
  void fServe(String actor, StringBuffer buf, String msg, bool pr) {
    ///  ********************************************************************
    ///  GETTING NOW  ACTOR AND BUFFER RIGHT, WHEN USED LOCAL fl()
    /// **********************************************************************
    //  TODO : is flow pushing empty rows to buffers?
    //  hklTry, add :FS:
    //  Handle flow-counter, flowI
    flowI++;
    String flowIS = flowI.toString();

    ///  Added opC: to flow-counter for easy search.
    String _flowIS = 'opC:$flowIS';
    //  ?? WHAT?   $pr:  If want true / false.
    String header = 'fs:';
    String text = '$actor$header$_flowIS $msg ';

    //  Try checking that value is not NULL, before using it in a condition
    //  && glb.st['flow']  /   Shortens output from 24 to 22 screens.
    //  HowTo  NULL Condition  OK
    //  howTo NULL  error: a nullable expression can't be used as a condition
    //  if (pr && glb.prSt['flow']) print(text); // When needed  :fServe:test:
    if (pr && glb.prSt['flow']!) print(text); // When needed  :fServe:test:

    // DONE:  Now _buf comes from caller in parameters.
    buf.writeln('$text');
    //  buf.writeln('$actor $_flowIS $msg');
    //  Code here.
    //  Form nice String (for print and/or buf) that describes ongoing operation.
  } //     -----     fServe

  ///  Find String in out-buffers;
  ///  usage:    callers:   rumba  once
  void fFind(String caller, String _fs, int len) {
    print('lllllllllllllllllllllllll  flowList  c: $caller  llllllllllll');
    print(' Seeking: $_fs');
    int foundC = 0;
    List<String> flowList = [];

    ///  Find all "flow-process' Strings
    int bufC = 0;

    ///  type Map in for loop must implement iterable.
    for (var x in out.outBufM.keys) {
      bufC++;
      print('buffer n:o:  $bufC');
      int _lng = x.length;
      print('length: $_lng  ');

      ///  change buffer to String.
      String s = x.toString();
      int current = 0;
      flowList.add(s.substring(6, 42));
      //  while(current < s.length){
      //  Do we have find here?
      int sInd;
      sInd = s.indexOf(_fs, current);
      print('sInd:  $sInd');
      if ((sInd > 0) && ((sInd + len + 1) < s.length)) {
        current = sInd;
        flowList.add(s.substring(current, (current + len)));
        foundC++;
        print('found:  $foundC');
      }
    } //  -----  outBufL
    print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
    print('FLOW-LIST:');
    flowList.forEach(print);
    print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
    print('flowList-length: ');
    print(flowList.length);
    print('lllllllllllllllllllllllll  flowList  c: $caller  done lllllllllll');
    // No for Map   if (_betaPB) outBufM.forEach(print); //  Not output for now.
    if (beta._betaPB)
      out.outBufM.forEach((k, v) => print('$k, $v')); //  Not output for now.
  } //     -----     fFind

  ///  Calling print/print-to-buffer function from library: beta.
  ///  Getting local variables; Actor and Buffer right.
  ///  Changing to use local -
  ///  Callers:  usage:   once here
  void _flowC(String msg, bool betaPB) {
    ///  Call fServe with #LOCAL variables.
    //  TODO  Why not find beta fServe() ??
    fServe(':beta:flC:$betaPB ', beta.betaBuf, msg, betaPB);
  }
}

///  instance:   usages:  13 X
FlowBase flow = FlowBase();
