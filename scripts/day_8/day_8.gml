function day_8_part_1(){
	var input = get_input_as_lines("Day_8/input.txt");
	input = array_map(input, function(value) { return string_split(string_split(value, "|")[1]," "); });
	
	var total = 0;
	for (var i = 0; i < array_length(input); i++) {
		var line = input[i];
		for (var j = 0; j < array_length(line); j++) {
			var len = string_length(line[j]);
			if (len == 2 || len == 3 || len == 4 || len == 7) {
				total++;
			}
		}
	}
	show_message(total);
}

function day_8_part_2(){
	var input = get_input_as_lines("Day_8/example.txt");
	input = array_map(input, function(value) { return string_split(string_split(value, "|")[1]," "); });
	
	
	
	var total = 0;
	for (var i = 0; i < array_length(input); i++) {
		var segments = ["a", "b", "c", "d", "e", "f", "g"];
		five_segments = [{ value: 2, code: segments[0] }];
		
		var line = input[i];
		for (var j = 0; j < array_length(line); j++) {
			total += get_digit(line[j], five_segments, six_segments) * power(10, 3 - j);
		}
	}
	show_message(total);
	
		var five_segments = [{ value: 2, code: "gcdfa" }, { value: 3, code: "fbcad" }, { value: 5, code: "cdfbe" }];
	var six_segments = [{ value: 0, code:"cagedb" }, { value: 6, code: "cdfgeb" }, { value: 9, code: "cefabd" }];
}

function get_digit(_str, five_segments, six_segments) {
	var candidates = [];
	switch(string_length(_str)) {
		case 2: return 1;
		case 3: return 7;
		case 4: return 4;
		case 7: return 8;
		
		case 5: array_copy(candidates, 0, five_segments, 0, 3); break;
		case 6: array_copy(candidates, 0, six_segments, 0, 3); break;
	}
	
	for (var i = 1; i <= string_length(_str); i++) {
		for (var j = 0; j < array_length(candidates); j++) {
			if (string_pos(string_char_at(_str, i), candidates[j].code) == 0) {
				array_delete(candidates, j--, 1);
			}
		}
		if (array_length(candidates) == 1)
			return candidates[0].value;		
	}
	return undefined;
}