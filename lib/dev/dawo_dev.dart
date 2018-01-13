// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
/// * dawo version:  0.0.75.  -  8.1.2018.  -   devState: 15 %
/// * GitHub: yes  29.11.2014
//
// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
//

library dawo_dev.dart;

import '../alpha.dart';
import '../shower.dart';
import '../tools.dart';

import '../src/box_serve.dart';
import '../beta.dart';

part 'aide.dart';
part 'dawo_hist.dart';
part 'dev_notes.dart';
part 'envoy.dart';


//TODO  name   PROBLEMS, when using too common names:
//   devTest   =   22  times     CHANGE:   test  ! ??
//   devNote   = 2/16 times
//   cod*          10 times
//   phase          3
//   note          23 ??         CHANGE:   note  !!!
//   test        10/50            CHANGE    test  !!!
//  #Word  Stream  6

//  New async : plans to make async functions start synchronously.
//  This change is planned for Dart 2.0.
//  TODO  Future foo() async { await null; doSomething(); }
//  TODO  Future bar() async { await null; return doSomething(); }

///  Not working now; to track readiness
num dawoDevReadiness = 94;

///  Buffer also outside class, for testing and adding visibility.
//  StringBuffer devBuf = new StringBuffer();  //  notUsed

///  Collect dev stuff to Dev class, to help in development of package.
class Dev {
  ///  small mess with variable names
  int devTestCount = 0;
  //  TODO  teamInno   devTeam, should be also instance of #team? class ?
  bool devTestPhase = true; // set this false in production. (newer)

  ///  two members (persons) of devTest team:
//  TODO  teamAdm team_members..  should they be in... team_staff..
  String coderNight = 'Late Night Coder ';
  String coderMorn = 'Earlymorn Coffeeman ';

  /// count.. something
  num coderCount = 0;

  ///  msg named in dev
  String coderBlame = '';

  /// This is the language, that missions and other objects talk (in con) .
  Map<String, String> say = {
    'purpose': ':dev  :This :development :dawoBuilding :learn',
    'lang': ':SAMPLE :LANG :dartlang :dawolang :ALL :WORDS',
    'area': ' :adm :dev  :sec  :inno :other :howTo :learn',
    'product': ':dev  :PROD1 :PROD2',
    'sell': ':dev  :CODE :TIME :EFFORT :EQU',
    'buy': ':dev  :ADVICE :TIME :CODE',
    'ask': ':dev  :Stack :Gitter :Dartisans  :think',
    'always': ':dev  :alwaysX :alwaysY :alwaysZ :dev ',
    'newer': ':dev  :NO :UGLY'
  };

  ///  Generic list to keep and handle all envoyMessages
  List<Envoy> envoyL = []; //  not used
  //  To collect range aso. errors.
  List<String> errorLog = ['* dev errorLog  *'];

  ///  To handy keep track of fast changes in code:
  List<String> doneL = [];

  ///  First, header values to teamN.
  List<String> admN = ['* *  Team Admin notes:  * *'];
  List<String> devN = ['* * Team dev notes: * * '];
  List<String> innoN = ['* *  Team inno notes: * * '];
  List<String> howToN = ['* * Team HowTo notes: * * '];
  List<String> secN = ['* * Team sec notes: * * '];

  ///  Changed from List to Map in 0.0.7. version
  ///  Changes #maybe planned to dawoPackage.
  ///  V: 1-9 = value, E = effort,  D:  = done
  Map<String, String> later = {
    '   * * *  next List to plan Dawo 009 aso changes.   * * * ': 'Value, Effort, Done',
    'Plugin: DB  propably Mongo There is Pub package                    .': 'V:5 E:6 D:0',
    'Plugin: Server-client.  Angel package          ': 'V:6 E:3 D:0',
    'Plugin: DB: Local storage for user own data.                   ': 'V:5 E:4 D:0',
    'LATER: Internal systematics. Most critical improvements.': 'V:5 E:6 D:0',

    'LATER: FLOW:  Real work-flow for chore': 'V:5 E:8 D:0',
    'LATER: ?   UI?                                              ?.': 'V:5 E:5 D:0',
    'LATER: UI:  Choose mission / chore at start.': 'V:5 E:8 D:0',

    'LATER: :ad:promo: Corporation:   real store & resolve :bind:bing: ': 'V:6 E:6 D:0',
    'LATER: Server-client. Simple server - client.                     ': 'V:2 E:2 D:0',
    'LATER: FIX: Make devBox a class; long functions are hard to manage.': 'V:1 E:8 D:-1',

    'LATER: WEB presentation, dawo-web-hooks for here-is-text-output.': 'V:7 E:8 D:0',
    'LATER: Example new mission: useful, chore: #FoodFinder, #pundit  ': 'V:5 E:4 D:0',
};

