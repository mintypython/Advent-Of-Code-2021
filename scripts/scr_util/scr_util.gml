function get_input(filename) {
	var buff = buffer_load("Input/"+filename);
	var input = buffer_read(buff, buffer_text);
	buffer_delete(buff);
	return input;
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
		array_push(res, string_copy(str, 1, pos - 1));
		str = string_delete(str, 1, pos);
		pos = string_pos(delimiter, str);
	}
	if (string_length(str) > 0)
		array_push(res, str);
	return res;
}

function array_to_reals(array) {
	var length = array_length(array);
	for (var i = 0; i < length; i++)
		array[i] = real(array[i]);
	return array;
}

function map(array, func) {
	var length = array_length(array);
	for (var i = 0; i < length; i++)
		array[i] = func(array[i]);
	return array;
}