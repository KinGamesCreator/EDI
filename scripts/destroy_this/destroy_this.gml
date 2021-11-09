// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function destroy_this(){
	
	for(var i = 0; i<array_length(textboxes);i++) {
		instance_destroy(textboxes[i]);
	}
	textboxes = [];
	options = [];
	
	for(var i = _id; i<(array_length(obj_control.cajas)-1);i++) {
		obj_control.cajas[i] = obj_control.cajas[i+1];
		obj_control.cajas[i]._id--;
	}
	array_resize(obj_control.cajas,array_length(obj_control.cajas)-1);
	
	for(var i = 0; i<array_length(obj_control.cajas);i++) {
		for (var k = 0; k < array_length(obj_control.cajas[i].options);k++) {
			if obj_control.cajas[i].options[k].next = _id {
				obj_control.cajas[i].options[k].next = -1;
			} else if obj_control.cajas[i].options[k].next > _id {
				obj_control.cajas[i].options[k].next--;
			}
		}
		if obj_control.cajas[i].next = _id {
			obj_control.cajas[i].next = -1;
		} else if obj_control.cajas[i].next > _id {
			obj_control.cajas[i].next--;
		}
	}
	
	instance_destroy();
	
}