  Map<String, String> plugins = {
    'Completed: Maybe feb 2019.': 'No pressure.',
    'Plans for 2018  ': 'Value, Effort, Done',
    '1.0.0 Complete Web app. Maybe Angular.': 'V:9 E:9 D:0',
    '0.9.0 Mill, elementary presentaton.': 'V:9 E:8 D:0',
    '0.8.0 Test cleaning, benchmarks, overall celaning': 'V:5 E:4 D:0',
    '0.7.0 Clay data and Chores interconnecting.': 'V:5 E:6 D:0',
    '0.6.0 Server framework, likely Dart Angel by Toby.': 'V:5 E:4 D:0',
    '0.5.0 PLUG: JSON import all data.': 'V:5 E:4 D:0',
    '0.4.0 Elementary WEB show.': 'V:5 E:7 D:0',
    '0.3.0 Simple server, localStorage, DB, maybe Mongo.': 'V:5 E:4 D:0',
    '0.2.0 Demos and Plugins to simulate commercial app.': 'V:4 E:4 D:0',
    '0.1.0 Elementary CL / console app.': 'V:5 E:4 D:0',
  };

  ///  Changed from List to Map in 0.0.7. version
  ///  ///  V: 1-9 = value, E = effort,  D:  = done
  ///  Changes likely planned to dawoPackage after 0.0.7 version.
  Map<String, String> version008 = {
    '   * * *  plan Dawo 008changes.   * * * ': 'V:3 E:3 D:0',
    '008: :BIND:PING: simulation :promo: :demo:  -in boxServe   ': 'V:3 E:3 D:0',
    '008: User :promo:simulated :data for #dayActions. Server-client ?.': 'V:3 E:3 D:0',
    '008: :demo: #LANG #say simulation /:ad: advertising commercial .             ': 'V:3 E:3 D:0',
    '008: Clean: :ouput clean after: :con  corp console schedule.': 'V:3 E:3 D:0',
    '008: Show: ? dawo-State boxServe :presentation: with 12 boxes.': 'V:3 E:3 D:0',
    '008: Show: ll Dawo-Objects :presentation: with box_serve.': 'V:7 E:5 D:0',
    '008: :demo::ad: Advertising / simulate  for only-commercial-version stuff.': 'V:8 E:6 D:0',
    '008: LOOP:  SOON:  say - analyze - con - effort - affair - schedule.': 'V:8 E:6 D:0',
    '008: Example: #Huilo: #Hypertext Unfriendly-Incursion-Level #Observer.': 'V:5 E:3 D:0',
    '008: MessFix:   Fixes and modifications to previous version.             ?': 'V:2 E:6 D:0',
    '008: Mission-chore:   Nice run example in dawoApp.             ?': 'V:5 E:4 D:0',
    '008++ dBox shows Map for: boxes done INIT, CONSTR, sGLB, SHOW, DONE -info. ': 'V:2 E:2 D:2',
    '008++ Clean: more dawoApp class and output, clean and reshape.': 'V:3 E:3 D:0',
    '008++ dawoApp.box method got new fields and functionality. boxServe Bug.': ' V:2 E:5 D:04',
    '008:++ CommonChore renamed> BlanketChore, Chore.op > popularJoint.': 'V:3 E:1 D:3',
    '008++ dev class reshape, new Class names: aide, hist and envoy.': 'V:4 E:3 D:3',
  };

