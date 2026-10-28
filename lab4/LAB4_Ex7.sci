// Clear old scripts
clc;        
close;      
clear;      

// Modulo function
function r = mymod(a, b)
    r = a - floor(a / b) * b;
endfunction

// Define the signal, causal signal start at n = 0
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];

N = length(x);

// b. Folding and shifting method
y_circ = zeros(1, N);
for n = 0:(N-1)
    sum_val = 0;
    for k = 0:(N-1)
        index = mymod(n - k, N) + 1;
        sum_val = sum_val + h(k+1) * x(index);
    end
    y_circ(n+1) = sum_val;
end

disp("Circular convolution y(n) using folding and shifting:");
disp(y_circ);

// c. Matrix method
X = zeros(N, N);
for n = 0:(N-1)
    for k = 0:(N-1)
        index = mymod(n - k, N) + 1;
        X(n+1, k+1) = x(index);
    end
end
y_matrix = X * h';
y_matrix = y_matrix';

disp("Circular convolution y(n) using matrix method:");
disp(y_matrix);

// c. Calculate instantaneous energy of signals (x(n)^2 and y(n)^2)
energy_x = x.^2;
energy_y = y_circ.^2;

// Define time indicate
n_x = 0:(N - 1);
xn = x;   // x(n)
n_y = n_x;
yn = y_circ;   // y(n)
n_ex = n_x;
ex = energy_x;
n_ey = n_y;
ey = energy_y;

// Plot signal x(n)
subplot(2,2,1);
plot2d3(n_x, xn, style=2); 
plot(n_x, xn, 'b*');       
a = gca();                 
a.data_bounds = [min(n_x)-1, min(xn)-1; max(n_x)+1, max(xn)+1]; 
xtitle('Signal x(n)', 'n', 'Amplitude');
xgrid();

// Plot signal y(n)
subplot(2,2,2);
plot2d3(n_x, yn, style=2);
plot(n_y, yn, 'r*');
a = gca();
a.data_bounds = [min(n_y)-1, min(yn)-1; max(n_y)+1, max(yn)+1];
xtitle('Signal y(n)', 'n', 'Amplitude');
xgrid();

// Plot instantaneous energy of x(n): ex = x(n)^2
subplot(2,2,3);
plot2d3(n_ex, ex, style=2);
plot(n_ex, ex, 'm*');
a = gca();
a.data_bounds = [min(n_ex)-1, min(ex)-1; max(n_ex)+1, max(ex)+1];
xtitle('Instantaneous Energy of x(n)', 'n', 'x(n)^2');
xgrid();

// Plot instantaneous energy of y(n): ey = y(n)^2
subplot(2,2,4);
plot2d3(n_ey, ey, style=2);
plot(n_ey, ey, 'g*');
a = gca();
a.data_bounds = [min(n_ey)-1, min(ey)-1; max(n_ey)+1, max(ey)+1];
xtitle('Instantaneous Energy of y(n)', 'n', 'y(n)^2');
xgrid();
