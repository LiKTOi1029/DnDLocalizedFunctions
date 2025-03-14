function Beginning()
	repeat
		io.write("Please input a number equal to or greater than 4: ")
		local choice, boolean, result = io.read("*l"):gsub("\n",""), false
		local choice = tonumber(choice)
		if choice < 4 then print(choice.." is less than 4")
		else boolean = true; result = TableCreation(choice) end
	until boolean == true
	return result
end
function TableCreation(choice)
	local Table, result, PlayerPos = {}, "Finished"
	for num1 = 1, choice, 1 do
		local NewTable = {}
		for num2 = 1, choice, 1 do
			if num1 == math.ceil(choice/2) and num2 == math.ceil(choice/2) then
				table.insert(NewTable, "P")
				PlayerPos = {math.ceil(choice/2), math.ceil(choice/2)}
			else table.insert(NewTable, "O") end
		end
		table.insert(Table, NewTable)
	end
	MovementPicker(Table, PlayerPos)
	return result
end
function MovementPicker(FinalBoard, PlayerPos)
	repeat
		
		io.write("Please input a direction to move across the 2x2 space like a hexagonal plane\n".."Directions: Lower-Right (LR), Upper-Right (UR), Lower-Left (LL), Upper-Left (UL), Up (U), Down (D)\n")
		local choice = io.read("*l"):gsub("\n","")
		if choice:lower() ~= "exit" then MovementFunction(choice, FinalBoard, PlayerPos) end
	until choice:lower() == "exit"
end
function MovementFunction(choice, FinalBoard, PlayerPos)
	if SquareHexer(FinalBoard, PlayerPos) == "ODD" then
		PlayerPos = OddMovement(choice, PlayerPos)
	elseif SquareHexer(FinalBoard, PlayerPos) == "EVEN" then
		PlayerPos = EvenMovement(choice, PlayerPos)
	end
end
function SquareHexer(FinalBoard, PlayerPos)
	local result
	if (FinalBoard[PlayerPos[1]][PlayerPos[2]]%%2) == 1 then result = "ODD"
	else result == "EVEN" end
	return result
end
function EvenMovement(choice, PlayerPos)
	local result
	if choice:lower():gsub("-","") == ("lowerright" or "lr") then 
		PlayerPos[1] = PlayerPos[1]+1
		PlayerPos[2] = PlayerPos[2]+1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperright" or "ur") then
		PlayerPos[1] = PlayerPos[1]+1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("lowerleft" or "ll") then
		PlayerPos[1] = PlayerPos[1]-1
		PlayerPos[2] = PlayerPos[2]+1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperleft" or "ul") then
		PlayerPos[1] = PlayerPos[1]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("up", "u") then
		PlayerPos[2] = PlayerPos[2]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("down", "d") then
		PlayerPos[2] = PlayerPos[2]+1
		return PlayerPos
	else
		result = "This is not a valid option!"
		return result
	end
end
function OddMovement(choice, PlayerPos)
	local result
	if choice:lower():gsub("-","") == ("lowerright" or "lr") then 
		PlayerPos[1] = PlayerPos[1]+1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperright" or "ur") then
		PlayerPos[1] = PlayerPos[1]+1
		PlayerPos[2] = PlayerPos[2]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("lowerleft" or "ll") then
		PlayerPos[1] = PlayerPos[1]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperleft" or "ul") then
		PlayerPos[1] = PlayerPos[1]-1
		PlayerPos[2] = PlayerPos[2]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("up", "u") then
		PlayerPos[2] = PlayerPos[2]-1
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("down", "d") then
		PlayerPos[2] = PlayerPos[2]+1
		return PlayerPos
	else
		result = "This is not a valid option!"
		return result
	end
end

print(Beginning())
--[[extra guideline for the developer:
The directions:
Positive PlayerPos to go right and down
Negative PlayerPos to go left and up
]]