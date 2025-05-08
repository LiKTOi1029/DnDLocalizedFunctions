function Beginning()
	local TileSet = {{["Name"] = "Grass", ["Occupied"] = "G"},{["Name"] = "Water", ["Occupied"] = "No"}}
	local Map = {{TileSet[1],TileSet[1],TileSet[1]},
	{TileSet[1],TileSet[2],TileSet[1]},
	{TileSet[1],TileSet[1],TileSet[1]},}
	-- The map is a 3x3 area.
	for num1 = 1, #Map, 1 do
		for num2 = 1, #Map[num1], 1 do
			if Map[num1][num2]["Name"] == "Grass" then io.write("G ")
			elseif Map[num1][num2]["Name"] == "Water" then io.write("W ") end
		end
		io.write("\n")
	end
end
Beginning()
--[[
	plans
	
	Additions after coming back and re-reading this: I would like to be able to just create some sort of code-like
	format that can easily be created through somekind of level editor and then inputted into the game. So, like a
	map editor of sorts. This map editor will output a file with the necessary data of how the game is supposed to
	operate.
	
	I am going to first and foremost bring back the Table of Tables architecture for the map display, however with one
	key caveat in mind that instead of binding the player position to the map directly, the map will simply be a set of
	coordinates and the player, enemy, and other entity positions can only be placed on those listed coordinates alone.
	
	This way we won't need to worry about the map breaking or the tiles not placing or being removed properly, making
	the map more of a display than an actual core part of the mechanism which also makes custom maps a whole lot
	easier. This will be the first of my plans for the map design, but the next will be to add data to each tile,
	we know what to expect.
	
	Another thing I am going to do soon enough is somehow store player data. I might do each player's data separately
	and that way everything is separate and easier to unit test and fool-proof.
	
	Even the map data and the map itself will be separated as the map data (for the sake of running smoother) will
	only contain 1 entry per tile type while the map may have hundreds of tiles. Each 'coordinate' will be the two
	integer key values of the Table of Tables and their values will be the string correlating to the type of map tile
	each of the tiles are.
	
	Something to think about is whether I do a YOUGOIGO turn system or a WEGO system. Is Demise of Nations' WEGO better
	or worse? And why?
	
	Demise of Nations' WEGO system is best because it gives both players the ability to take damage and do damage.
]]