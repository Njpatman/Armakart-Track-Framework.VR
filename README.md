
Armakart V2.5

Welcome to Armakart, a Arma 3 race system heavily designed around the concepts and ideas of Mariokart.

This is the Framework for players to create their own Armakart tracks. Requries: Ace, Cup Terrains - Core, and CBA_A3.

Please reference Armakart Track Framework Setup Guidelines.txt once you've downloaded the mission folder and have opened up the mission in eden editor.

Make sure to remove "-main" from the downloaded folder "Armakart-Track-Framework.VR-main" or else the editor will not open up the mission file.

Updating to latest version of 2.5

You no longer need checkpoint triggers in the editor, you can remove all checkpoint triggers (NOT THE FINISH LINE TRIGGER) unless you have some special sized checkpoints, in which case reference Armakart Track Framework Setup Guidelines line 76.

In the Finish line trigger, replace whatever is in the "On Activation" box with: call NJP_Client_Fnc_Finish_Line;

In each powerup blocks' atributes in the editor, scroll all the way down until you hit the Object Specific atribute, change Texture #0 and Texture #1 to:

Armakart_Main\Armakart_UI_&_Textures\Powerup_Block.paa

That should be everying, Happy karting!

Credits

Armakart was created by Njpatman

Thanks to Whale for his AMAZING nametag script.

Thanks to Aeroson and his AMAZING player map markers script.

Thanks to jkl25000 for helping me out with scripting, testing, texturing, and being an overall bro through the creation of this.

Thanks to The Canadian, Kaltag, and all the lovely and beautiful people over at coalitiongroup.net for helping me test and improve Armakart from its initial release 2 years ago to what you see today.
