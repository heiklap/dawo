// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  *  active_model    dawo_example   dawo version   0.0.75. - 8.1.2018.
///
///  * Find:  peg to show big boxes.

//  import 'package:dawo/dawo.dart';

///

import 'package:dawo/dawo_app.dart';
import 'package:dawo/mis/chore.dart';
import 'package:dawo/mis/missions.dart';


//  var dawoApp = new DawoApp();
///  constructor:  this.name, this.motto
///

var fm = new Mission('FinlandMission', 'Keeping am ActiveModel');
///   constructor:  this.name, this.master, this.info
var am = new BlanketChore('ChoreActiveModel', 'FinlandMission', 'ActiveModel for Finlands TaxParadice money loundry.');

///
void fmBoxAct(){
  fm.boxAct(':am:example::fm:');
}

///
void fmBox(){
  //  fm
  /*  Fields::
  'Goal': {
'Enemy':
'Friend':
'Project'
'Plan': {
'Phase':
'Mean': {
'Event':
'Action':
   */

  fm.box(':am:example::fm:');
}

///
void amBox(){


}

void buildFm(){
  fm.say = {
    'purpose': ':FinlandMis :Economy :Education :Peace :UN :EU',
    'lang': ':fm :Finnish :Swedish :Same :English :Dartlang ;WEB',
    'area': ':fm :Fnland :Helsinki :World aso :EU :NATO :DEFEND',
    'product':':fm :Peace :Prosperity :Learn :COMMUNITY :Science :Unicef ',
    'sell': ':fm :Wood :Wood :Learn :Help :KnowHow :Technic',
    'buy': ':fm :Oil :Technic :Projects :Work :',
    'ask': ':fm :NATO :EU :Defend :Export :Social :Community',
    'always': ':fm :SKILLFULL :CLEVER :FRIENDLY :NATURE :SILENCE :',
    'newer': ':fm :HUILO :BAD :UGLY :SORROW :ANGRY :UNTRUST :'
  };
  fm.clause = ':NATURE :TOURISM :Development :KnowHow :Education :DATA :Learning';

  fm.placardM = {
    'actor': ':fm::',
    'sender': ':fm:',
    'receiver': 'r: :ALL _PUBLIC :FINLAND :EU',
    'command': 'cmd: ',
    'msg': 'fm: finlandMission',
  };

  ///  New, 1/2018 act map, just simulating mostly junk data
  fm.act = {
      'Goal': {'Unemployment': '- 10 %', 'Production': '+ 8 %', 'Export': '+ 6 %', 'Invests': '+ 8 %'},
      'Enemy': {'Crime': 'MagnitskyAct', 'TaxParadise': 'Dirty money', 'Stupidity': 'x', 'Laziness': 'y', 'Other': 'z'},
      'Friend': {'Friend:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Project': {'Project:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Plan': {'Plan:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Phase': {'Phase:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Mean': {'Mean:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Event': {'Event:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
      'Action': {'Act:Law': 'Finland EU Interpol', 'Wisdom': 'It goes all well', 'Skill': 'we have skill', 'Diligence': 'yes we are ntelligent'},
  };
}

///
void main(){
  dawoApp.init(':dawoApp:in:activeModel:', 'Presenting active measures for economy.');

  ///  To run _appRollMissions();
  buildFm();
  buildMissions(':am:activeModel:');
  fm.motto = 'Promote active measures to boost Finlands economy agains corrupted money.';
  fm.clause = ':AREA :ALL :CODE :DATA :DO :FREE :HELP :FIND  :HINT :JOIN :OPEN :QUEST :RULE ';
  ///  Or to run dawoApp.. get much output
  // dawoApp.roll();

  print('%%%%%%%%%%%%%%%%%%% :am: :fm: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

  ///  New Mission must be marked to missionM Map.

  fm.report(':am:', true);
  fm.showInfo();
  print(fm.showChr);
  ///  TODO  add data
  ///  TODO  Make box for data
  ///  TODO  fm say

  print('%%%%%%%%%%%%%%%%%%% :am: :fm:say:: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  print(fm.say);
  missionM.putIfAbsent('FinlandMission', () => fm);
  fmBox();
  print('\n    ------------------------------------------------------   \n');
  fmBoxAct();


  print('%%%%%%%%%%%%%%%%%%% :am: :roll: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  am.roll();
  print('%%%%%%%%%%%%%%%%%%% :am: :master:: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  print(am.master);

  print('%%%%%%%%%%%%%%%%%%% :am: :missonM:: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  print('NOTE:: New Mission FinlandMission  must be marked to missionM Map.');
  print(missionM);
  print('%%%%%%%%%%%%%%%%%%% :am: :box:: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  am.box(':am:activeModel:');
  print('%%%%%%%%%%%%%%%%%%% :am: :rowInfo:: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  am.rowInfo();
  print('%%%%%%%%%%%%%%%%%%% :am: :phase: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  print(am.phase);
  print('%%%%%%%%%%%%%%%%%%% :am: :placardM: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  print(am.placardM);

  print('%%%%%%%%%%%%%%%%%%% :am: done %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
}  //  -----  main