  ///  Minor update, at the end no docs checked, no test, not every file updated.
  Map<String, String> version0075 = {
    '0075 Rolled to Pub and GitHub. Tests and docs unchecked to save labour.':  'V:2 E:3 D:3',
    '0075++ Begin to change minor version:   0.0.75.  -  8.1.2018': 'V:1 E:2 D:3',
    '0075++ box and boxAct in mission, and Map<String, Map<String, String>> act': 'V:6 E:4 D:3',
    '0075++ infoBox in boxServe for framed strings with indent margin in cl.': 'V:5 E:7 D:4',
    '0075++ Margin to boxServe, small fixes aso. ': 'V:1 E:2 D:2',
    '0075++ Treaty-class to missions auction, used by daily_action.dart example.': 'V:7 E:8 D:6',
    '0075++ DawoApp stops extending BaseStruct. Default constructor, new init.': 'V:5 E:4 D:0',
    '0075++ get #version, #name to devBox aso:  via dawoApp    ?': 'V:2 E:3 D:0',
    '0075++ DawoApp: Instance dawoApp created and fields used inside package.': 'V:5 E:2 D:1',
    '0075++ INTL Tools stampDateTimePlain for:2017-12-23  08:47:27 ': 'V:1 E:1 D:7',
    '0075++ Chore: SCHEMA: flux: actions and answers in common roll-mill-loop ': 'V:8 E:8 D:1',
    '0075++ Chore modification: Part: 2. + box and example.': 'V:4 E:4 D:2',
    '0075++ Chore master-field to get Mission.say Map for box.': 'V:3 E:2 D:7',
    '0075++ Chore modification: Part: 1.             ?': 'V:5 E:7 D:2',
    '0075++devBox  Added header and footer rows.             ?': 'V:1 E:1 D:9',
    '0075++ListToMap: dawoDev version008 and later are now Maps.             ?': 'V:1 E:1 D:9',
};

  ///  To add developer notes.
  void addNote(List l, String s) {
    l.add(s);
  }

