# dawo 0.8.5

    
https://pub.dartlang.org/packages/dawo

Fixed health suggestions and formatting issues and some small changes. 
Dawo is beginner Dart programmers project to learn Dart by developing a glorious package.
- Complicated and copious  spectrum of classes, functions and methods sets creator and user to situation where must 
take challenging effort to manage and exploit all the features. Here is plenty of room for imagination and ideas. For
beginner programmes this is one way to simulate real-world development stress.
- Latest code in GitHub: https://github.com/heiklap/dawo
- Read: /doc/hist_versions.txt in gitHub to see full changes to this, and coming versions.
- Blog: http://dawopack.blogspot.fi/search/label/dawo 
- Dependencies:  Dawo is using my other package: dawolang: 0.0.1, for word recognition in connector.
## Usage
    // Mission Class has wide access to data, since they have instances of
    // Chore classes inside them, in choresL : List<CommmonChore>   
    // Example files here rolls only once, without loops, and output their data in console.
    // To run dawoApp in rumba demands two imports:
    import 'package:dawo/rumba.dart';
    import 'package:dawo/dawo_app.dart';
    ///  Instance of dawoApp is already created inside package.
    dawoApp.name = 'Play-rumba:dawoApp';
    dawoApp.motto = 'By: dawo_example: dawoApp rolls missioms');
    //  or using init:
    dawoApp.init(':dawpApp:daily:bundle:', 'By: :daily:bundle:test:');
  
    var rumba = new Rumba();

    // This returns in addition a StringBuffer, that is not used here.
    rumba.dance(dawoApp);
    // Example apps presents output-data on windows console in flow, or in two kind of boxes. 
    
### Packages shape
    Purpose and direction of this package: do one clearly restricted thing and do it well.
    Not commercial program; using promos, demos to imitate realWorld functionality.
    Extra functionality is done by plugins that connect to other packages.

### Brainstorming

 Get people together, let they present ideas, collect best ideas to libraries and 
 group them meaningfully.
 Start building first new classes, but keep your mind open for intuitive solutions. 
 
 Practise to use Dawo by finding it's properties in editor, and think their importance in app.
 
 ### Versions
 
 First dawo version was kind of artistic mess, as a consequence of long-time brainstorming.
 Dawo 0.0.1 shows starter programmers confusion, and records ways and steps out of this mess 
 to clarity and understanding. Latest code in GitHub: https://github.com/heiklap/dawo
 
 0.0.1  demonstrates how data is messy, when it is not inside classes. But you have direct 
 instant access to every piece of it. Check for pollution of public namespace!!
     
 0.0.3 Was for building first control-flow structure (Rumba.dance) to use Class-data inside app.
     Theme:  Present different Mission ( = Client / customer) data and small, elementary work-flow.
     Chores ( 7 chores by default in every Mission).  dawo_example.dart gives 14 screen-full data output.
     
 0.0.4 Version
     Theme:  Statistics, output, variation, versatility, documentation in doc-folder.
     dawo_example.dart gives 11 -36 screen-full data output.
     
 0.0.5 High level connections between objects, placard, glb, commonOp and states.    
 0.0.6 box_serve presentation and corporate.     
 0.0.7 Connector and #say language, scout class and join.

 0.0.75 Mission act Map. Instance of dawoApp is now created inside app. 
 0.0.78 Updated to be dart2 compatible.
 
 0.0.8  Fixed health suggestions and additional 21 files with analysis or formatting issues.
 0.1.0  Migrating to null safety.
 0.2.0 - 0.9.0  Series of cleaning, saved in gitHub

## Files;
### code_snippets, learn / copy-paste stuff:
- aldente_func :  Simple functions, including some logical errors. Can you spot errors?!
- bat_loop :  Control flow structure samples.
- learn_stream_sync : Examples of simple Streams. So. async stuff.

### app files
- alpha : Structuring base classes. These two libraries do not depend other dawo files.
- beta : Develop common properties, that other libraries should depend on.
- dawo.dart : main file, exports : dawo_src.dart.
- dawo_app : DawoApp class, handles Missions and keeps out-put-buffers in Map.
- dawo_src : File created by stagehand plugin app.
- mill : Plan: processing commands orderly, all they in row, by given priorities.
- rumba.dart : Rumba classes .dance method runs here dawo's control-flow (once)
- shower.dart : presentations on console, mostly box-shaped. src/box_serve.dart makes it better!
- tools : Helper tools, sleep, stamps, lists aso.Helper functions for cl (command line)and screen output.

- mis/missions : Chunk of command-processing between app and chore. Caring Chores.
  Missions keep and process data ( #clay) of their favorite area.
- mis/chore : Start of bigger "job" / "chore" for real-world-work. Imitating functionality
      of other, bigger, same kind of library.
- mis/effort.dart : Human activities, chores sub, main user-activity and presentation.
- mis/equipment.dart : Controlling material resources for Mission and Chore. 
- mis/camp : Scout class has connected objects stuff.     
      
- corp-folder has corporate, affair, resolve and store classes.      
- corp/connector.dart Connecting  ( as #client's) app - mission - chore together,  mediating them. 
  Seeking deep, inner connections of objects. 
  
- clay-folder has data  
- (? dawlib_coll : Resources. Examples and hacking material of Dart collections. Missing / todo)

- dawo_dev : Classes and data, that help in developing this package. 
- src/box_serve gives frames for box_shaped cl outputs.
- src/glb keeps global variables.    


    
Creating Dawo variables in new file:

    // play with them in IDE:
    dawoApp.   //  dot notation gives you hint of classes properties.
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
      dawo: 0.0.7
      
    dev_dependencies:
      browser: ^0.10.0
      dart_to_js_script_rewriter: ^1.0.1
      
    //  your main.dart
    import 'dart:html';
    import 'package:dawo/dawo.dart';
    import 'package:dawo/rumba.dart';
    import 'package:dawo/dawo_app.dart';    
      
    main() {
      //  Create or init classes as above. Or copy code from: Usage:
      
      dawoApp.init(Pplay-rumba:dawoApp', 'By: dawo_example: dawoApp rolls missioms');
      //  var dawoApp = new DawoApp('Play-rumba:dawoApp', 'By: dawo_example: dawoApp rolls missioms');
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
