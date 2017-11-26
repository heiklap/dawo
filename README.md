# dawo 0.0.5

Learning Dart; by building complicated Dart package with many libraries. Organizing it, finding it's 
inner connections and developing multipurpose methods.
Beginner Dart programmers kickoff to develop a glorious package. Latest code in GitHub: https://github.com/heiklap/dawo
- Read: /doc/hist_versions.txt in gitHub to see full changes to this, and coming versions.
- Blog: http://dawopack.blogspot.fi/search/label/dawo 
- Dawo is using my other package: dawolang: 0.0.1, for word recognition in connector.
## Usage
    // Mission Class has wide access to data, since they have instances of
    // Chore classes inside them, in choresL : List<CommmonChore>
    
    // Example files here rolls only once, without loops, and output their data in console.
    var dawoApp = new DawoApp('Play-rumba:dawoApp', 'By: dawo_example: dawoApp rolls missioms');
    var rumba = new Rumba();

    // This returns in addition a StringBuffer, that is not used here.
    rumba.dance(dawoApp);
    // Example apps presents output-data on windows console in flow, or in two kind of boxes. 

### Brainstorming

 Get people together, let they present ideas, collect best ideas to libraries and 
 group them meaningfully.
 Start building first new classes, but keep your mind open for intuitive solutions. 
 Leave room and time to resolve, what will be the direction of this package.
 Practise to use Dawo by finding it's properties in editor, and think their importance in app.
 
 ### Versions
 
 First dawo version was kind of artistic mess, as a consequence of long-time brainstorming.
 Dawo 0.0.1 shows starter programmers confusion, and records ways and steps out of this mess 
 to clarity and understanding. Latest code in GitHub: https://github.com/heiklap/dawo
 
 0.0.1  demonstrates how data is messy, when it is not inside classes. But you have direct 
 instant access to every piece of it. Check for pollution of public namespace!!
 
 0.0.2 version was to weed out some of the material and create a couple of classes.
     Theme : baseStructure, base_lib, dawo_mill, connector, learn/code_snippets
     
 0.0.3 Was for building first control-flow structure (Rumba.dance) to use Class-data inside app.
     Theme:  Present different Mission ( = Client / customer) data and small, elementary work-flow.
     Chores ( 7 chores by default in every Mission).  dawo_example.dart gives 14 screen-full data output.
     
 0.0.4 Version
     Theme:  Statistics, output, variation, versatility, documentation in doc-folder.
     dawo_example.dart gives 11 screen-full data output.
     
 0.0.5 High level connections between objects, placard, glb, commonOp and states.    
      
 0.0.6  Basic idea and orientation of package to resolve.
 0.0.8  Incubator idea: -move first too big parts to independent packages.
        Maybe  chore(process)  and  team
 

## Files;
### code_snippets, learn / copy-paste stuff:
- aldente_func :  Simple functions, including some logical errors. Can you spot errors?!
- bat_loop :  Control flow structure samples.
- learn_stream_sync : Examples of simple Streams. So. async stuff.

### app files
- base_lib : Develop common properties, that other libraries should depend on.
- base_struct : Structuring base classes. These two libraries do not depend other dawo files.
- chore : Start of bigger "job" / "chore" for real-world-work. Imitating functionality
      of other, bigger, same kind of library.
- connector.dart Connecting  ( as #client's) app - mission - chore together,  mediating them. 
  Seeking deep, inner connections of objects. 
- (? dawlib_coll : Resources. Examples and hacking material of Dart collections.)
- dawo.dart : main file, exports : dawo_src.dart.
- dawo_app : DawoApp class, handles Missions and keeps out-put-buffers in Map.
- dawo_dev : Classes and data, that help in developing this package. 
  Helper functions for cl (command line)and screen output.
- dawo_src : File created by stagehand plugin app.
  Here it imports all other libraries and gathers some information about them.    
- effort.dart : Human activities, chores sub, main user-activity and presentation.
- equipment.dart : Controlling material resources for Mission and Chore.
- mill : Plan: processing commands orderly, all they in row, by given priorities.
- missions : Chunk of command-processing between app and chore. Caring Chores.
  Missions keep and process data ( #clay) of their favorite area. 
- rumba.dart : Rumba classes .dance method runs here dawo's control-flow (once).
- shower.dart : presentations on console, mostly box-shaped.
- tools : Helper tools, sleep, stamps, lists aso.


src.dart imports files:

    import 'package:dawo/code_snippets/aldente_func.dart';
    import 'package:dawo/code_snippets/bat_loop.dart';
    import 'package:dawo/code_snippets/learn_stream_sync.dart';

    import 'base_lib.dart';
    import 'base_struct.dart'; //  unused
    import 'chore.dart';
    import 'connector.dart'; //  unused
    import 'dawo_app.dart';
    import 'dawo_dev.dart';
    import 'effort.dart';
    import 'equipment.dart';
    import 'mill.dart';
    import 'missions.dart';
    import 'rumba.dart'; //  unused
    import 'shower.dart';
    import 'tools.dart';
   
    ///  Data (clay) is in clay-folder.
    import 'package:dawo/clay/clay_roll.dart';
    
Creating Dawo variables in new file:

    //  create instances of classes::
    var dap = new DawoApp('exampleApp', 'Testing in dawo_example');
    // play with them in IDE:
    dap.   //  dot notation gives you hint of classes properties.
    var mission = new Mission('#name','#state');  //  #state  ? :)
    mission.
 
    var ch = new Chore('#name','info');
    // play with them:
    ch.
    ///  connector is in very early state
    var connector = new Connector('name','info');
    connector.

// Using Dawo in your web app: (Dawo do not include HTML-code) 
    
    Add to your pubspec.yaml:
    dependencies:
      dawo: 0.0.4
      
    dev_dependencies:
      browser: ^0.10.0
      dart_to_js_script_rewriter: ^1.0.1
      
    //  your main.dart
    import 'dart:html';
    import 'package:dawo/dawo.dart';
    import 'package:dawo/rumba.dart';
    import 'package:dawo/dawo_app.dart';    
      
    main() {
      //  Create classes as above. Or copy code from: Usage:
      
      var dawoApp = new DawoApp('Pplay-rumba:dawoApp', 'By: dawo_example: dawoApp rolls missioms');
      var rumba = new Rumba();
      rumba.dance(dawoApp);
    }
    // Run code in browser and check console output: Ctrl-Shift-i 
    // Or make html templates that catch output to text fields / elements.

###  About variable names and Classes in Dawo
Play in IDE editor with alphabet: a..z to see, what variables are available.
See how common namespace might become polluted with unnecessary stuff, and try to find
a way, to organize them/ your variables to meaningful classes.

Like:

    baseLib. 
    goals, teams, temps
    morn, night, day 
    dev, make, init 

Test objects in code_snippets-folder / learn...  -section. 
These files might be best, when copy-pasted and studied in computer.

    Joker.., aldente...  bat...

    sleep(), start..()  
    render....()

    ride....()   roll(....) 
    // Watch: init.. build.. roll.. show.. done method-cycle.


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/heiklap/dawo/issues
