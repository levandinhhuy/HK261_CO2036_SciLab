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

// Split x(n) into even and odd parts on a common symmetric frame n = -L..L.
function [x_n, xe_n, xo_n, x_origin] = decompose_to_even_odd(x_n, x_origin)
    if x_origin < 1 | x_origin <> round(x_origin) | x_origin > length(x_n) then
        error("x_origin must be an integer in [1, length(x_n)]");
    end
    x_n = x_n(:)';
    L = max(x_origin - 1, length(x_n) - x_origin);
    x_n = sig_at(x_n, x_origin, -L:L);
    x_origin = L + 1;
    xr = x_n($:-1:1);
    xe_n = (x_n + xr) / 2;
    xo_n = (x_n - xr) / 2;
endfunction

[x_n, xe_n, xo_n, x_origin] = decompose_to_even_odd([2, 3, 4, 5, 6], 3);
n = (1:length(x_n)) - x_origin;

scf(91); clf();
subplot(3, 1, 1); plot_stem(n, x_n,  "Signal x(n)");
subplot(3, 1, 2); plot_stem(n, xe_n, "Even component xe(n)");
subplot(3, 1, 3); plot_stem(n, xo_n, "Odd component xo(n)");
