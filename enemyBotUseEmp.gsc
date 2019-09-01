botEmp()
{
	ownerTeam = self.pers["team"];

	foreach(player in level.players)
	{
		playerTeam = player.pers["team"];
		
		if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] && playerTeam != ownerTeam )	
		{
			player thread maps\mp\killstreaks\_emp::EMP_Use( player, 1 );
				break;
		}	
	}
}