// LAB 3-ex2
clc; clear;
path = get_absolute_file_path("lab3_ex2.sce");
getd(path);    // nap tat ca file .sci trong thu muc

// (a) x(n) = {1, -2, 3^, 6},  y(n) = x(n + 1)
[yn, yorigin] = advance([1, -2, 3, 6], 3, 1);
mprintf("(a) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex2_a.png");

// (b) Truong hop goc moi vuot ra ngoai vector: x(n) = {1, 2^, 3},  y(n) = x(n + 3)
[yn, yorigin] = advance([1, 2, 3], 2, 3);
mprintf("(b) yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex2_b.png");
