// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function load_project(_json){
	load = json_parse(_json);
	with(obj_dialog) {
		destroy_this();
	}
	#region inicializador
	cajas = [];
	for (var i = 0; i < array_length(load.dialogos); i++) {
		cajas[i] = instance_create_depth(200 * i,0,-i,obj_dialog);
		cajas[i]._id = i;
		cajas[i].data_load = load.dialogos[i];
	}
	#endregion
}

function save_project() {
	
	var temp_json_save = {
		dialogos : []
	}
	
	for (var i = 0; i < array_length(cajas); i++) {
		temp_json_save.dialogos[i] = {};
		temp_json_save.dialogos[i]._x = cajas[i].x;
		temp_json_save.dialogos[i]._y = cajas[i].y;
		temp_json_save.dialogos[i].texto = cajas[i].text;
		temp_json_save.dialogos[i].respuestas = cajas[i].options;
		temp_json_save.dialogos[i].next = cajas[i].next;
		temp_json_save.dialogos[i].pregunta = (array_length(cajas[i].options) > 0);
	}
	
	var save_file = file_text_open_write("proyectos\\" + global.p_name + "\\data.json");
	file_text_write_string(save_file,json_stringify(temp_json_save));
	file_text_close(save_file);
	
	show_message("proyecto \"" + global.p_name + "\" guardado con éxito.");
	
}

function export_json () {
	var temp_json_save = {
		dialogos : []
	}
	
	for (var i = 0; i < array_length(cajas); i++) {
		temp_json_save.dialogos[i] = {};
		temp_json_save.dialogos[i].texto = cajas[i].text;
		temp_json_save.dialogos[i].respuestas = cajas[i].options;
		temp_json_save.dialogos[i].next = cajas[i].next;
		temp_json_save.dialogos[i].pregunta = (array_length(cajas[i].options) > 0);
	}
	
	var save_file = file_text_open_write(get_save_filename("json file|*.json","data.json"));
	file_text_write_string(save_file,json_stringify(temp_json_save));
	file_text_close(save_file);
}
