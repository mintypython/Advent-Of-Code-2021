function day_1_part_1() {
	var input = get_input_as_real_lines("Day_1/day_1.txt");
	
	var total = 0;
	
	var length = array_length(input);
	for (var i = 1; i < length; i++) {
		if (input[i] > input[i - 1])
			total++;
	}
	
	show_message(total);
}

function day_1_part_2() {
	var input = get_input_as_real_lines("Day_1/day_1.txt");
	
	var total = 0;
	
	var length = array_length(input) - 2;
	for (var i = 1; i < length; i++) {
		if (input[i] + input[i + 1] + input[i + 2] > input[i - 1] + input[i] + input[i + 1])
			total++;
	}
	
	show_message(total);
}