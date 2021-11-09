/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if window_has_focus() {
	room_width = window_get_width();
	room_height = window_get_height();
	surface_resize(application_surface,room_width,room_height);
}

if keyboard_check(vk_shift) and mouse_check_button_pressed(mb_left) {
	cajas[array_length(cajas)] = instance_create_depth(mouse_x,mouse_y,-array_length(cajas),obj_dialog);
	cajas[array_length(cajas)-1].data_load = {
		_x		: mouse_x,
		_y		: mouse_y,
		texto	: "texto",
		pregunta: false,
		next	: -1
	}
	cajas[array_length(cajas)-1]._id = array_length(cajas)-1;
}

for (var i = 0; i < image_number;i++) {
	if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,x+i*sprite_width,y,x+(i+1)*sprite_width,y+sprite_height) {
		switch(i) {
			case 0: //cargar proyecto viejo.
				var proyecto = get_string("ingresa el nombre del proyecto para cargar","");
				if (proyecto != "") and (proyecto != noone) {
					if file_exists("proyectos\\" + string_lower(proyecto) + "\\data.json") {
						if (global.p_name != "") or !instance_number(obj_dialog) or (show_question("el proyecto actual no está guardado y lo datos se perderán\n¿continuar?")) {
							global.p_name = proyecto;
							var file_leer = file_text_open_read("proyectos\\" + string_lower(proyecto) + "\\data.json");
							load_project(file_text_read_string(file_leer));
							file_text_close(file_leer);
						}
					} else {
						show_message("eso no existe totno.")
					}
				} else {
					show_message("pero ingresa algo, totno.");
				}
			break;
			
			case 1: //guardar proyecto.
				
				if (instance_number(obj_dialog)) {
					if (global.p_name = "") {
						var new_name = string_lower(get_string("Ingresa el nombre para guardar",""));
						if (new_name != "") and (new_name != noone) {
							if !file_exists("proyectos\\" + new_name + "\\data.json") {
								global.p_name = new_name;
								save_project();
							} else {
								show_message("pero ese proyecto ya existe, totno.")
							}
						} else {
							show_message("Pero que ingreses algo, totno.");
						}
					} else {
						save_project();
					}
				} else {
					show_message("Pero si no hay nada que guardar, totno.");
				}
				
			break;
			
			case 2: //exportar json.
				export_json();
			break;
		}
	}
}
