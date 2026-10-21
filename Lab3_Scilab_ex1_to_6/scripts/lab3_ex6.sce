// Ex6
clc; clear;
path = get_absolute_file_path("lab3_ex6.sce");
getd(path);    // nap tat ca file .sci trong thu muc

// x(n) = {1, 2^, -2},  h(n) = {2, 0, 1^}
xn = [1, 2, -2];  xorigin = 2;
hn = [2, 0, 1];   horigin = 3;
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);
mprintf("yn = %s,  yorigin = %d\n", sci2exp(yn), yorigin);
xs2png(gcf(), path + "fig_ex6.png");
//Kiem tra san lai bang ham convol co 
mprintf("Kiem tra bang convol(): %s\n", sci2exp(convol(xn, hn)));
