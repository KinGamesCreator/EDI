/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

image_xscale = 6;
image_yscale = 3;

text = "";
options = [];
textboxes = [];
next = -1;

move = false;
pos_ant = [mouse_x,mouse_y,x,y];

tte_ext_input_create();
tte_ext_input_set_size(sprite_width,120);
tte_ext_input_set_background_color(c_black,0);
tte_ext_input_set_text_color(c_black,1);

loaded = false;