  ///  Fill devNote lists with data. dawo_app calls this in it's build-method!
  void buildNotes(String caller, msg) {
    //  TODO String howTo write many line String.  From dartlang.org
    var interpolation = "interpolation";
    var combi = "a string "
        "that goes over multiple lines "
        "and uses $interpolation "
        r"and \raw strings";
    //  -----  code Sample

    doneL
      ..add('   * * *  doneL to keep track of daily Dawo changes.   * * * ')
      ..add('NEXT: Internal systematics. Most critical improvements.')
      ..add('NEXT: User :promo: simulated data #dayActions. Server-client ?.')
      ..add('NEXT: SearchList of important dawo terms to example-file :con:m:')
      ..add('NEXT: ouput clean after: con - corp console schedule.')
      ..add('NEXT: more dawoApp class and output, clean and reshape.')
      ..add('NEXT: dawo-State box_serve presentation with 12 boxes.')
      ..add('NEXT: All Dawo-Objects presentation with box_serve.')
      ..add('Maybe:  Make debBox a class')
      ..add('SOON: LOOP: say - analyze - con - effort - affair - schedule.')
      ..add('NEXT:0.1 #Huilo: #Hypertext Unfriendly-Incursion-Level #Observer.')
      ..add('NEXT: Example new mission: useful, chore: #FoodFinder, #pundit  ')
      ..add('Moving from 0.0.6 to 0.0.7. 18.12.2017, Git and Pub.')
      ..add('Add parameter #name to con.join.')
      ..add('Equipment aso many Lists changed to maps.')
      ..add('Fill placardM with #LANG-like data')
      ..add('Regularize mission names for connector.join /solve.')
      ..add('scout moved out from mission to library camp / Scout class.')
      ..add('boxServe; modifys & save 6 buf to glb.boxServeBuffers for Web.')
      ..add('example shows glb.keyWords-used/rarely-used/important in devBox.')
      ..add('Big changes and modification in mission-connector aso.')
      ..add('infoM renamed: say. in Mission, app, def, alpha, con. ')
      ..add('Mission and dawoApp Modification')
      ..add('Mission report modified + rollSchedule, stFlags, placardM aso.')
      ..add('Mission infoM modified, filled for each M in missions_data.')
      ..add('st-Map fields wake & work, prefious: off  on.')
      ..add('scoutSolve sketch: access to placardM and clause via memberM.')
      ..add('All opX in mission, and opJoin in connector, renamed to: scoutX')
      ..add('Pubspec: io: ^0.3.0, http: http_server: any, browser: ^0.10.0+2 ')
      ..add('boxServe boxCount to hdr and *p e g* to mark row 14 for scfreen.')
      ..add('boxServe template used to add BaseStruct fields to matrix.')
      ..add('Simulate user actions: with: #dayActions, use boxServe template.')
      ..add('Dev class clean and separate class devHelp.')
      ..add('Mission: Fix render:BUG: and gave name variable more visibility.')
      ..add('Version 0.0.6 changes, and publish to pub and gitHub.')
      ..add('boxServe: box-output for dawoApp & glb. More st-Maps in classes.')
      ..add('Map state; st added to some classes.')
      ..add('boxServe: box-output for bind and connector AND to everybody.')
      ..add('Hide  ALL  flow-output. Do it with :glb: user parameters.')
      ..add('Enhancement: folders #corp #mis and #dev to group files.')
      ..add('Extract glb class from beta-library to: src.')
      ..add('Extract GlobalOp from beta to: src as: affair.')
      ..add('Reolve: word-preferences, class to src/  Out of connector class.')
      ..add('Connector class-opJoin  modification')
      ..add(':bind: moved from connector to own library: class Bind in src/.')
      ..add(':bind: / binding in opCom:con: and shower: data and more clarity.')
      ..add('dawo_example.dart had total reconstruct. Was really needed.')
      ..add('Connector & Corporation > opCom console outPut in schedule.')
      ..add('Made shower.scheduleBox() a class.')
      ..add('Solved BUG: m.opRoll: autoRollFunc-Works. #NAME: :courier:Func.')
      ..add('Out-comment all typedef stuff, use effPrint & flowC.')
      ..add('Marked BUG: when mission-render : choreL list is emptyl')
      ..add('Marked BUG: m-render to mission.opRoll: autoRollFunc DoNotWork')
      ..add('Cleared all -not-used-library errors.')
      ..add(combi)
      ..add('beta -library total renovation, and connections to it.')
      ..add('base_struct & base_lib renamed to: alpha and  beta -libraries.')
      ..add('New Store class, all Streams are now: supply and demand.')
      ..add('6 class Group and Member in base_struct. RENAMED: alpha. !!')
      ..add('Corporate class, previous #common operate from beta.dart.')
      ..add('6 Solving chaos : changing names to privat and original ones.')
      ..add('6 Solving chaos : console output is now only 22 screens.')
      ..add('6 solving chaos : :who:did:this: to mark outputs in console.')
      ..add('6 Nearing chaos : was hard to spot: #whoPrintedThisToConsole.')
      ..add('6 typedef effPrint conPrint aso and method inside class.')
      ..add('6 Connector: much activity; ERROR: dartdoc fails.  ')
      ..add('6 dawolang: using 0.0.1 in connector opJoin to check #words.')
      ..add('5  Shorter names, dawo away: connector.dart, mill.dart.')
      ..add('5  Effort-diagonal got recommendation and JSON lists.')
      ..add('5  Only Chore knows the one and only instance of Effort.')
      ..add('5  JSON stuff moved from Effort to clay/user_json.dart.')
      ..add('5  Shower: all screen presentations moved here.')
      ..add('5  Formed iterable-diagonal preentation with boxed add-on-lists.')
      ..add('5  Changed choreL mlists to maps.')
      ..add('5  Splitted cheduleBox functions parts to tools.')
      ..add('5-  Effort class for user-chore-data. And JSON data handling. ')
      ..add('5-02 Cascades in devNotes and names are now: admN, devN aso.')
      ..add('5-01 All in tools removed inside a new Tool, tl class.')
      ..add('10 In analyzis options file: analyzer: strong-mode: true.')
      ..add('9 Added copyright notice to every lib/ file.')
      ..add('8 Changed library dawo_tools name to: tools.dart.')
      ..add('7 Equipment, equ class to keep material and name resources.')
      ..add(
          '6 Missions specific op-methods, cheduleBox for resource allocating.')
      ..add('dev: doneL added to keep track of fast changes. 10.10.17')
      ..add('flowserve: added flowI event counter. In beta: flowI. 10.10.17')
      ..add('Mission: shortened arrows: -->-m--> and  <-m--<--. 10.10.17.')
      ..add('Info about older notes should apper in lists.');

    admN
      ..addAll([
        'adm: #Principle: do not mess, keep it simple.',
        'schedule : meeting thursday.'
      ])
      ..addAll(
          ['adm: Must be strict all the time.', 'Keep good care of people.'])
      ..addAll([
        'adm: Week schedule must include total check at least 3 times in a week.',
        'System cleaning of old log-notes is not necessary every week. 2 times in a month is enough.'
      ]);

    devN.addAll([
      'Priority: rumba and web.',
      'Create all instances in the  ?? ri? lib.'
    ]);
    innoN.add('Order - obey fields for master - servant objects. #chore.');
    innoN.addAll(['-Counters?', 'Mongo-DB', 'Indexed-DB', 'User-class']);
    innoN.add('#CallChain, to track call-route of every current command.');
    howToN
      ..addAll(['Web-html?', 'Typedef?', 'Connector?', 'Streams?', 'Async?'])
      ..addAll(
          ['Name: base-lib?', 'User-action?', 'Print-output-variables-logos.']);
    secN.addAll(
        ['Restrict use of certain methods.', 'Create up-level pass-word.']);
  }

