// Bai 1: y(n) = x(n - k), k > 0
function [yn, yorigin] = delay(xn, xorigin, k)
    xn = xn(:)';
    L = length(xn);
    if xorigin < 1 | xorigin > L | xorigin <> round(xorigin) then
        error("delay: xorigin phai la so nguyen trong [1, length(xn)]");
    end
    if k <= 0 | k <> round(k) then
        error("delay: k phai la so nguyen duong");
    end

    // Gia tri mau giu nguyen, chi doi vi tri goc
    yn = xn;
    yorigin = xorigin - k;

    // Goc moi nam ben trai vector -> chen 0 vao dau
    if yorigin < 1 then
        yn = [zeros(1, 1 - yorigin), yn];
        yorigin = 1;
    end

    nlim = [min(1 - xorigin, 1 - yorigin), max(L - xorigin, length(yn) - yorigin)];
    f = scf(); clf(); f.axes_size = [700, 500];
    subplot(2, 1, 1); plot_signal(xn, xorigin, "x(n)", "blue", nlim);
    subplot(2, 1, 2); plot_signal(yn, yorigin, "y(n) = x(n - " + string(k) + ")", "red", nlim);
endfunction
