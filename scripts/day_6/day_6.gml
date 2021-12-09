function day_6_part_1() {
	static days = 80;
	var fish = array_to_reals(string_split(get_input("Day_6/input.txt"), ","));
	
	var ages = array_create(9, 0);
	for (var i = 0; i < array_length(fish); i++)
		ages[fish[i]]++;
		
	repeat(days) {
		ages[7] += ages[0];
		array_push(ages, ages[0]);
		array_delete(ages, 0, 1);
		
	}
	
	var total = 0;
	for (var i = 0; i < array_length(ages); i++)
		total += ages[i];
	
	show_message(total);
}

function day_6_part_2() {
	static days = 256;
	var fish = array_to_reals(string_split(get_input("Day_6/input.txt"), ","));
	
	var ages = array_create(9, 0);
	for (var i = 0; i < array_length(fish); i++)
		ages[fish[i]]++;
		
	repeat(days) {
		ages[7] += ages[0];
		array_push(ages, ages[0]);
		array_delete(ages, 0, 1);
		
	}
	
	var total = 0;
	for (var i = 0; i < array_length(ages); i++)
		total += ages[i];
	
	show_message(total);
}