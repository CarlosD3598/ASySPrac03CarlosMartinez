clear; clc; close all;

u= @(n) heaviside(n);
x= @(n) (n+4).*(u(n+4)-u(n))+(4-n).*(u(n)-u(n-4))
n=-20:20;
figure
stem(n,x(n)); grid on;
title('x[n]')

figure
for i=1:6
    subplot(2,3,i)
    switch i
        case 1
            stem(n,x(-n))
            title('x[-n]'); axis([-7 3 0 3.5]);
        case 2
            stem(n,x(n+6))
            title('x[n+6]'); axis([-7 3 0 3.5]);
        case 3
            stem(n,x(n-6))
            title('x[n-6]'); axis([5 13 0 3.5]);
        case 4
            stem(n,x(3*n))
            title('x[3n]'); axis([-2 3 0 3.5]);
        case 5
            stem(n,x(n/3))
            title('x[n/3]'); axis([-2 20 0 3.5]);
        case 6
            stem(n,x(3-n))
            title('x[3-n]'); axis([-4 4 0 3.5]);
    end
    xlabel('n'); ylabel('x[n]');
    grid on
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ax.Box = 'off';
end

