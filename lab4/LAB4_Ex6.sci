// Clear old scripts
clc;        
close;      
clear;      

// Define the signal, causal signal start at n = 0
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

n_y = 0:(Ly - 1);

// b. Folding and shifting method
y = zeros(1, Ly);
for k = 1:Lh
    y(k:k+Lx-1) = y(k:k+Lx-1) + h(k) * x;
end

disp('n values:');
disp(n_y);
disp('Convolution y(n) using folding and shifting (with n=0 at first element):');
disp(y);

// c. Matrix method
y_matrix = zeros(1, Ly);
// Calculate the matrix A
matrix_A = zeros(Lx, Lh);
for i = 1:Lx
    for j = 1:Lh
        matrix_A(i, j) = x(i) * h(j);
    end
end

// Calculate diagonal sum to find the signal y using matrix method
for n_val = 0:Ly-1
    sum_diag = 0;
    for i = 1:Lx
        for j = 1:Lh
            if (i + j == n_val + 2) then
                sum_diag = sum_diag + matrix_A(i, j);
            end
        end
    end
    y_matrix(n_val + 1) = sum_diag;
end

disp('n values:');
disp(n_y);
disp('Convolution y(n) using matrix method:');
disp(y_matrix);

// c. Calculate instantaneous energy of signals (x(n)^2 and y(n)^2)
energy_x = x.^2;
energy_y = y.^2;

// Define time indicate
n_x = 0:(Lx - 1);
xn = x;   // x(n)
yn = y;   // y(n)
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
plot2d3(n_y, yn, style=2);
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
