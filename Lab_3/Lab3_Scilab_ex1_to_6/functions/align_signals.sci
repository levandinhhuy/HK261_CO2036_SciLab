// Ham phu: can chinh 2 tin hieu ve cung mot truc thoi gian
// Tra ve 2 vector cung chieu dai va vi tri goc chung
function [x1a, x2a, origin] = align_signals(x1n, x1origin, x2n, x2origin)
    // Khoang n cua tung tin hieu
    n1_start = 1 - x1origin;   n1_end = length(x1n) - x1origin;
    n2_start = 1 - x2origin;   n2_end = length(x2n) - x2origin;

    // Khoang n chung: doan nho nhat bao ca hai tin hieu
    nmin = min(n1_start, n2_start);
    nmax = max(n1_end, n2_end);
    L = nmax - nmin + 1;

    // Dat tung tin hieu vao dung vi tri, phan con lai la 0
    x1a = zeros(1, L);
    x2a = zeros(1, L);
    x1a((n1_start - nmin + 1):(n1_end - nmin + 1)) = x1n;
    x2a((n2_start - nmin + 1):(n2_end - nmin + 1)) = x2n;

    origin = 1 - nmin;         // chi so cua n = 0
endfunction