  ///  callers: no usages.
  ///  More demonstrative devBox presentation method.
  void showNotes(String caller) {
    print('\n ------->>-->>--  dev.showNotes  by: $caller ------->>-->>--   ');
    devBox('By:dev:', ['* header *', '* footer *'], [dev.admN, dev.devN], 0);
    devBox('By:dev:', ['* header *', '* footer *'], [dev.innoN, dev.howToN, dev.secN], 0);
    //  :debug: is 75, 20  good??
    devBox('By:dev:versions:', ['* header *', '* footer *'], [tl.mapToFineList(dev.later, 75, 20) ,tl.mapToFineList(dev.version008 , 75, 20)], 0);
    print('--<<--<<------------  dev.showNotes  --<<--<<------------ \n  ');
  }

  ///  Old-fashioned list print method.
  void listNotes(String caller) {
    print('\n ------->>-->>--  dev.listNotes  by: $caller ------->>-->>--   ');
    dev.howToN.add('dev-Show-Notes:  How to add 8-indent in show?  ');
    dev.secN.add('dev-Show-Notes:  howTo keep some notes secret?  Sec? ');
    admN.forEach(print);
    print(' ');
    devN.forEach(print);
    print(' ');
    innoN.forEach(print);
    print(' ');
    howToN.forEach(print);
    print(' ');
    secN.forEach(print);
    print('--<<--<<------------  dev.listNotes  --<<--<<------------ \n ');
  }
} //  -----  class dev

///  Create instance of class Dev.
var dev = new Dev();

//TODO  teamHowTo lists: add:   automatize adding notes to lists?
//TODO  teamInno  notes:  automatic roll of createNotes.? no; events..?

//TODO  teamHowTo stream    define a stream transformer
/*
var transformer = new StreamTransformer.fromHandlers(handleData: (value, sink) {
// create two new values from the original value
sink.add("Message: $value")
  .add("Body: $value");
});

// transform the stream and listen to its output
stream.transform(transformer).listen((value) => print("listen: $value"));

//TODO  teamEdu  devNotes..  instead of TO-DO-notes..
//TODO  teamEdu  ..for to not spam dawo package with -notes

var devTestStreamData = ['devTestStream, for notes and testing',
                         'Next note.. aso'
                         ]; // later more notes to come...
var devTestStream = new Stream.fromIterable(devTestStreamData);
*/


///  #howTo do these?
void addDawoDevNotes() {
  print('--  empty addDevNotes function  --');
  //  code here.
  print('--  not clear yet, how this must be done  -- \n');
}
