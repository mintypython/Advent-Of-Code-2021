function day_7_part_1() {
	var input = array_to_reals(string_split(get_input("Day_7/input.txt"), ","));
	array_sort(input, true);
	
	var med = input[floor(array_length(input) / 2)];
	
	var fuel = 0;
	for (var i = 0; i < array_length(input); i++) {
		fuel += abs(input[i] - med);
	}
	
	show_message(fuel);
}

function day_7_part_2() {
	var input = array_to_reals(string_split(get_input("Day_7/input.txt"), ","));
	
	var sum = 0;
	for (var i = 0; i < array_length(input); i++) {
		sum += input[i];
	}
	
	var med = floor(sum / array_length(input));
	
	var fuel = 0;
	for (var i = 0; i < array_length(input); i++) {
		var diff = abs(input[i] - med);
		fuel += (diff + 1) * diff / 2;
	}
	
	show_message(fuel);
}