// ----------------------------------------------------------
// 1. plot2d3() - Plot using vertical bars
// ----------------------------------------------------------
function demo_plot2d3()
    clf()
    x = 0:2*%pi/20:2*%pi;
    plot2d3(x, sin(x));
    xtitle("Example of plot2d3()", "x", "sin(x)");
endfunction

// ----------------------------------------------------------
// 2. min() - Find the minimum value
// ----------------------------------------------------------
function demo_min()
    disp("---- Example of min() ----");
    [m, k] = min([5 3 -2 8]);
    disp(m, "Minimum value:");
    disp(k, "Index (position):");
endfunction

// ----------------------------------------------------------
// 3. max() - Find the maximum value
// ----------------------------------------------------------
function demo_max()
    disp("---- Example of max() ----");
    [m, k] = max([5 3 -2 8]);
    disp(m, "Maximum value:");
    disp(k, "Index (position):");
endfunction

// ----------------------------------------------------------
// 4. subplot() - Split the graphics window into a grid
// ----------------------------------------------------------
function demo_subplot()
    clf()
    x = 0:0.1:2*%pi;

    subplot(2,1,1)
    plot2d(x, sin(x))
    title("sin(x)")

    subplot(2,1,2)
    plot2d(x, cos(x))
    title("cos(x)")
endfunction

// ----------------------------------------------------------
// 5. title() - Set the title of a plot
// ----------------------------------------------------------
function demo_title()
    clf()
    x = 0:0.1:2*%pi;
    plot2d(x, sin(x))
    title("Plot of sin(x)", "fontsize", 3, "color", "blue")
endfunction

// ----------------------------------------------------------
// 6. xlabel() - Set the x-axis label
// ----------------------------------------------------------
function demo_xlabel()
    clf()
    x = 0:0.1:2*%pi;
    plot2d(x, sin(x))
    xlabel("x axis (rad)")
endfunction

// ----------------------------------------------------------
// 7. ylabel() - Set the y-axis label
// ----------------------------------------------------------
function demo_ylabel()
    clf()
    x = 0:0.1:2*%pi;
    plot2d(x, sin(x))
    ylabel("sin(x)")
endfunction

// ----------------------------------------------------------
// 8. bool2s() - Convert a boolean matrix to a 0/1 matrix
// ----------------------------------------------------------
function demo_bool2s()
    disp("---- Example of bool2s() ----");
    disp("bool2s([%t %t %f %t]) =", bool2s([%t %t %f %t]));
    disp("bool2s([2.3 0 10 -1]) =", bool2s([2.3 0 10 -1]));
endfunction

// ----------------------------------------------------------
// 9. deff() - Inline definition of a function
// ----------------------------------------------------------
function demo_deff()
    disp("---- Example of deff() ----");
    deff('x = myplus(y,z)', 'x = y+z');
    disp(myplus(1,2), "myplus(1,2) =");
endfunction

function ex2()
    n = -5:5;
    msignal = bool2s (n >= 0);
    plot2d3(n, msignal)
    title('Exercise 2');
endfunction

function ex3()
    n = -5:5;
    msignal = bool2s (n == 0);
    plot2d3(n, msignal)
    title('Exercise 3');
endfunction

function ex4()
    n = -5:5;
    ur = n .* bool2s (n >= 0);
    plot2d3(n, ur);
    plot(n, ur, 'b*');
    a = gca(); 
    a.data_bounds = [-6, -1; 6, 6];
    xgrid;
endfunction

function ex5()
    n = -1:1; x = [1, 3, -2]; x_neg = [-2, 3, 1];
    xe = 0.5 * (x + x_neg); xo = 0.5 * (x - x_neg);

    subplot(2,3,1); plot2d3(n, x); plot(n, x, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 2, 4];
    title('Original signal x(n)'); xlabel('n'); ylabel('x(n)'); xgrid;

    subplot(2,3,2); plot2d3(n, xo); plot(n, xo, 'b*');
    a2 = gca(); a2.data_bounds = [-2, -4; 2, 4];
    title('Odd signal component x_o(n)'); xlabel('n'); ylabel('x_o(n)'); xgrid;

    subplot(2,3,3); plot2d3(n, xe); plot(n, xe, 'b*');
    a3 = gca(); a3.data_bounds = [-2, -4; 2, 4];
    title('Even signal component x_e(n)'); xlabel('n'); ylabel('x_e(n)'); xgrid;
