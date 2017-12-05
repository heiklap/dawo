// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *  missions: primary Dawo workPlatforms, they have chores that do the job.
/// *  dawoApp builds all the missions and their chores.
/// * Mission data.
//

part of missions;

///  Fill certain fields
class MissionData {
  //  Constructor fills name and motto fields
  //  clause, info aso fields must get their data
  /*
    packDawoMission,
    helsinkiMission,
    dartlangMission,
    myMusicMission,
    myTimeMission,
    nationalParksMission
   */

  String name = 'MissionData class';

  //  info Map
  void roll() {
    print(':M:D:roll: -->-->  :mission:data:roll: by mission:Build -->>-->>');

    /// #NEXT: Carry values to scoutJoin in connector
    /// Fields describe actions in connector and binding.
    packDawoMission.infoM = {
      'purpose':
          ':packDawo :Learn :Programming  :MATH :VISUALIZE :THINKING :PLAN',
      'lang': ':packDawo :LANG :HERE :ARE :ALL :WORDS :FIND_MORE :SAVE',
      'area': ':packDawo :WEB  :MOBILE :CL aso :SERVER :CLIENT :DB',
      'product': ':packDawo :dawolang :dawo :huilo :punch :parley aso',
      'offer': ':packDawo :BuyME :RentME :SendMe :HireMe',
      'buy': ':packDawo :ADVIDCE :TIME :MyTime',
      'ask': ':packDawo :Stack :GITTER :ASK3',
      'always': ':packDawo :alwaysX :alwaysY :alwaysZ :packDawo',
      'newer': ':packDawo :NO :UGLY :HUILO :ANGRY :SORROW'
    };
    packDawoMission.clause =
        'packDawo :ALL :QUEST :HELP :FIND :DATA :CODE :FREE';

    //
    helsinkiMission.infoM = {
      'purpose': ':helsinkiMis: :ThisMissionBLAA blaa blaa',
      'lang': ':HMis: :LANG :STADI :SUOMI :ME :OPI :TULE :TAIDE :TIEDE :TALOUS',
      'area':
          ':HMis: :ART  :ACTIVITY :SPACE :OUTDOOR :BAR :CAFE :ECONOMY :TOURISM',
      'product': ':HMis: :AIR :FREE_TIME :NATURE :PARK :MUSEUM :ARCHITECTURE',
      'offer': ':HMis: :ALE :TODAY :FOR_SALE :FOR_RENT :FREE :',
      'buy': ':HMis: :MATERIAL :TIME',
      'ask': ':HMis: :ASK1 :ASK2 :ASK3',
      'always':
          ':HMis: :PEACE :CLEAN :TRUST :HAPPY :BEAUTY :NATURE :SERVICES :TRANSPORT',
      'newer': ':HMis: :FEAR :MISTRUST :CRIME : :HUILO'
    };
    helsinkiMission.clause = ':ALL :QUEST :HELP :FIND :DATA :CODE';

    //
    dartlangMission.infoM = {
      'purpose': ':dartlangMis :WebProgramming :Tools :library :api',
      'lang': ':dlMis :EASY :FAMILIAR :NEW :EFFECTIVE :WEB :',
      'area': ':dlMis :WEB  :MOBILE :CL aso :SERVER :CLIENT :DB',
      'product':
          ':dlMis :LANGUAGE :API :TOOLS :COMMUNITY :HELP :FLUTTER :ANGULAR',
      'offer': ':dlMis :Power :Learn :Help :Info :Examples',
      'buy': ':dlMis :Jobs :License :Projects :PushRequests :',
      'ask': ':dlMis :GitHub :Stack :Gitter :GPlus :Misc',
      'always': ':dlMis :FREE :FRENDLY :EASY :FAST :',
      'newer': ':dlMis :HUILO :BAD :UGLY :SORROW :ANGRY :UNTRUST :'
    };
    dartlangMission.clause = ':ALL :QUEST :HELP :FIND :DATA :CODE';

    //
    myMusicMission.infoM = {
      'purpose': ':myMusicMis :JOY :ENTERTAINMENT :COMMUNITY :',
      'lang': ':mmMis :HEAR :LISTEN :MY :ListenMe :Train :HighLevel :Practice',
      'area': ':mmMis :Country  :Folk :own :Misc :Operett :Classic :Old :',
      'product': ':mmMis :CONCERT :JAM :StreetMusic :PARTY :DRUNKEN_PARTY',
      'offer': ':mmMis :EVENT :BuyMe :RentME :ListenMe',
      'buy': ':mmMis :MATERIAL :TIME',
      'ask': ':mmMis :SingTechnic :Tenor :MusicTheory',
      'always': ':mmMis :Peace :Beauty :Hope :Understand :',
      'newer': ':mmMis :NO :UGLY :HUILO :Disappointment :Fear'
    };
    myMusicMission.clause = ':ALL :QUEST :HELP :FIND :DATA :CODE';

    //
    myTimeMission.infoM = {
      'purpose': ':myTime :Effectiveness :SYSTEM :ORDER ',
      'lang': ':myTime :TIME :NOW :SOON :NEWER :SAVE :WASTE',
      'area': ':myTime :TODAY  :TOMORROW :NEXT',
      'product': ':myTime :Peace :Order :',
      'offer': ':myTime :BuyMyTime :Mayber :Rarely :OnlyByOrder',
      'buy': ':myTime :Programming :Learning :Education',
      'ask': ':myTime :YouHaveTime :When :HowLong',
      'always': ':myTime :alwaysX :alwaysY :alwaysZ :myTime',
      'newer': ':myTime :NO :Hurry :UnOrder :Fussy :HUILO :Rush'
    };
    myTimeMission.clause = ':ALL :QUEST :HELP :FIND :DATA :CODE';

    //
    nationalParksMission.infoM = {
      'purpose': ':natParkMis :Movement :Freshment :Health :Nature',
      'lang': ':npMis :LANG :HERE :COME :VISIT :ENJOY :WALK',
      'area': ':npMis :SEA  :LAND :FOREST :MORE :',
      'product': ':npMis :NATURE :ANIMALS :EXPERIENCE :FRESH_AIR',
      'offer': ':npMis :COME_HERE :JOIN_GROUP :RENT_COTTAGE :ORDER_ROOM :HIKE',
      'buy': ':npMis :RENT_COTTAGE :RENT_CAR :RENT_QUIDE :BUY_READY_TRIP',
      'ask': ':npMis :MAP :INFO :QUIDE :ROOM :DANGER :FIRST_HELP',
      'always': ':npMis :Healthy :Cheap :Special :Fendly :',
      'newer': ':npMis :NO :UGLY :HUILO :Shit :Hostile :Unfrendly'
    };
    nationalParksMission.clause = ':ALL :QUEST :HELP :FIND :DATA :CODE';

    print(':M:D:roll: --<<--<<  :mission:data:roll: done --<<--<<');

    //  #NEXT  give data also to other missions
  }
} //  -----  MissionData

///
var missionData = new MissionData();
