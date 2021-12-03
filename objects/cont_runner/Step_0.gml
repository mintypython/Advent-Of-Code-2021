if (instance_exists(obj_visualizer)) {
	visible = false;
}
else {
	visible = true;
	if (keyboard_check_pressed(vk_space)) {
		var day = get_string("Day?", "");
		var part = get_string("Part?", "");

		asset_get_index("day_" + day + "_part_" + part)();
	}
	else if (keyboard_check_pressed(ord("X"))) {
		var day = get_string("Day?", "");
		var part = get_string("Part?", "");

		instance_create_depth(0, 0, 0, asset_get_index("visualizer_day_" + day + "_part_" + part));
	}
}