endfunction

function ex6()
    n = -1:3; 
    x1 = [0, 0, 1, 3, -2]; x2 = [0, 1, 2, 3, 0];
    y = x1 + x2;
    
    subplot(2,3,1); plot2d3(n, x1); plot(n, x1, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 8];
    title('Signal x_1(n)'); xlabel('n'); ylabel('x_1(n)'); xgrid;
    
    subplot(2,3,2); plot2d3(n, x2); plot(n, x2, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 8];
    title('Signal x_2(n)'); xlabel('n'); ylabel('x_2(n)'); xgrid;
    
    subplot(2,3,3); plot2d3(n, y); plot(n, y, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 8];
    title('Signal y(n) = x_1(n) + x_2(n)'); xlabel('n'); ylabel('y(n)'); xgrid;
endfunction

function ex7()
    n = -1:3; 
    x1 = [0, 0, 1, 3, -2]; x2 = [0, 1, 2, 3, 0];
    y = x1 .* x2;
    
    subplot(2,3,1); plot2d3(n, x1); plot(n, x1, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 10];
    title('Signal x_1(n)'); xlabel('n'); ylabel('x_1(n)'); xgrid;
    
    subplot(2,3,2); plot2d3(n, x2); plot(n, x2, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 10];
    title('Signal x_2(n)'); xlabel('n'); ylabel('x_2(n)'); xgrid;
    
    subplot(2,3,3); plot2d3(n, y); plot(n, y, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 4, 10];
    title('Signal y(n) = x_1(n).x_2(n)'); xlabel('n'); ylabel('y(n)'); xgrid;
endfunction

function ex8a()
    n_x = -2:1; x = [1, -2, 3, 6];
    n_y1 = -1:2
    y1 = [6, 3, -2, 1];

    subplot(2,2,1); plot2d3(n_x, x); plot(n_x, x, 'b*');
    a1 = gca(); a1.data_bounds = [-3, -4; 2, 8];
    title('Original signal x(n)'); xlabel('n'); ylabel('x(n)'); xgrid;

    subplot(2,2,2); plot2d3(n_y1, y1); plot(n_y1, y1, 'b*');
    a1 = gca(); a1.data_bounds = [-2, -4; 3, 8];
    title('Signal y_1(n) = x(-n)'); xlabel('n'); ylabel('y_1(n)'); xgrid; 
endfunction

function ex8b()
    n_x = -2:1; x = [1, -2, 3, 6];
    n_y2 = -5:1; y2 = [1, -2, 3, 6, 0, 0, 0];

    subplot(2,2,1); plot2d3(n_x, x); plot(n_x, x, 'b*');
    a1 = gca(); a1.data_bounds = [-3, -4; 2, 8];
    title('Original signal x(n)'); xlabel('n'); ylabel('x(n)'); xgrid;

    subplot(2,2,2); plot2d3(n_y2, y2); plot(n_y2, y2, 'b*');
    a2 = gca(); a2.data_bounds = [-6, -4; 2, 8];
    title('Signal y_2(n) = x(n + 3)'); xlabel('n'); ylabel('y_2(n)'); xgrid; 
endfunction

function ex8c()
    n_x = -2:1; x = [1, -2, 3, 6];
    n_y3 = -3:0; y3 = [12, 6, -4, 2];

    subplot(2,2,1); plot2d3(n_x, x); plot(n_x, x, 'b*');
    xlabel('n'); ylabel('x(n)'); xgrid;
    a1 = gca(); a1.data_bounds = [-3, -6; 2, 14];
    title('Original signal x(n)'); xgrid;

    subplot(2,2,2); plot2d3(n_y3, y3); plot(n_y3, y3, 'b*');
    xlabel('n'); ylabel('y_3(n)'); xgrid; 
    a2 = gca(); a2.data_bounds = [-4, -6; 1, 14];
    title('Signal y_3(n) = 2x(-n-2)'); xgrid;
endfunction
