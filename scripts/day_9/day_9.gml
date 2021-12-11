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

function day_9_part_2() {
	var input = get_input_as_lines("Day_9/input.txt");
	input = array_map(input, function(value) { return array_to_reals(string_split(value)); });
	
	
	
	var basin_sizes = [];
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		for (var j = 0; j < array_length(line); j++) {
			
			var value = line[j];
			if (j > 0 && line[j - 1] <= value) continue;
			if (j < array_length(line) - 1 && line[j + 1] <= value) continue;
			if (i > 0 && input[i - 1][j] <= value) continue;
			if (i < array_length(input) - 1 && input[i + 1][j] <= value) continue;
			array_push(basin_sizes, day_9_get_basin_size(input, j, i));
		}
	}
	
	array_sort(basin_sizes, false);
	show_message(basin_sizes[0] * basin_sizes[1] * basin_sizes[2]);
}

function day_9_get_basin_size(array, x, y) {
	var width = array_length(array[0]);
	var height = array_length(array);
	var visited = array_create(width * height, false);
	return day_9_search_cell(array, visited, width, height, x, y, 0, 0);
};

function day_9_search_cell(array, visited, w, h, x, y, num, total) {
	if (x < 0 || x >= w || y < 0 || y >= h) return 0;
	if (visited[x * h + y]) return 0;
		
	var value = array[y][x];
	if (value == 9 || value < num) return 0;
	
	visited[@ x * h + y] = true;
	
	var tot = 1;
	tot += day_9_search_cell(array, visited, w, h, x - 1, y, value, total);
	tot += day_9_search_cell(array, visited, w, h, x + 1, y, value, total);
	tot += day_9_search_cell(array, visited, w, h, x, y - 1, value, total);
	tot += day_9_search_cell(array, visited, w, h, x, y + 1, value, total);
		
	return tot;
};