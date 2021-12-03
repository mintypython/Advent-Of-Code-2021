if (i < array_length(input)) {
	
	switch (input[i][0]) {
		case "forward": position.x += input[i][1]; break;
		case "down": position.depth += input[i][1]; break;
		case "up": position.depth -= input[i][1]; break;
	}
	
	array_push(positions, { x: position.x, depth: position.depth });
	
	var interval = 10;
	if (i > 0 && i % interval == 0) {
		surface_set_target(surf);
		draw_set_color(c_yellow);
		draw_line_width(positions[i - interval].x * 0.5, positions[i - interval].depth * 0.5, positions[i].x * 0.5, positions[i].depth * 0.5, 3);
		image_angle = point_direction(positions[i - interval].x * 0.5, positions[i - interval].depth * 0.5, positions[i].x * 0.5, positions[i].depth * 0.5);
		surface_reset_target();
	}
	x = position.x * 0.5;
	y = position.depth * 0.5;
	i++;
	show_debug_message(string(x) + ", " + string(y));
}