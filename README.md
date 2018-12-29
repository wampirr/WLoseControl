# wLoseControl for 3.3.5
Simple PvE + PvP @player-only remake of LoseControl WoW addon for Lich King 3.3.5a

While effective and beatiful for solo play, it does not replace DBM, Gladius, etc

Featuring:
- only player frame
- built in timer(can be disabled)
- PvE & PvP profiles
- new and better priority
- buffs can be added too
- little impovements

Details:
- simple control through chat commands: 
	/wlc
- buff and debuff control right in lua file(sry guys):
  add lines with spellIds(found in a wowDB you like) and priority
  also ids can be found in <wow_folder>\WTF\Account\<account_name>\SavedVariables\wLoseControl.lua
  (list of in game seen ids)  
- priority is shared between buffs and debuffs
(higher prio buff is shown over low prio debuff,
 debuff is shown if prio equals,
 to override any aura you need higher prio on another one)  
  ...