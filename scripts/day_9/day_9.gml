function day_9_part_1(){
	var input = get_input_as_lines("Day_9/input.txt");
	input = array_map(input, function(value) { return array_to_reals(string_split(value)); });
	
	var risk = 0;
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		for (var j = 0; j < array_length(line); j++) {
			
			var value = line[j];
			show_debug_message(value);
			if (j > 0 && line[j - 1] <= value) continue;
			if (j < array_length(line) - 1 && line[j + 1] <= value) continue;
			if (i > 0 && input[i - 1][j] <= value) continue;
			if (i < array_length(input) - 1 && input[i + 1][j] <= value) continue;
			risk += value + 1;
		}
	}
	
	show_message(risk);
}

function day_9_part_2(){
	var input = get_input_as_lines("Day_9/input.txt");
	input = array_map(input, function(value) { return array_to_reals(string_split(value)); });
	
	var basin_sizes = [];
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		for (var j = 0; j < array_length(line); j++) {
			
			var value = line[j];
			show_debug_message(value);
			if (j > 0 && line[j - 1] <= value) continue;
			if (j < array_length(line) - 1 && line[j + 1] <= value) continue;
			if (i > 0 && input[i - 1][j] <= value) continue;
			if (i < array_length(input) - 1 && input[i + 1][j] <= value) continue;
			
			array_push(basin_sizes, get_basin_size(input, j, i));
		}
	}
	
	show_message(risk);
}

function get_basin_size(array, x, y) {
	var size = 1;
}