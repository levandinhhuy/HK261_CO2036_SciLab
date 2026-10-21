clc; clear;
path = get_absolute_file_path("lab3_ex4.sce");
getd(path);    // nap tat ca file .sci trong thu muc

// Vi du trong de: x1(n) = {0^, 1, 3, -2},  x2(n) = {1, 1^, 2, 3}
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
mprintf("yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex4.png");
