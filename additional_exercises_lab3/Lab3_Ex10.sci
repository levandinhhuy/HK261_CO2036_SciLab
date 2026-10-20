// Evaluate signal (xn, xo) at integer positions n, zero outside the vector.
function y = sig_at(xn, xo, n)
    n = n(:)';
    y = zeros(1, length(n));
    idx = n + xo;
    ok = find(idx >= 1 & idx <= length(xn));
    y(ok) = xn(idx(ok));
endfunction

// Draw a stem plot of y(n) on the current axes.
function plot_stem(n, y, ttl)
    n = n(:)'; y = y(:)';
    nz = find(abs(y) > 1e-12);
    if isempty(nz) then
        lo = 0; hi = 0;
    else
        lo = min(n(nz)); hi = max(n(nz));
    end
    lo = min(lo, 0) - 1; hi = max(hi, 0) + 1;
    sel = find(n >= lo & n <= hi);
    n = n(sel); y = y(sel);
    ymax = max([y, 0]); ymin = min([y, 0]);
    pad = max(0.25 * (ymax - ymin), 0.5);
    plot([lo - 0.5, hi + 0.5], [0, 0], "k-");
    for i = 1:length(n)
        plot([n(i), n(i)], [0, y(i)], "b-");
    end
    plot(n, y, "bo");
    a = gca();
    a.data_bounds = [lo - 0.5, ymin - pad; hi + 0.5, ymax + pad];
    a.tight_limits = "on";
    try
        a.x_ticks = tlist(["ticks", "locations", "labels"], (lo:hi)', string((lo:hi)'));
    catch
    end
    xgrid(color("gray"));
    xlabel("n"); ylabel("Amplitude"); title(ttl);
endfunction

// System y(n) = x(n^2).
function y = T1(xn, xo, n)
    y = sig_at(xn, xo, n .^ 2);
endfunction

// System y(n) = x(n) - x(n-1).
function y = T2(xn, xo, n)
    y = sig_at(xn, xo, n) - sig_at(xn, xo, n - 1);
endfunction

// System y(n) = n.x(n).
function y = T3(xn, xo, n)
    y = n .* sig_at(xn, xo, n);
endfunction

// Select the axes for plot k of figure fig (separate window or subplot).
function open_axes(fig, k, separate)
    if separate then
        scf(fig * 10 + k); clf();
    else
        scf(fig);
        subplot(3, 2, k);
    end
endfunction

// Plot x, y, y(n-2), x(n-2) and T[x(n-2)] for system T.
function analyze_system(fig, T, xn, xo, separate)
    nn = -10:12;
    k = 2;
    open_axes(fig, 1, separate); plot_stem(nn, sig_at(xn, xo, nn),     "Signal x(n)");
    open_axes(fig, 2, separate); plot_stem(nn, T(xn, xo, nn),          "Signal y(n)");
    open_axes(fig, 3, separate); plot_stem(nn, T(xn, xo, nn - k),      "Signal y2''(n) = y(n-2)");
    open_axes(fig, 4, separate); plot_stem(nn, sig_at(xn, xo - k, nn), "Signal x2(n) = x(n-2)");
    open_axes(fig, 5, separate); plot_stem(nn, T(xn, xo - k, nn),      "Signal y2(n) = T[x2(n)]");
endfunction

SEPARATE = %f;
xn = [1, 1, 1, 1];
xo = 1;

analyze_system(101, T1, xn, xo, SEPARATE);
analyze_system(102, T2, xn, xo, SEPARATE);
analyze_system(103, T3, xn, xo, SEPARATE);
