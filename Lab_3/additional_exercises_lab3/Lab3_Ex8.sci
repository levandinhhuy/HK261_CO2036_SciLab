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

// Open figure fig_id and plot y(n) evaluated on nn.
function show_fn(fig_id, nn, y, ttl)
    scf(fig_id); clf();
    plot_stem(nn, y, ttl);
endfunction

// Unit impulse delta(n).
function y = delta_fn(n)
    y = bool2s(n == 0);
endfunction

// Unit step u(n).
function y = u_fn(n)
    y = bool2s(n >= 0);
endfunction

xn = [1, 1, 1, 1, 0.5, 0.5];
xo = 2;
nn = -12:12;

show_fn(81, nn, sig_at(xn, xo, nn), "Signal x(n)");
show_fn(82, nn, sig_at(xn, xo, nn - 2), "Signal x(n - 2)");
show_fn(83, nn, sig_at(xn, xo, 4 - nn), "Signal x(-n + 4)");
show_fn(84, nn, sig_at(xn, xo, nn + 2), "Signal x(n + 2)");
show_fn(85, nn, sig_at(xn, xo, nn) .* u_fn(2 - nn), "Signal x(n).u(2 - n)");
show_fn(86, nn, sig_at(xn, xo, nn - 1) .* delta_fn(nn - 3), "Signal x(n - 1).delta(n - 3)");
show_fn(87, nn, sig_at(xn, xo, nn .^ 2), "Signal x(n^2)");
show_fn(88, nn, (sig_at(xn, xo, nn) + sig_at(xn, xo, -nn)) / 2, "Signal Even part of x(n)");
show_fn(89, nn, (sig_at(xn, xo, nn) - sig_at(xn, xo, -nn)) / 2, "Signal Odd part of x(n)");
