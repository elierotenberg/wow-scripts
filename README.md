### Misc WoW tools

#### ERT Export Groups

[Online version](https://repl.it/@ElieRotenberg/ERT-Groups-Export#data.lua)

Offline:
* Install `lua`
* Create a file, e.g. `export-groups-input`, paste full groups from Google Doc or other input formatted like:
```Sophistie	Pyrhos	Furyprotein	Rolfo	Khrogar
Bustaflex	Kléio	Lvmh	Grominette	Lowryn
Runnardo	Sükä	Merwish	Sumi	Wyll
Dyzenberg	Søldatvosnir	Merlinette	Miles	Saybeurre
Kala	Rytkor	Endgeal	Katgramm	Takeoff
Phaet	Olfaim	Metzgaer	Nedria	Nês
Kaylene	Turtle	Chroma	Maxideluxe	Divinum
Tikoo	Blablabá	Biou	Bubux	Azaghâl
```

Multiple spaces, new lines, etc., are all ignored.

* Run `lua ./lua/ert-export-groups.lua < export-groups-input`
* Copy/paste output into ERT addon