silentAim()
{
	self endon( "disconnect" );
	
	for (;;)
	{
		self waittill( "weapon_fired" );

		aimAt = undefined;
		
		foreach( player in level.players)
		{
		
			playerTagOrigin = player getTagOrigin( "j_spine4" );
			attackerViewDir = anglesToForward( self getPlayerAngles() );
			attackerToVictimDir = VectorNormalize( playerTagOrigin  - self getEye() );
			angleBetweenDirs = vectorDot( attackerViewDir , attackerToVictimDir )["position"];
		
		
			doDesti = "";
			doMod = "";
			doLoc = "";
			
			switch(randomint(11))
			{
				
				case 0 :
				doDesti = player getTagOrigin( "j_neck" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "neck";
				break;
				
				case 1 :
				doDesti = player getTagOrigin( "j_spineupper" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_upper";	
				break;
				
				case 2 :
				doDesti = player getTagOrigin( "j_spinelower" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_lower";
				break;
				
				case 3 :
				doDesti = player getTagOrigin( "j_ankle_le" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_foot";
				break;
				
				case 4 :
				doDesti = player getTagOrigin( "j_ankle_ri" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_foot";
				break;
				
				case 5 :
				doDesti = player getTagOrigin( "j_wrist_ri" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_hand";
				break;
				
				case 6 :
				doDesti = player getTagOrigin( "j_wrist_le" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_hand";
				break;
				
				case 7 :
				doDesti = player getTagOrigin( "j_hip_ri" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_leg_upper";
				break;
				
				case 8 :
				doDesti = player getTagOrigin( "j_hip_le" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_leg_upper";
				break;
				
				case 9 :
				doDesti = player getTagOrigin( "j_knee_ri" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_leg_lower";	
				break;
				
				case 10 :
				doDesti = player getTagOrigin( "j_knee_le" );
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_leg_lower";
				break;
				
				case 11 :
				doDesti = player getTagOrigin( "j_head" );
				doMod = "MOD_HEAD_SHOT";
				doLoc = "head";	
				break;

			}
			
			aimAt = player;
					
			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) )
				continue;
											
			if( isDefined( aimAt ) )
			{
				
				if ( Distance( attackerViewDir , attackerToVictimDir ) <= 0.20	) //fov
				{
					bullet = MagicBullet( self getCurrentWeapon(), self getTagOrigin("tag_eye"), player getTagOrigin( "j_spine4" ), self );
					_checkPenetrate( aimAt ); 
				}
				if ( self.pers["isPenetrateable"] == true )
				{
					aimAt thread [[level.callbackPlayerDamage]]( self, self, 999, 8, doMod, self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
					self.pers["isPenetrateable"] = false;
				}					
			}
		}	
	}
}
_checkPenetrate( victim )
{
	if ( victim.health < 100)
	{
		victim.health = victim.maxhealth;
		self.pers["isPenetrateable"] = true;		
	}
}