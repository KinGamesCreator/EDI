/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_self();

draw_sprite_ext(spr_conection_button,0,x,y,-1,1,0,c_white,1);

draw_sprite_ext(spr_boxtop,0,x,y,image_xscale/2,1,0,c_white,1);

draw_sprite_ext(spr_add_option,0,x,y+sprite_height+40*array_length(options),image_xscale,1,0,c_white,1);
draw_sprite_ext(spr_add_option,1,x+sprite_width/4-10,y+sprite_height+40*array_length(options),1,1,0,c_white,1);

draw_sprite_ext(spr_add_option,0,x+sprite_width/2,y+sprite_height+40*array_length(options),image_xscale,1,0,c_white,1);
draw_sprite_ext(spr_add_option,2,x+(sprite_width/4)*3-10,y+sprite_height+40*array_length(options),1,1,0,c_white,1);

tte_ext_input_draw();

draw_set_color(c_red);
for(var i = 0; i < array_length(options); i++) {
	draw_sprite(spr_conection_button,0,x+sprite_width,y+sprite_height+i*40+10);
	if (options[i].next >= 0) {
		var _posx = obj_control.cajas[options[i].next].x-10;
		var _posy = obj_control.cajas[options[i].next].y+10;
		draw_line_width(x+sprite_width+10,y+sprite_height+20+40*i,_posx,_posy,3);
	} else if (options[i].next = -2) {
		draw_line_width(x+sprite_width+10,y+sprite_height+20+40*i,mouse_x,mouse_y,3);
	}
}

if array_length(options) == 0 {
	draw_sprite(spr_conection_button,0,x+sprite_width,y+sprite_height-20);
	if (next >= 0) {
		var _posx = obj_control.cajas[next].x-10;
		var _posy = obj_control.cajas[next].y+10;
		draw_line_width(x+sprite_width+10,y+sprite_height-10,_posx,_posy,3);
	} else if (next = -2) {
		draw_line_width(x+sprite_width+10,y+sprite_height-10,mouse_x,mouse_y,3);
	}
}
draw_set_color(c_black);
