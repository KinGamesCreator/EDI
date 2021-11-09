/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

iniciado = false;

global.p_name = "";

load = {
	dialogos : [{
		_x : 480,
		_y : 320,
		texto : "Dialogo",
		respuestas : [{
			texto : "opcion1",
			next : -1
		},{
			texto : "Opcion2",
			next : -1
		}],
		pregunta: true,
		next	: -1
	}]
}

#region inicializador
cajas = [];

for (var i = 0; i < array_length(load.dialogos); i++) {
	cajas[i] = instance_create_depth(200 * i,0,-i,obj_dialog);
	cajas[i].data_load = load.dialogos[i];
	cajas[i]._id = i;
}
#endregion
