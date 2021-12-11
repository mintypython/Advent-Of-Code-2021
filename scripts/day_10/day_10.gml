function day_10_part_1() {
	var input = get_input_as_lines("Day_10/input.txt");
	
	static scan = function(line) {
		var stack = [];
		for (var i = 1; i <= string_length(line); i++) {
			var char = string_char_at(line, i);
			switch(char) {
				case ")":
					if (stack[0] != "(") return 3;
					array_delete(stack, 0, 1);
					break;
				case "]":
					if (stack[0] != "[") return 57;
					array_delete(stack, 0, 1);
					break;
				case "}":
					if (stack[0] != "{") return 1197;
					array_delete(stack, 0, 1);
					break;
				case ">":
					if (stack[0] != "<") return 25137;
					array_delete(stack, 0, 1);
					break;
					
				default:
					array_insert(stack, 0, char);
					break;
			}
		}
		return 0;
	}
	
	var total = 0;
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		total += scan(line);
	}
	show_message(total);
}

function day_10_part_2() {
	var input = get_input_as_lines("Day_10/input.txt");
	
	static scan = function(line) {
		var stack = [];
		for (var i = 1; i <= string_length(line); i++) {
			var char = string_char_at(line, i);
			switch(char) {
				case ")":
					if (stack[0] != "(") return 0;
					array_delete(stack, 0, 1);
					break;
				case "]":
					if (stack[0] != "[") return 0;
					array_delete(stack, 0, 1);
					break;
				case "}":
					if (stack[0] != "{") return 0;
					array_delete(stack, 0, 1);
					break;
				case ">":
					if (stack[0] != "<") return 0;
					array_delete(stack, 0, 1);
					break;
					
				default:
					array_insert(stack, 0, char);
					break;
			}
		}
		
		var points = 0;
		for (var i = 0; i < array_length(stack); i++) {
			points *= 5;
			switch (stack[i]) {
				case "(": points += 1; break;
				case "[": points += 2; break;
				case "{": points += 3; break;
				case "<": points += 4; break;
			}
		}
		return points;
	}
	
	var totals = [];
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		var scanned = scan(line);
		if (scanned > 0) {
			array_push(totals, scanned);
		}
	}
	array_sort(totals, true);
	
	show_message(totals[array_length(totals) / 2]);
}