draw_clear_alpha(make_color_rgb(16, 64, 128), 1);
draw_surface(surf, 0, 0);
draw_sprite(spr_chest, 0, 1025, 413);
draw_self();

draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
for (var j = 0; j < min(20, array_length(input) - i); j++)
	draw_text(1125, j * 15, input[j + i][0] + " " + string(input[j + i][1]));