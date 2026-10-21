// Ex 6: y(n) = x(n) * h(n) = sum_k x(k) h(n - k)
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    xn = xn(:)';  hn = hn(:)';
    Lx = length(xn);  Lh = length(hn);
    if xorigin < 1 | xorigin > Lx | xorigin <> round(xorigin) then
        error("convolution: xorigin khong hop le");
    end
    if horigin < 1 | horigin > Lh | horigin <> round(horigin) then
        error("convolution: horigin khong hop le");
    end

    // Chieu dai kq
    Ly = Lx + Lh - 1;
    yn = zeros(1, Ly);

    // Moi cap mau x(i), h(j) dong gop vao y tai chi so i + j - 1
    for i = 1:Lx
        for j = 1:Lh
            yn(i + j - 1) = yn(i + j - 1) + xn(i) * hn(j);
        end
    end

    // n_start(y) = n_start(x) + n_start(h)  =>  yorigin = xorigin + horigin - 1
    yorigin = xorigin + horigin - 1;

    // Ve de lam bao cao
    nlim = [min([1 - xorigin, 1 - horigin, 1 - yorigin]), ..
            max([Lx - xorigin, Lh - horigin, Ly - yorigin])];
    f = scf(); clf(); f.axes_size = [700, 750];
    subplot(3, 1, 1); plot_signal(xn, xorigin, "x(n)", "blue", nlim);
    subplot(3, 1, 2); plot_signal(hn, horigin, "h(n)", "darkgreen", nlim);
    subplot(3, 1, 3); plot_signal(yn, yorigin, "y(n) = x(n) * h(n)", "red", nlim);
endfunction
