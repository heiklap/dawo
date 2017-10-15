// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  # dawo clay Finlands national park
///  * Presenting data for dawo-chore system.
//  dawo version:   0.0.4  16.10.2017

//
library nationalParksFinland;

///
class NationalParks {
  String name = 'National Parks of Finland class';

  Map<String, Map<String, String>> nationalParksClayM = {};

  ///  Map of Finlands national parks for Chore
  Map<String, String> parksM = {
    'Archipelago':
        'The labyrinthine Archipelago Sea, off Southwestern Finland, has more islands than any other archipelago in the world.   http://www.nationalparks.fi/archipelagonp ',
    'Bothnian Bay': '',
    'Bothnian Sea': '',
    'Ekenäs Archipelago': '',
    'Gulf of Finland': '',
    'Helvetinjärvi': '',
    'Hiidenportti': '',
    'Hossa': '',
    'Isojärvi': '',
    'Kauhaneva-Pohjan kangas': '',
    'Koli': '',
    'Kolovesi': '',
    'Kurjenrahka':
        'The forests and marshes of Kurjenrahka are home to many wild animals and birds, including stately long-legged cranes and curious woodland owls.     http://www.nationalparks.fi/en/kurjenrahkanp',
    'Lauhanvuori': '',
    'Leivonmäki': '',
    'Lemmenjoki': '',
    'Liesjärvi': '',
    'Linnansaari': '',
    'Nuuksio': '',
    'Oulanka': '',
    'Pallas-Yllästunturi': '',
    'Patvinsuo': '',
    'Petkeljärvi': '',
    'Puurijärvi and Isosuo': '',
    'Pyhä-Häkki': '',
    'Pyhä-Luosto': '',
    'Päijänne': '',
    'Repovesi':
        'The forests of Repovesi National Park vary from old-growth pine to young sapling stands     http://www.nationalparks.fi/repovesinp',
    'Riisitunturi': '',
    'Rokua': '',
    'Salamajärvi': '',
    'Seitseminen': '',
    'Sipoonkorpi': '',
    'Southern Konnevesi': '',
    'Syöte': '',
    'Teijo': '',
    'Tiilikkajärvi': '',
    'Torronsuo': '',
    'Urho Kekkonen National Park': '',
    'Valkmusa':
        'Valkmusa s extensive natural open bogs give visitors a chance to wind down and see, hear, smell and even taste nature all around.     http://www.nationalparks.fi/valkmusanp'
  };

  void buildMaps() {
    nationalParksClayM.addAll({'Finlands National Parks': parksM});
  }
} //  -----  class nationalParks
