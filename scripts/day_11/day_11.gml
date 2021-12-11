function day_11_part_1() {
	var octopi = array_map(get_input_as_lines("Day_11/input.txt"), function(value) { return array_to_reals(string_split(value, "")) });
	
	var rows = array_length(octopi);
	var columns = array_length(octopi[0]);
	
	var flashes = 0;
	for (var day = 0; day < 100; day++) {
		for (var row = 0; row < rows; row++) {
			for (var column = 0; column < columns; column++) {
				octopi[row][column] = max(octopi[row][column], 0) + 1;
			}
		}
		
		for (var row = 0; row < rows; row++) {
			for (var column = 0; column < columns; column++) {
				if (octopi[row][column] > 9)
					flashes += day_11_flash(octopi, row, column, rows, columns);
			}
		}
	}
	show_message(flashes);
}

function day_11_part_2() {
	var octopi = array_map(get_input_as_lines("Day_11/input.txt"), function(value) { return array_to_reals(string_split(value, "")) });
	
	var rows = array_length(octopi);
	var columns = array_length(octopi[0]);
	
	for (var day = 0; day >= 0; day++) {
		for (var row = 0; row < rows; row++) {
			for (var column = 0; column < columns; column++) {
				octopi[row][column] = max(octopi[row][column], 0) + 1;
			}
		}
		
		for (var row = 0; row < rows; row++) {
			for (var column = 0; column < columns; column++) {
				if (octopi[row][column] > 9) {
					var new_flashes = day_11_flash(octopi, row, column, rows, columns);
					show_debug_message("DAY " + string(day) + ", FLASHES: " + string(new_flashes));
					if (new_flashes == rows * columns) show_message("ALL FLASH ON DAY " + string(day));
				}
			}
		}
	}
}

function day_11_flash(array, row, column, rows, columns) {
	if (row < 0 || row >= rows || column < 0 || column >= columns)
		return 0;
	
	array[@ row][@ column]++;
	if (array[@ row][@ column] > 9) {
		var new_flashes = 1;
		array[@ row][@ column] = -999;
		
		// top row
		new_flashes += day_11_flash(array, row - 1, column - 1, rows, columns);
		new_flashes += day_11_flash(array, row - 0, column - 1, rows, columns);
		new_flashes += day_11_flash(array, row + 1, column - 1, rows, columns);
		
		// middle row
		new_flashes += day_11_flash(array, row - 1, column - 0, rows, columns);
		new_flashes += day_11_flash(array, row + 1, column - 0, rows, columns);
		
		// bottom row
		new_flashes += day_11_flash(array, row - 1, column + 1, rows, columns);
		new_flashes += day_11_flash(array, row - 0, column + 1, rows, columns);
		new_flashes += day_11_flash(array, row + 1, column + 1, rows, columns);
		
		return new_flashes;
	}
	return 0;
}