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
		for i, k in ipairs(Table) do
			print(k)
		end
	end
	MovementPicker(Table, PlayerPos)
	return result
end
function MapRenderer(FinalBoard, PlayerPos)
	for num3, _ in ipairs(FinalBoard) do
		for num4, MapSlot in ipairs(FinalBoard[num3]) do
			if num4 % 2 == 1 then io.write(MapSlot.." ") end
		end
		io.write("\n")
		for num5, MapSlot in ipairs(FinalBoard[num3]) do
			if num5 % 2 == 0 then io.write(" "..MapSlot) end
		end
		io.write("\n")
	end
end
function MovementPicker(FinalBoard, PlayerPos)
	repeat
		print(MapRenderer(FinalBoard, PlayerPos))
		io.write("Please input a direction to move across the 2x2 space like a hexagonal plane\n".."Directions: Lower-Right (LR), Upper-Right (UR), Lower-Left (LL), Upper-Left (UL), Up (U), Down (D)\n")
		local choice = io.read("*l"):gsub("\n","")
		if choice:lower() ~= "exit" then FinalBoard, PlayerPos = MovementFunction(choice, FinalBoard, PlayerPos) end
	until choice:lower() == "exit"
end
function MovementFunction(choice, FinalBoard, PlayerPos)
	local PlayerPosOld = PlayerPos
	if SquareHexer(FinalBoard, PlayerPos) == "ODD" then
		PlayerPos = OddMovement(choice, PlayerPos)
	elseif SquareHexer(FinalBoard, PlayerPos) == "EVEN" then
		PlayerPos = EvenMovement(choice, PlayerPos)
	end
	FinalBoard, PlayerPosOld = MovementMapper(FinalBoard, PlayerPos, PlayerPosOld)
	return FinalBoard, PlayerPosOld
end
function MovementMapper(FinalBoard, PlayerPos, PlayerPosOld)
	FinalBoard[PlayerPosOld[1]][PlayerPosOld[2]] = "O"
	FinalBoard[PlayerPos[1]][PlayerPos[2]] = "P"
	return FinalBoard, PlayerPos
end
function SquareHexer(FinalBoard, PlayerPos)
	local result
	if (PlayerPos[1]%2) == 1 then result = "ODD"
	else result = "EVEN" end
	return result
end
function EvenMovement(choice, PlayerPos)
	local result
	if choice:lower():gsub("-","") == ("lowerright" or "lr") then 
		PlayerPos[1] = PlayerPos[1]+1
		PlayerPos[2] = PlayerPos[2]+1
		print("Returned 1")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperright" or "ur") then
		PlayerPos[1] = PlayerPos[1]+1
		print("Returned 2")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("lowerleft" or "ll") then
		PlayerPos[1] = PlayerPos[1]-1
		PlayerPos[2] = PlayerPos[2]+1
		print("Returned 3")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperleft" or "ul") then
		PlayerPos[1] = PlayerPos[1]-1
		print("Returned 4")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("up" or "u") then
		PlayerPos[2] = PlayerPos[2]-1
		print("Returned 5")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("down" or "d") then
		PlayerPos[2] = PlayerPos[2]+1
		print("Returned 6")
		return PlayerPos
	else
		result = "This is not a valid option!"
		return result
	end
	print("returned nothing")
end
function OddMovement(choice, PlayerPos)
	local result
	if choice:lower():gsub("-","") == ("lowerright" or "lr") then 
		PlayerPos[1] = PlayerPos[1]+1
		print("Returned 7")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperright" or "ur") then
		PlayerPos[1] = PlayerPos[1]+1
		PlayerPos[2] = PlayerPos[2]-1
		print("Returned 8")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("lowerleft" or "ll") then
		PlayerPos[1] = PlayerPos[1]-1
		print("Returned 9")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("upperleft" or "ul") then
		PlayerPos[1] = PlayerPos[1]-1
		PlayerPos[2] = PlayerPos[2]-1
		print("Returned 10")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("up" or "u") then
		PlayerPos[2] = PlayerPos[2]-1
		print("Returned 11")
		return PlayerPos
	elseif choice:lower():gsub("-","") == ("down" or "d") then
		PlayerPos[2] = PlayerPos[2]+1
		print("Returned 12")
		return PlayerPos
	else
		result = "This is not a valid option!"
		return result
	end
	print("returned nothing")
end

print(Beginning())
--[[extra guideline for the developer:
The directions:
Positive PlayerPos to go right and down
Negative PlayerPos to go left and up
]]