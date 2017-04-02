# HxSvg
Work-in-progress proof-of-concept SVG library for Haxe. Based on NME/OpenFL svg solutions, but decoupled from flash drawing api. Runs on C# and Java targets. 

The SVG graphic information is abstracted to a list of graphic commands. This can be interpreted/transformed for different targets. For example can cubic bezieer (used by flash drawing API) information be transformed to quadratic bezieers used by Cairo API.

### Status
- No actual rendering, except for experimental commands-to-cairo stuff.
- Compiles and runs on neko, swf, js, java and C#
- Simple neko/cairo and C++/cairo examples - example-cairo/

### Credits
- Hugh Sanderson and Joshua Granick for all core code
- Carlos Ballesteros Velasco for Haxe-Cairo

### Screenshot
Actual pdf output from the commands-to-cairo renderer, using Haxe-Cairo:
- ![screen](/screen.png?raw=true "screen")


