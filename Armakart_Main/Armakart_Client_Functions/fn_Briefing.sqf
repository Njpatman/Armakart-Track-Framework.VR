#include "Armakart_BriefingCore.sqf" //DO NOT REMOVE

NEWTAB("Description")
	<br/><font color='#e01010' size='24' face='PuristaBold'>Armakart V2.5</font>
	<br/>
	<br/>Welcome to Armakart, a Arma 3 race system heavily designed around the concepts and ideas of Mariokart.
	<br/>
ENDTAB;

NEWTAB("How to play")
	<br/>
	<br/><font color='#10e097' size='28' face='PuristaBold'>How to play</font>
	<br/>
	<br/>If you've ever played Mariokart, you'll know how to play Armakart.
	<br/>
	<br/>I'm not going to go into every single mechanic that has been implemented, everything should be perfectly self explanatory.
	<br/>
	<br/>Check the Hotkeys and Navigation briefing tab to understand how to use important game functions!
	<br/>
	<br/><font color='#12aa70' size='18' face='TahomaB'>Note: All players must follow gameplay rules and concepts defined in the briefing tab, failure to follow these rules can lead to you ruining the race for everyone else.</font>
	<br/>
ENDTAB;

NEWTAB("Gameplay rules and concepts")
	<br/><font color='#FF8000' size='28' face='PuristaBold'>Gameplay Concepts</font>
	<br/>
	<br/><font color='#FF8000' size='20' face='PuristaBold'>Boost Pads/Powerup Blocks</font>
	<br/> - Boost Pads and Powerup Blocks are littered throughout the track and are designed to help give players a edge ahead of their opponents
	<br/>
	<br/><font color='#FF8000' size='20' face='PuristaBold'>Powerups</font>
	<br/> - Powerups can be anything from a VERY explosive washing machine to a banana gun, they can help you, but they can also be detrimental if used incorrectly
	<br/>
	<br/><font color='#FF8000' size='20' face='PuristaBold'>In Race UI</font>
	<br/> - The in race UI will give you an accurate display of your current lap and checkpoint.
	<br/>
	<br/> - Passengers in doubles teams may not be able to se their place, if this is the case it is up to the driver to relay that info.
	<br/>
	<br/> - Note: The in race UIs' position display will be come inaccurate if you take a shortcut or unintended map skip, it will reset to proper positioning once you go through your next checkpoint or the finish line.
	<br/>
	<br/><font color='#4da6ff' size='28' face='PuristaBold'>Gameplay Rules</font>
	<br/>
	<br/><font color='#4da6ff' size='20' face='PuristaBold'>Doubles / Singles</font>
	<br/> - You MUST stay as the role you picked, do not under any circumstance change this during the race.
	<br/>
	<br/> - Do not leave or join someones group, you WILL fuck up some scripts and it will not be pretty.
	<br/>
	<br/><font color='#4da6ff' size='20' face='PuristaBold'>Checkpoints</font>
	<br/> - Please do not place mines or bananas around checkpoints, it's a dick move, and you should feel ashamed of yourself if you do.
	<br/>
ENDTAB;

NEWTAB("Hotkeys/Controls & Navigation")
	<br/>
	<br/><font size='19'> Use Powerup:  F or Shift + F</font>
	<br/>
	<br/><font size='19'> Use Powerup Alt:  R or Shift + R</font>
	<br/>
	<br/><font size='19'> Reset To Last Checkpoint:  Ctrl + Shift + R</font>
	<br/>
	<br/><font size='19'> Reset To Last Checkpoint But ACE: Ace Self-Interact >> Reset </font>
	<br/>
	<br/>Keep in mind that if you're pressing any other key when you press one of the above keys, nothing will happen.
	<br/>
	<br/>When you recieve a powerup, the keybindings you can use will be displayed.
	<br/>
ENDTAB;

NEWTAB("Credits") //This is shown for everyone
	<br/>
	<br/><font color='#00c4fa' size='20' face='TahomaB'>Armakart was created by Njpatman</font>
	<br/>
	<br/> Thanks to Whale for his AMAZING nametag script.
	<br/>
	<br/> Thanks to Quiksilver and his AMAZING player map markers script.
	<br/>
	<br/> Thanks to jkl25000 for helping me out with scripting, testing, texturing, and being an overall bro through the creation of this.
	<br/>
	<br/> Thanks to The Canadian, Kaltag, and all the lovely and beautiful people over at coalitiongroup.net for helping me test and improve Armakart from its initial release to what you see today.
	<br/>
ENDTAB;

DISPLAYBRIEFING();
