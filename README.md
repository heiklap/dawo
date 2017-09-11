# dawo 0.0.1

Learning Dart simple basic data for beginners, and howTo use it for building a package.
Beginner Dart programmers kickoff to develop a glorious package..
- Read: hist_versions.txt to see full changes to this, and coming versions.
## Usage
    // watch code below and example file.
    // eventually usage is planned;
    var dawoApp = new DawoApp(clayIn);
    dawoApp.roll();

### Brainstorming

 Collect people together, let they present ideas, collect best ideas to files and 
 try to group them meaningfully.
 DO NOT build many classes in this phase, for to keep your mind open for intuitive solutions. 
 Leave room and time to resolve, what will be the direction of this package.
 Practise to use Dawo by finding it's keywords in editor.
 
 ### Versions
 
 First dawo version seems to be a mess, and, yes, it is intentional so.
 dawo 0.0.1 shows starter programmers confusion, and records way and steps out of this mess 
 to clarity and understanding.
 
 0.0.1  demonstrates how data is messy, when it is not inside classes.
     Check for pollution of public namespace!!
 
 0.0.2 version is meant to weed out the material and create a couple of classes.
     Theme : baseStructure, base_lib, dawo_mill, connector, learn/code_snippets
     
 0.0.3 might be for building first control-flow structures to really use this app.
     Theme:  Choose different Client / customer data and small, playing work-flow
     
 0.0.4 Version
     Theme:  Statistics, output, variation, versatility 
      
 0.0 x  Basic idea and orientation of package to resolve.
 0.0 x  Incubator idea: -move first too big parts to independent packages.
        Maybe  chore  and  team
 

## Files;
###code_snippets, learn / copy-paste stuff:
- aldente_func :  Simple functions, including some logical errors. Find them!
- bat_loop :  control structures.
- learn_stream_sync : examples of simple Streams.

###app files
- base_lib : common properties that other libraries use.
- base_struct : structures of base classes.
- dawlib_chore : start of bigger "job" / "chore" for real-world-work. Imitating function
      of other, bigger, same kind of idea.
- dawlib_coll : examples and hacking material of collections.
- dawo.dart : main file
- dawo_app : dawoApp class, that has mission - and chore under it.
- dawo_connector.dart connecting  ( as #client's) app - mission - chore together,  mediating them
- dawo_dew : Helper functions for cl (command line)and screen testing.
- dawo_mill : Processing commands, all they in row, by privileges.
- dawo_mission : chunk of command-processing between app and chore.
- dawo_src  file created by stagehand plugin app
- dawo_tools : helper tools, sleep, stamps aso.



A simple usage example:

    import 'package:dawo/dawo.dart';
    
    // wanna import all of them?
    import 'package:dawo/code_snippets/aldente_func.dart';
    import 'package:dawo/code_snippets/bat_loop.dart';
    import 'package:dawo/code_snippets/learn_stream_sync.dart';
    
    import 'package:dawo/base_lib.dart';
    import 'package:dawo/base_struct.dart';
    import 'package:dawo/dawlib_chore.dart';
    import 'package:dawo/dawlib_coll.dart';
    import 'package:dawo/dawo_app.dart';
    import 'package:dawo/dawo_connector.dart';
    import 'package:dawo/dawo_dev.dart';
    import 'package:dawo/dawo_mill.dart';
    import 'package:dawo/dawo_mission.dart';
    import 'package:dawo/dawo_src.dart';
    import 'package:dawo/dawo_tools.dart';
    
And creating variables

    //  create classes::
    var dap = new DawoApp('exampleApp', 'Testing in dawo_example');
    dap. 
    var mission = new Mission('#name','#state');  //  #state  ? :)
    mission.
 
    var ch = new Chore('#name','info');
    ch.
    ///  connector is in very early state
    var connector = new Connector('name','info');
    connector.

// and main: 

    main() {
      //  from Dart sample:
      var awesome = new Awesome();
      
      //  play with classes
      //  dap.
   
      //  mission.
      //  ch.
      //  connector.   
      
      //  code, play with other variables
    }

###  About variable names in Dawo
Play in IDE editor with alphabet: a..z to see, what variables are available.
See how common namespace might become polluted with unnecessary stuff, and try to find
a way, to organize them/ your variables to meaningful classes.

Like:

    baseLib. 
    goals, teams, temps
    morn, night, day 
    dev
    
    make, init 

Test objects in code_snippets, learn, section, 
These files are best, when copy-pasted and studied in computer.

    Joker.., aldente...  bat...

    sleep(), start..()  
    render....()

    ride....()   roll(....) 


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/heiklap/dawo/issues
