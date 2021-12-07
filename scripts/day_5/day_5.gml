function day_5_part_1() {
	var input = array_map(get_input_as_lines("Day_5/input.txt"), function(value) {
		var points = array_map(string_split(value, " -> "), function(value) { return array_to_reals(string_split(value, ",")); });
		return [
			{ x: points[0][0], y: points[0][1] },
			{ x: points[1][0], y: points[1][1] },
		];
	});
	
	var grid = {};
	static to_key = function(x, y) {
		return string(x) + "," + string(y);
	}
	
	for (var i = 0; i < array_length(input); i++) {
		var points = input[i];
		var xdiff = points[1].x - points[0].x;
		var ydiff = points[1].y - points[0].y;
		if (xdiff != 0 ^^ ydiff != 0) {
			var p = { x: points[0].x, y: points[0].y };
			while(p.x != points[1].x || p.y != points[1].y) {
				var key = to_key(p.x, p.y);
				grid[$ key] = (grid[$ key] == undefined) ? 1 : grid[$ key] + 1;
				p.x += sign(xdiff);
				p.y += sign(ydiff);
			}
			var key = to_key(p.x, p.y);
			grid[$ key] = (grid[$ key] == undefined) ? 1 : grid[$ key] + 1;
		}
	}
	
	var total = 0;
	var names = variable_struct_get_names(grid);
	for (var i = 0; i < array_length(names); i++) {
		if (grid[$ names[i]] > 1) total++;
	}
	
	show_message(total);
}

function day_5_part_2() {
	var input = array_map(get_input_as_lines("Day_5/input.txt"), function(value) {
		var points = array_map(string_split(value, " -> "), function(value) { return array_to_reals(string_split(value, ",")); });
		return [
			{ x: points[0][0], y: points[0][1] },
			{ x: points[1][0], y: points[1][1] },
		];
	});
	
	var grid = {};
	static to_key = function(x, y) {
		return string(x) + "," + string(y);
	}
	
	for (var i = 0; i < array_length(input); i++) {
		var points = input[i];
		var xdiff = points[1].x - points[0].x;
		var ydiff = points[1].y - points[0].y;
		if (xdiff != 0 || ydiff != 0) {
			var p = { x: points[0].x, y: points[0].y };
			while(p.x != points[1].x || p.y != points[1].y) {
				var key = to_key(p.x, p.y);
				grid[$ key] = (grid[$ key] == undefined) ? 1 : grid[$ key] + 1;
				p.x += sign(xdiff);
				p.y += sign(ydiff);
			}
			var key = to_key(p.x, p.y);
			grid[$ key] = (grid[$ key] == undefined) ? 1 : grid[$ key] + 1;
		}
	}
	
	var total = 0;
	var names = variable_struct_get_names(grid);
	for (var i = 0; i < array_length(names); i++) {
		if (grid[$ names[i]] > 1) total++;
	}
	
	show_message(total);
}