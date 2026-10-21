// ex5: y(n) = x1(n) . x2(n)
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    x1n = x1n(:)';  x2n = x2n(:)';
    if x1origin < 1 | x1origin > length(x1n) | x1origin <> round(x1origin) then
        error("multi: x1origin ko hop le");
    end
    if x2origin < 1 | x2origin > length(x2n) | x2origin <> round(x2origin) then
        error("multi: x2origin ko hop le");
    end

    [x1a, x2a, yorigin] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = x1a .* x2a;              // nhan tung mau (element-wise)

    nlim = [1 - yorigin, length(yn) - yorigin];
    f = scf(); clf(); f.axes_size = [700, 750];
    subplot(3, 1, 1); plot_signal(x1n, x1origin, "x1(n)", "blue", nlim);
    subplot(3, 1, 2); plot_signal(x2n, x2origin, "x2(n)", "darkgreen", nlim);
    subplot(3, 1, 3); plot_signal(yn, yorigin, "y(n) = x1(n) . x2(n)", "red", nlim);
endfunction
