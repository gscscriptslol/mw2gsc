spawnCp()
{
	carePackagePosition = self.origin + (0,0,35);
	dropCrate = maps\mp\killstreaks\_airdrop::createAirDropCrate( self.owner, "airdrop",maps\mp\killstreaks\_airdrop::getCrateTypeForDropType("airdrop"), carePackagePosition );
	dropCrate.angles = self getplayerangles();
	dropCrate PhysicsLaunchServer( (0,0,0), (0,0,0) );
	dropCrate thread maps\mp\killstreaks\_airdrop::physicsWaiter("airdrop",maps\mp\killstreaks\_airdrop::getCrateTypeForDropType("airdrop"));
	self setOrigin (self.origin + (0, 0, 75) );		
}