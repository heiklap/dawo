// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.
///
///  ##  Model structure, base class, that is used everywhere in dawo:
/// * action,
/// * dwv: version:   0.9.9.  7.4.2022.
/// *
//

part of alpha;


///  Base class Action
class Action {
  String name = '';
  ///
  Map<String, String> say = {
    'purpose': '',
    'lang': '',
    'area': '',
    'product': '',
    'sell': '',
    'buy': '',
    'ask': '',
    'always': '',
    'newer': '',
  };

  /// IDEA: Map<String, Map<String, String>> reason = {};
  Map<String, String> reason = {
    'anti': '',
    'why': '',
    'whyNot': '',
    'plus': '',
    'minus': '',
    'desicion': '',
  };


}      //     -----     class Action
//
