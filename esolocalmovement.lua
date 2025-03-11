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
			io.write(NewTable[num2])
		end
		io.write("\n")
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
	if SquareHexer(PlayerPos) == "ODD" then
		
	elseif SquareHexer(PlayerPos) == "EVEN" then
		
	end
end
function SquareHexer(PlayerPos)
	
end
print(Beginning())