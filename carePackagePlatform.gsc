callPlatform()
{
		
	myOrigin = self.origin + (0, 0, 150);
	
	for(i = 0; i < 5 ;i++)
	{		
		doPlatform(myOrigin,i);
	}
}

doPlatform(origin,row)
{
	self endon ("disconnect");
				
	
	for(i = 0; i < 5 ;i++)
	{
		carePackageOrigin = origin;
		
		if ( row == 0 )
			carePackageOrigin = origin + ( i*50,25,0);
		if ( row == 1 )
			carePackageOrigin = origin + (i*50,50,0);
		if ( row == 2 )	
			carePackageOrigin = origin + (i*50,75,0);
		if ( row == 3 )
			carePackageOrigin = origin + ( i*50 , 100, 0);
		if ( row == 4 )	
			carePackageOrigin = origin + ( i*50 ,125 ,0);
			
		waitframe();
		Mod=spawn("script_model",carePackageOrigin);
		Mod setModel("com_plasticcase_enemy");
		Mod CloneBrushmodelToScriptmodel(level.airDropCrateCollision);	
		
	}	
}