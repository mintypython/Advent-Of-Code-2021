input = get_input_as_lines("Day_2/day_2.txt");
input = map(input, function(line) {
	line = string_split(line, " ");
	line[1] = real(line[1]);
	return line;
});
	
position = { x: 0, depth: 0 };
i = 0;

surf = surface_create(2048, 2048);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();

positions = [];