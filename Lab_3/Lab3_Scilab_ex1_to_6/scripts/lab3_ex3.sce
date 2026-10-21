clc;
clear;
path = get_absolute_file_path("lab3_ex3.sce");
getd(path); 

//(a) x(n) = {1, -2, 3^, 6, 4}, y(n) = x(-n);
[yn, yorigin] = fold([1, -2, 3, 6, 4], 3); // yorigin = 3

mprintf("(a) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex3_a.png");

//(b) Goc nam o dau vector:  x(n) = {1^, 2, 3, 4}, y(n) = x(-n);
[yn, yorigin] = fold([1, 2, 3, 4], 1); // yorigin = 1

mprintf("(b) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex3_b.png");
