function get_input(filename) {
	var buff = buffer_load("Input/"+filename);
	var input = buffer_read(buff, buffer_text);
	buffer_delete(buff);
	return string_replace_all(input, "\r", "");
}

function get_input_as_lines(filename) {
	return string_split(get_input(filename), "\n");
}

function get_input_as_real_lines(filename) {
	return array_to_reals(get_input_as_lines(filename));
}

function string_split(str, delimiter) {
	var res = [];
	var pos = string_pos(delimiter, str);
	while (pos != 0) {
		var substr = string_copy(str, 1, pos - 1);
		if (string_length(substr) > 0)
			array_push(res, substr);
		str = string_delete(str, 1, pos + string_length(delimiter) - 1);
		pos = string_pos(delimiter, str);
	}
	if (string_length(str) > 0)
		array_push(res, str);
	return res;
}

function array_to_reals(array) {
	return array_map(array, function(value) { return real(value); });
}

function array_map(array, func) {
	var length = array_length(array);
	for (var i = 0; i < length; i++)
		array[i] = func(array[i]);
	return array;
}

function bin_to_dec(bin) {
	var dec = 0;
	var digits = string_length(bin);
	for (var i = 0; i < digits; i++) {
		dec |= real(string_char_at(bin, digits - i)) << i;
	}
	return dec;
}