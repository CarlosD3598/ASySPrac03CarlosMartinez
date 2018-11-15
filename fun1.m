function F=fun1(r,W,n)

F=(r.^n).*cos(W.*n)+(r.^n).*sin(W.*n)*1j;
Fmag=abs(F);
Fang=angle(F);
figure1 = figure;
stem3(n,real(F),imag(F));
xlabel('n','FontWeight','bold','FontSize',12);
ylabel('Re(x[n])','FontWeight','bold','FontSize',12);
zlabel('Im(x[n])','FontWeight','bold','FontSize',12);
title('x[n]=r^ncos[\Omegan]+ r^nsen(\Omegan)j');
grid on

figure
subplot(1,2,1)
stem(n,Fmag)
title('|x[n]|')
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off'; 

subplot(1,2,2)
stem(n,Fang)
title('<x[n]')
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
end