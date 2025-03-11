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
	local Table, result = {}, "Finished"
	for num1 = 1, choice, 1 do
		local NewTable = {}
		for num2 = 1, choice, 1 do
			if num1 == math.ceil(choice/2) and num2 == math.ceil(choice/2) then table.insert(NewTable, "P")
			else table.insert(NewTable, "O") end
			io.write(NewTable[num2])
		end
		io.write("\n")
		table.insert(Table, NewTable)
	end
	
	return result
end
print(Beginning())