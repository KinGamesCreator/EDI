/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region constructor
if !loaded {
	loaded = true;
	
	x = data_load._x;
	y = data_load._y;
	text = data_load.texto;
	next = data_load.next;
	tte_ext_input_set_text(text);
	if data_load.pregunta {
		options = data_load.respuestas;
		for (var i = 0; i < array_length(options); i++) {
			textboxes[i] = instance_create_depth(0,0,depth,obj_textbox);
			with(textboxes[i]) {
				scrollx = 0;
				tte_ext_input_set_text(other.options[i].texto);
			}
		}
	}
}
#endregion

#region control opciones
if point_in_rectangle(mouse_x,mouse_y,x,y+sprite_height+40*array_length(options),x+sprite_width/2,y+sprite_height+40*array_length(options)+20) and mouse_check_button_pressed(mb_left) {
	options[array_length(options)] = {
		texto : "Opcion" + string(array_length(options)+1),
		next : -1
	}
	textboxes[array_length(textboxes)] = instance_create_depth(x,y+sprite_height+40*array_length(textboxes),depth,obj_textbox);
	with(textboxes[array_length(textboxes)-1]) {
		tte_ext_input_set_text(other.options[array_length(other.options)-1].texto)
	}
}

if array_length(textboxes) and point_in_rectangle(mouse_x,mouse_y,x+sprite_width/2,y+sprite_height+40*array_length(options),x+sprite_width,y+sprite_height+40*array_length(options)+20) and mouse_check_button_pressed(mb_left) {
	array_resize(options,array_length(options)-1);
	instance_destroy(textboxes[array_length(textboxes)-1]);
	array_resize(textboxes,array_length(textboxes)-1);
}
#endregion

#region mover ventana

if (point_in_rectangle(mouse_x,mouse_y,x,y-20,x+sprite_width,y) and mouse_check_button_pressed(mb_left)) or mouse_check_button_pressed(mb_middle) {
	move = true;
	pos_ant = [mouse_x,mouse_y,x,y];
}

if move {
	x = mouse_x - pos_ant[0] + pos_ant[2];
	y = mouse_y - pos_ant[1] + pos_ant[3];
	if mouse_check_button_released(mb_left) or mouse_check_button_released(mb_middle) {
		move = false;
	}
}

#endregion

#region textboxes control

for(var i = 0; i < array_length(options); i++) {
	textboxes[i].image_xscale = image_xscale;
	textboxes[i].y = y+sprite_height+40*i;
	textboxes[i].x = x;
	options[i].texto = textboxes[i].text;
}

#endregion

#region connections

for(var i = 0; i < array_length(options); i++) {
	if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,x+sprite_width,y+sprite_height+40*i+10,x+sprite_width+20,y+sprite_height+40*i+29) {
		options[i].next = -2;
	}
	if (options[i].next = -2) and mouse_check_button_released(mb_left) {
		var _destino = collision_point(mouse_x+20,mouse_y+20,obj_dialog,1,0);
		if (_destino != noone) and (_destino._id != _id) {
			options[i].next = _destino._id;
		} else {
			options[i].next = -1;
		}
	}
}

if array_length(options) == 0 {
	if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,x+sprite_width,y+sprite_height-20,x+sprite_width+20,y+sprite_height) {
		next = -2;
	}
	if (next = -2) and mouse_check_button_released(mb_left) {
		var _destino = collision_point(mouse_x+20,mouse_y+20,obj_dialog,1,0);
		if (_destino != noone) and (_destino._id != _id) {
			next = _destino._id;
		} else {
			next = -1;
		}
	}
}

#endregion

#region destroy

if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,x+sprite_width-40,y-20,x+sprite_width,y) {
	destroy_this();
}

#endregion

tte_ext_input_step();

text = tte_ext_input_get_text();
