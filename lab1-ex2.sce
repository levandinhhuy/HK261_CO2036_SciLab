clc; clear; clf;

//analog signal 
F = 50;
T = 1/F;
//discrete-time signal
Fs= 300;
N = 6;
del = 0.1;

//Signal
 t = 0:1e-5:5*T;  // 0 to 5T = 0.2 with step 1e-5
 xa = 3*sin(100*%pi*t);
 
 n = 0:N*5-1;  // 5T = 5N = 30, with 0 - 29
 x = 3*sin(%pi*n/3);
 
 xq = del*fix(xa/del);
 


// ===== Fig 1: xa(t) =====
subplot(3,1,1);
plot(t, xa, "b");
xtitle("Continuous-Time Signal xa(t) = 3sin(100πt)", "Time (s)", "xa(t)");
a = gca(); a.data_bounds = [0 -3; 0.1 3];

// ===== Figure 2: x(n) =====
subplot(3,1,2);
plot2d3(n, x);
xtitle("Discrete-Time Signal x(n) = 3sin((1/3)πn)", "n", "x(n)");
a = gca(); a.data_bounds = [0 -3; 30 3];

// ===== Figue 3: xq =====
subplot(3,1,3);
plot2d2(t, xq, style=2);
xtitle("Quantized Signal xq(n) with Δ = 0.1", "Time (s)", "xq(n)");
a = gca(); a.data_bounds = [0 -3; 0.1 3];
