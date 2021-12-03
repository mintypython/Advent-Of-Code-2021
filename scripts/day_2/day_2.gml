function day_2_part_1() {
	var input = get_input_as_lines("Day_2/day_2.txt");
	input = map(input, function(line) {
		line = string_split(line, " ");
		line[1] = real(line[1]);
		return line;
	});
	
	var position = { x: 0, depth: 0 };
	
	var length = array_length(input);
	for (var i = 0; i < length; i++) {
		show_debug_message(input[i]);
		switch (input[i][0]) {
			case "forward": position.x += input[i][1]; break;
			case "down": position.depth += input[i][1]; break;
			case "up": position.depth -= input[i][1]; break;
		}
	}
	show_message(position);
	show_message(position.x * position.depth);
}

function day_2_part_2() {
	var input = get_input_as_lines("Day_2/day_2.txt");
	input = map(input, function(line) {
		line = string_split(line, " ");
		line[1] = real(line[1]);
		return line;
	});
	
	var position = { x: 0, depth: 0, aim: 0 };
	
	var length = array_length(input);
	for (var i = 0; i < length; i++) {
		switch (input[i][0]) {
			case "forward": position.x += input[i][1]; position.depth += position.aim * input[i][1]; break;
			case "down": position.aim += input[i][1]; break;
			case "up": position.aim -= input[i][1]; break;
		}
	}
	show_debug_message(position);
	show_debug_message(position.x * position.depth);
}
