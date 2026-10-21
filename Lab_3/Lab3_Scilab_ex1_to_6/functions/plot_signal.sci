// Ham phu: ve tin hieu roi rac x(n) dang vach mau (stem)
//   xn      : vector gia tri
//   xorigin : vi tri (chi so) cua mau n = 0 trong xn
//   ttl     : tieu de do thi
//   clr     : ten mau, vi du "blue", "red"
//   nlim    : [nmin, nmax] - khoang truc n can hien thi
function plot_signal(xn, xorigin, ttl, clr, nlim)
    n = (1:length(xn)) - xorigin;               // truc thoi gian n
    nl = (nlim(1) - 1):(nlim(2) + 1);           // truc n co them 1 o moi ben

    plot2d(nl', zeros(nl'), style=color("black"));   // duong y = 0

    plot2d3(n', xn', style=color(clr));         // vach mau
    e = gce();
    e.children(1).thickness = 2;

    plot2d(n', xn');                            // dau tron o dinh vach
    p = gce().children(1);
    p.line_mode = "off";                        // tat duong noi cac diem
    p.mark_mode = "on";
    p.mark_style = 9;                           // 9 = hinh tron
    p.mark_foreground = color(clr);

    a = gca();
    a.font_size = 2;                            // co chu so tren truc
    a.title.font_size = 3;                      // co chu tieu de
    a.x_label.font_size = 2;
    a.y_label.font_size = 2;
    ymin = min([0, xn]) - 1;
    ymax = max([0, xn]) + 1;
    a.data_bounds = [nl(1), ymin; nl($), ymax];
    a.tight_limits = "on";
    a.sub_ticks = [0, a.sub_ticks(2)];          // bo vach phu tren truc n
    // Truc n chi chia vach tai cac gia tri nguyen
    a.x_ticks = tlist(["ticks", "locations", "labels"], nl', string(nl'));
    a.grid = [color("gray"), color("gray")];
    a.grid_position = "background";             // luoi nam duoi vach mau
    xtitle(ttl, "n", "Amplitude");
endfunction
