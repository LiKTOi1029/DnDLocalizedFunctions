function Beginning()
	repeat
		io.write("Please input a number equal to or greater than 4")
		local choice, boolean = io.read("*l"):gsub("\n",""), false
		if choice < 4 then print(choice.." is less than 4")
		else boolean = true; TableCreation(choice) end
	until boolean == true
end
function TableCreation(choice)
	local Table = {}
	for num1 = 1, choice, 1 do
		local NewTable = {}
		for num1 = 1, choice, 1 do
			
		end
		table.insert(Table, NewTable)
	end
end