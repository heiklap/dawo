// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  bind :  solving literal searches by customer (bind) wishes.
///  * find: memberM.placardM/clause / bindItem => response.bing.caller
///  * dawo version: 0.0.7. - 18.12.2017
///  * GitHub:  https://github.com/heiklap/dawo/blob/master/lib/corp/resolve.dart
///  * devState: schema  5%  -  PLAN: no time.
//  Hist:hkl  19.11.2017  Moved stuff out from connector.

// * * * *    Start using RegExp in String operations.  * * * *
/*  #CODE  from:  https://www.dartlang.org/guides/libraries/library-tour
Replacing part of a string
Strings are immutable objects, which means you can create them but you can’t change them. If you look closely at the String API docs, you’ll notice that none of the methods actually changes the state of a String. For example, the method replaceAll() returns a new String without changing the original String:

var greetingTemplate = 'Hello, NAME!';
var greeting = greetingTemplate
    .replaceAll(new RegExp('NAME'), 'Bob');

assert(greeting !=
    greetingTemplate); // greetingTemplate didn't change.
 */
library resolve;

//  import '../tools.dart';

///  Solve word-command searches and validating for bind - bing and connector.
class Resolve {
  ///  1:  Get access to :con: :bind: user-database
  ///
  ///  2.  Get and answer service calls from users.
  ///
  ///  3.  Have user #rule  to be able to seek data.
  ///
  ///  4.  Use quick: touche  or  thorough:  solve
  /// **   Tools to handle db_search from : Map<String, Map<String, String>>
  ///
  //

  ///  Variables:  PLAN:  ALL NEEDED HANDLE_DATA IS IN CALLER SIDE.
  var _uh; //  user handle

  var _dh; //  data handle, ALL
  var _dhC; //  data handle, current #client
  //  Definition, how Client requests are handled, preferences aso.
  var _rh; //  rule handle.
  var _rhC; //  rule handle, #Client
  //  Priority system in word-search.
  var _phC; //  preference handle, #Client
  //  Outside library that is used or clients own library.
  var _dl; //  handle to #LANG  maybe #dawolang

  var _zyld; //  Outside data zylinder.

  ///  Client sends all handles at initialization.
  ///  And client-handle when calling an action.
  void getHandles() {}

  ///  Main method here
  ///  Get user_request,  solve it, answer.
  String handle(Map<String, Map<String, String>> _cDB, String _rClient) {
    return '';
  }

  ///  Find and keep user priority, preference aso.
  String userPreference() {
    String _s;
    return _s;
  }

  ///  Find and keep user priority, preference aso.
  String userData() {
    //  Store user variables to up-level vars.
    return '';
  }

  /// 3 #LANG specific commands, that configure objects behaviour in relation
  /// to other objects.
  ///  TODO  Name for next 3 fields might be opTouche aso.
  ///  Solve one unambiguous textual find-decide problem.
  ///  NOTE: might be separate Touche class.
  String touch(String sender, String key, String source) {
    //  TODO problem
    return 'solved:toucheStr: ';
  }

  ///  Search big amount of #clay data for #customer:s key / order.
  ///  .. solve textual problems based on keywords / search in textual data
  ///  NOTE: might be separate Solver class.
  String solve(String sender, String key, String source) {
    //  TODO problem
    return 'solved: solveString';
  }

  ///  TODO:  connector one-time calls must have parameters;
  ///  Sketching one-time commands, coming from clients.
  String obey(String sender, receiver, baton, msg) {
    /// #baton  to carry only-one-can-have-at-a-same-time magic thing
    //  TODO  code, badly missing
    //  handle command / message
    return 'done';
  }
//  *****************************************************************

} //  -----  Resolve class

///  Instance, although I remember reserving #res word for something else.
var resolve = new Resolve();

void renderResolve() {
  ///  Just to name variables here for to avoid unused error.
  resolve._uh; //  user handle

  resolve._dh; //  data handle, ALL
  resolve._dhC; //  data handle, current #client
  //  Definition, how Client requests are handled, preferences aso.
  resolve._rh; //  common rule handle
  resolve._rhC; //  rule handle, #Client
  //  Priority system in word-search.
  resolve._phC; //  preference handle, #Client
  //  Outside library that is used or clients own library.
  resolve._dl; //  handle to #LANG  maybe #dawolang

  resolve._zyld; //  Outside data zylinder.
}
