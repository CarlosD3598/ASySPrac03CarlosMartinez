function E=energiadis(n,h)
E1=(abs(h)).^2;
E=sum(E1)
figure
stem(n,h)
xlabel('n','FontWeight','bold','FontSize',12);
ylabel('x[n]','FontWeight','bold','FontSize',12);
title('Gráfica de x[n]')
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off'; 
end