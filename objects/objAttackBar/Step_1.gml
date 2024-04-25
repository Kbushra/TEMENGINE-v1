if !objBM.attacking { fade = true; }

if fade { image_alpha -= 0.075; image_xscale -= 0.075; }

if image_alpha <= 0 { objBM.attacking = false; instance_destroy(); }