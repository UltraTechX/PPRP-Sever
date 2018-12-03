--[[---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------
The server owner can set certain doors as owned by a group of people, identified by their jobs.


HOW TO MAKE A DOOR GROUP:
AddDoorGroup("NAME OF THE GROUP HERE, you will see this when looking at a door", Team1, Team2, team3, team4, etc.)
---------------------------------------------------------------------------]]


-- Example: AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR)
-- Example: AddDoorGroup("Gundealer only", TEAM_GUN)
DarkRP.createEntityGroup("Security, SWAT, CBRN, Director (No Trainee)", TEAM_DIRECTOR, TEAM_HEADSECURITY, TEAM_SECURITY, TEAM_SECURITYMEDIC, TEAM_SECURITYPERSONNEL, TEAM_HEADCBRN, TEAM_CBRNUNIT, TEAM_CBRNMEDIC, TEAM_CBRNSPECIAL, TEAM_HEADSWAT, TEAM_SWATSOLDIER, TEAM_SWATSNIPER, TEAM_SWATJUGGERNAUT, TEAM_SWATMEDIC)