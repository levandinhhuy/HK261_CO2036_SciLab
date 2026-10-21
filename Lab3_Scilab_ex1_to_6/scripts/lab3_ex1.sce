clc; clear;
path = get_absolute_file_path("lab3_ex1.sce");
getd(path);    // nap tat ca file .sci trong thu muc

// (a) Vi du trong de: x(n) = {1, -2, 3^, 6},  y(n) = x(n - 1)
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
mprintf("(a) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex1_a.png");

// (b) Truong hop goc moi vuot ra ngoai vector: x(n) = {1^, 2, 3},  y(n) = x(n - 2)
[yn, yorigin] = delay([1, 2, 3], 1, 2);
mprintf("(b) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex1_b.png");
