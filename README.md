# HxSvg
Work-in-progress proof-of-concept SVG library for Haxe. Based on NME/OpenFL svg solutions, but decoupled from flash drawing api. Runs on C# and Java targets. Can be used for Cairo rendering.


### Status
- No actual rendering, except for experimental commands-to-cairo stuff
- Compiles and runs on neko, swf, js, java and C#
- Compiles, but doesn't run on C++ :-(

### Planned
- Sort out the C++ runtime error
- Demo examples for Neko/Cairo, C++/Cairo, Java/Swing, C#/System.Drawing, C#/Mono/Gtk#/Cairo

### Credits
- Hugh Sanderson and Joshua Granick for all core code
- Carlos Ballesteros Velasco for Haxe-Cairo

### Screenshot
Actual pdf output from the commands-to-cairo renderer, using Haxe-Cairo:
- ![screen](/screen.png?raw=true "screen")


