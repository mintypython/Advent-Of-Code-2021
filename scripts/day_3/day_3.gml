function day_3_part_1(){
	static digits = 12;
	
	var input = get_input_as_lines("Day_3/day_3.txt");
	
	var values = array_create(digits, 0);
	
	var length = array_length(input);
	for (var i = 0; i < length; i++) {
		for (var j = 0; j < digits; j++) {
			if (string_char_at(input[i], digits - j) == "1")
				values[j]++;
			else
				values[j]--;
		}
	}
	
	var num1 = 0;
	for (var i = 0; i < digits; i++)
		num1 |= (values[i] > 0) << i;
	
	var num2 = 0;
	for (var i = 0; i < digits; i++)
		num2 |= (values[i] < 0) << i;
	
	show_debug_message(num1 * num2);
}

function day_3_part_2(){
	static digits = 12;
	
	var input = get_input_as_lines("Day_3/day_3.txt");
	
	for (var i = 1; i <= digits; i++) {
		var value = 0;
		for (var j = 0; j < array_length(input); j++) {
			if (string_char_at(input[j], i) == "1")
				value++;
			else
				value--;
		}
		
		for (var j = 0; j < array_length(input); j++) {
			if (string_char_at(input[j], i) != (value >= 0 ? "1" : "0"))
				array_delete(input, j--, 1);
		}
	}
	
	var num1 = input[0];
	
	var input = get_input_as_lines("Day_3/day_3.txt");
	
	for (var i = 1; i <= digits; i++) {
		var value = 0;
		for (var j = 0; j < array_length(input); j++) {
			if (string_char_at(input[j], i) == "1")
				value++;
			else
				value--;
		}
		
		for (var j = 0; j < array_length(input); j++) {
			if (string_char_at(input[j], i) != (value < 0 ? "1" : "0"))
				array_delete(input, j--, 1);
		}
		
		if (array_length(input) == 1) break;
	}
	
	var num2 = input[0];
	
	show_message("NUM1, BIN: " + string(num1) + "DEC: " + string(bin_to_dec(num1)));
	show_message("NUM2, BIN: " + string(num2) + "DEC: " + string(bin_to_dec(num2)));
	show_message("ANSWER: " + string(bin_to_dec(num1) * bin_to_dec(num2)));
}