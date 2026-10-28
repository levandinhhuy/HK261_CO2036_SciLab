//Ex3: y(n) = x(-n)
function [yn, yorigin] = fold(xn, xorigin)
    xn = xn(:)';
    L = length(xn);
    
    if xorigin < 1 | xorigin > L | xorigin <> round(xorigin) then
        error("fold: xorigin phai la so nguyen trong [1, length(xn)]");
    end
    
    yn = xn($:-1:1);
    yorigin = L - xorigin + 1;
    
    nlim = [min(1 - xorigin, 1 - yorigin), max(L - xorigin, L - yorigin)];
    f = scf(); clf(); f.axes_size = [700, 500];
    subplot(2, 1, 1); plot_signal(xn, xorigin, "x(n)", "blue", nlim);
    subplot(2, 1, 2); plot_signal(yn, yorigin, "y(n) = x(-n)", "red", nlim);
    
endfunction
