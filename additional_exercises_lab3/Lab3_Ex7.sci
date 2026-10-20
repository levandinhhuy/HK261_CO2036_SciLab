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

// Delay y(n) = x(n-k); negative k advances.
function [yn, yo] = td_signal(xn, xo, k)
    yn = xn;
    yo = xo - k;
    if yo < 1 then
        yn = [zeros(1, 1 - yo), xn];
        yo = 1;
    end
    if yo > length(yn) then
        yn = [yn, zeros(1, yo - length(yn))];
    end
endfunction

// Fold y(n) = x(-n).
function [yn, yo] = fd_signal(xn, xo)
    yn = xn($:-1:1);
    yo = length(xn) - xo + 1;
endfunction

// Open figure fig_id and plot signal (yn, yo).
function show_sig(fig_id, yn, yo, ttl)
    scf(fig_id); clf();
    plot_stem((1:length(yn)) - yo, yn, ttl);
endfunction

xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xo = 4;

show_sig(71, xn, xo, "Signal y(n) = x(n)");

[a, ao] = fd_signal(xn, xo);
show_sig(72, a, ao, "Signal y(n) = x(-n)");

[b, bo] = td_signal(a, ao, 4);
show_sig(73, b, bo, "Signal y(n) = x(-n + 4)");

[c, co] = td_signal(xn, xo, 4);
show_sig(74, c, co, "Signal y(n) = x(n - 4)");

[d, d_o] = fd_signal(c, co);
show_sig(75, d, d_o, "Signal y(n) = x(-n - 4)");
