function day_4_part_1() {
	var input = get_input_as_lines("Day_4/input.txt");
	var nums = string_split(input[0], ",");
	
	// Populate boards
	var boards = [];
	for (var i = 1; i < array_length(input); i += 5) {
		var set = [];
		array_copy(set, 0, input, i, 5);
		array_push(boards, new Day4Board(set));
	}
	
	// Draw Numbers
	for (var i = 0; i < array_length(nums); i++) {
		for (var j = 0; j < array_length(boards); j++) {
			show_debug_message("Test board " + string(j) + " for " + string(nums[i]));
			if (boards[j].mark(nums[i])) {
				show_message(boards[j].calculate(nums[i]));
				return;
			}
		}
	}
}

function day_4_part_2() {
	var input = get_input_as_lines("Day_4/input.txt");
	var nums = string_split(input[0], ",");
	
	// Populate boards
	var boards = [];
	for (var i = 1; i < array_length(input); i += 5) {
		var set = [];
		array_copy(set, 0, input, i, 5);
		array_push(boards, new Day4Board(set));
	}
	
	// Draw Numbers
	for (var i = 0; i < array_length(nums); i++) {
		for (var j = 0; j < array_length(boards); j++) {
			if (boards[j].mark(nums[i])) {
				if (array_length(boards) > 1) {
					array_delete(boards, j, 1);
					j--;
				}
				else {
					show_message(boards[j].calculate(nums[i]));
				}
			}
		}
	}
}

function Day4Board(_set) constructor {
	set = [];
	for (var i = 0; i < array_length(_set); i++) {
		array_push(set, map(string_split(_set[i], " "), function(_value) { return { marked: false, value: _value}; }));
	}
	
	mark = function(_num) {
		for (var i = 0; i < array_length(set); i++) {
			for (var j = 0; j < array_length(set[i]); j++) {
				if (set[i][j].value == _num) {
					set[i][j].marked = true;
					return check();
				}
			}
		}
	}
	
	traverse = function(pos_x, pos_y, increment_x, increment_y) {
		while (pos_y < array_length(set) && pos_x < array_length(set[pos_y])) {
			if (!set[pos_x][pos_y].marked)
				return false;
			pos_x += increment_x;
			pos_y += increment_y;
		}
		return true;
	}
	
	check = function() {
		var success = false;
		
		// Horizontal checks
		success |= traverse(0, 0, 1, 0);
		success |= traverse(0, 1, 1, 0);
		success |= traverse(0, 2, 1, 0);
		success |= traverse(0, 3, 1, 0);
		success |= traverse(0, 4, 1, 0);
		
		// Vertical checks
		success |= traverse(0, 0, 0, 1);
		success |= traverse(1, 0, 0, 1);
		success |= traverse(2, 0, 0, 1);
		success |= traverse(3, 0, 0, 1);
		success |= traverse(4, 0, 0, 1);
		
		return success;
	}
	
	calculate = function(_num) {
		var sum = 0;
		for (var i = 0; i < array_length(set); i++) {
			for (var j = 0; j < array_length(set[i]); j++) {
				if (!set[i][j].marked) {
					sum += real(set[i][j].value);
				}
			}
		}
		return sum * real(_num);
	}
}