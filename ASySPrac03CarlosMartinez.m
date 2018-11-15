%%
%
% <<portada.png>>
%% Objetivos
% * Manipulaci�n b�sica de MATLAB
% * Gr�ficas de se�ales reales y complejas discretas
% * Transformaci�n de se�ales discretas (escalamiento y traslaciones)
% * Calculo de energ�a y potencia de se�ales discretas
%% Introducci�n 
%
% *Diezmado e Interpolaci�n*
%
% El escalamiento de las se�ales en tiempo discreto debe ser realizado con
% cuidado. Para se�ales en tiempo discreto, el escalamiento en el tiempo es
% equivalente a incrementar o decrecer la extensi�n de la se�al. Los
% problemas que se suscitan en el escalamiento en el tiempo no se
% caracterizan por lo que sucede, sino c�mo sucede.
%
% *Diezmado*
%
% Sup�ngase que una se�al $$x[n]$ corresponde a una se�al anal�gica x(t)
% muestreada en intervalos $$t_{s}$. La se�al $$y[n]=x[2n]$ entonces
% corresponde a la se�al comprimida $$x(2t)$ muestreada en $$t_{s}$ y
% contiene unicamente muestras alternativas de $$x[n]$ (que corresponden a 
% $$x[0], x[2], x[4], ...$). Se puede obtener tambi�n $$y[n]$ directamente
% de $$x(t)$ (no mediante su forma comprimida) si se muestrea en intervalos
% de $$2t_{s}$ (o en un intervalo de muestreo $$S=\frac{1}{2t_{s}}$). Esto
% implica una reducci�n doble en el intervalo de muestreo. El diezmado por
% un factor $$N$ es equivalente al muestreo de $$x(t)$ en intervalos de
% $$Nt_{s}$ y conlleva a una reducci�n $$"N"$ del intervalo de muestreo. La
% se�al diezmada $$x[Nn]$ es generada a partir de $$x[n]$ reteniendo cada
% muestra $$N$ que corresponde a los �ndices $$k=Nn$ y descartando todos
% las dem�s. 
%
% *Interpolaci�n*
%
% Si $$x[n]$ corresponde a $$x(t)$ muestreada en intervalos $$t_{s}$,
% entonces $$y[n]=x[\frac{n}{2}]$ corresponde a $$x(t)$ muestreada en
% $$\frac{t_{s}}{2}$ y posee el doble de longitud que $$x[n]$ con una nueva
% muestra entre muestas adyacentes de $$x[n]$. Si una expresi�n para
% $$x[n]$ (o la se�al anal�gica equivalente) fueran conocidas, no habr�a
% problema en determinar estos nuevos valores de muesta. Si s�lo se
% proporcionan valores de muestra de $$x[n]$ (sin su forma anal�tica), la
% mejor forma de proceder es interpolar muestras intermedias. Por ejemplo,
% se puede escoger cada cada nuevo valor de intervalo como cero
% (interpolaci�n en cero), una constante igual al valor de muestreo
% anterior (interpolaci�n de escal�n), o el promedio de los valores de
% muestreo adyacentes (interpolaci�n lineal). Com�nmente se refiere a la
% interpolaci�n en cero como "muestreo hacia arriba" y juega un rol
% importante en los esquemas pr�cticos de la interpolaci�n. La
% interpolaci�n en factores $$N$ es equivalente al muestreo de $$x(t)$ en
% intervalos $$\frac{t_{s}}{N}$ e implica un aumento de $$N$ veces en
% ambos, tanto la tasa de muestreo como la extensi�n de la se�al. 
%
% *Algunas Consideraciones*
%
% <<int0.PNG>>
% 
% Consid�nrese dos conjuntos de operaciones mostradas a continuaci�n:
%
% <<int1.PNG>>
%
% A primera vista, ambos conjuntos de operaciones comienzan con $$x[n]$ y
% aparentemente recuperan a $$x[n], sugiriendo que la interpolaci�n y el
% diezmado son operaciones inversas. De hecho, s�lo la segunda secuencia de
% operaciones (interpolaci�n seguida de diezmado) recupera $$x[n]$
% exactamente. Para entender c�mo, sea 
%
% <<intxn.PNG>>
%
% Usando interpolaci�n por escal�n, por ejemplo, las dos secuencias de
% operaciones son las que siguen 
% 
% <<int2.PNG>>
% 
% Ahora podemos apreciar que, efectivamente, el diezmado es la funci�n
% inversa de la interpolaci�n, pero que lo contrario no es necesariamente
% cierto. 
% Despu�s de todo, es altamente improbable que cualquier esquema de
% interpolaci�n recupere o prediga el valor exacto de las muestras que
% fueron descartadas durante el diezmado. En situaciones en las que tanto
% la interpolaci�n como el diezmado deben ser realizados en sucesi�n, es
% entonces preferible interpolar primero. En la pr�ctica, por supuesto, la
% interpolaci�n o el diezmado deben preservar el contenido de informaci�n
% de la se�al original, y esto impone restricciones en la tasa a la cual
% las muestras originales fueron adquiridas. 
%
% *Ejemplos*
%
% Para la funci�n 
% $$[n+4]\cdot (u[n+4]-u[n])+[4-n]\cdot (u[n]-u[n-4])$
% Se realiza una extensi�n y compresi�n.
%%
% 
% <<ej1.PNG>>
% 
%% Desarrollo
% Se plantea la soluci�n a seis ejercicios, donde cada uno requiere del
% uso de Matlab como herramienta de c�lculo y an�lisis; comenzando una 
% nueva secci�n (para la publicaci�n) en cada uno de ellos.
%% Ejercicio 1
% Crea una funci�n que se llame _fun1_ y reciba dos parametros $\Omega$ y 
% $a$ la funci�n debe regresar la evaluaci�n $f[n]=r^ncos[\Omega n]+ r^nsen(\Omega n)j$,
% esta funci�n debe trabajar con $r\in R^+$, $\Omega\in R$ y $n\in  N^n$.
% Debe mostrar su c�digo en el reporte (sin ejecutar).
%
%   clear; clc; close all;
%   
%   r=input('Ingresa r:  ');
%   W=input('Ingresa W:  ');
%   n=input('Ingresa el vector n:  ');
%   X_W=fun1(r,W,n1);
%   
%   function F=fun1(r,W,n)
%   
%   F=(r.^n).*cos(W.*n)+(r.^n).*sin(W.*n)*1j;
%   
%   figure1 = figure;
%   stem3(n,real(F),imag(F));
%   xlabel('n','FontWeight','bold','FontSize',12);
%   ylabel('Re(x[n])','FontWeight','bold','FontSize',12);
%   zlabel('Im(x[n])','FontWeight','bold','FontSize',12);
%   title('x[n]=r^ncos[\Omegan]+ r^nsen(\Omegan)j');
%   grid on
%   end 
%% Ejercicio 2
% Construya una funci�n que gr�fique funciones de $f:N\rightarrow R$ en el
% formato de su elecci�n y pruebe su c�digo mostrando la gr�fica de 
% $x[n]=na^nu[n]$ vs $n$ para $n\in {-2,...,10}$ para $a=0.9$, no debe
% incluir el c�digo, solo el uso de la funci�n para mostrar la gr�fica,
% puede utilizar una funci�n anonima para este fin.
%
% <<2.jpg>>
%% Ejercicio 3
% Construya una funci�n que gr�fique funciones de $f:N\rightarrow R^2$ en
% el formato de su elecci�n y pruebe su c�digo mostrando la gr�fica de la
% funci�n exponencial del primer problema, no debe incluir el c�digo, solo
% el uso de la funci�n para mostrarla gr�fica. Reporte la gr�fica de $f[n]$
% para $r=1.1$, $\Omega=0.5$ y $n\in{-2,...,20}$ (recuerde que ya tiene una
% funci�n para esto). Reporte la gr�fica de $|f[n]|$ vs $n$ y $\angle f[n]$
% vs $n$. Solo reporte las graficas.
% 
% <<F3.png>>
% 
% <<F3_1.png>>
% 
%% Ejercicio 4
% Programe una funci�n que calcule la energ�a de una se�al en tiempo discreto
% la fucion se debe llamar energiadis. La funci�n recibe dos param�tros de entrada:
% el vector de tiempo y las alturas asignadas. La funci�n regresa la energia
% de la se�al y despliega la gr�fica de la se�al. Debe mostrar su c�digo en el reporte (sin ejecutar).
%
%   clear; clc; close all;
%   n2=input('Ingresa el vector de tiempo "n":  ');
%   h=input('Ingresa el vector de alturas de la se�al:  ');
%   En=energiadis(n2,h);
%
%   function E=energiadis(n,h)
%   E1=(abs(h)).^2;
%   E=sum(E1)
%   figure
%   stem(n,h)
%   xlabel('n','FontWeight','bold','FontSize',12);
%   ylabel('x[n]','FontWeight','bold','FontSize',12);
%   title('Gr�fica de x[n]')
%   grid on
%   ax = gca;
%   ax.XAxisLocation = 'origin';
%   ax.YAxisLocation = 'origin';
%   ax.Box = 'off'; 
%   end
%% Ejercicio 5
% Resuelva el problema 3.1.1 c) de Lathi, aplicando su funci�n anterior
%
% *PROBLEMA 3.1.1* Encuentra la energ�a de la se�al descrita en la fig.
% P3.1-1c
% 
% <<P311.png>>
%
% *Ex=28*
%% Ejercicio 6
% Resuelve el problema 3.2.3 de Lathi
%
% *PROBLEMA 3.2.3* Para la se�al mostrada en la fig. P3.1-1b, graficar las
% siguientes se�ales.
% 
% * *x[-n]*
% * *x[n+6]*
% * *x[n-6]*
% * *x[3n]*
% * *x[n/3]*
% * *x[3-n]*
%
clear; clc; close all;
u= @(n) heaviside(n);
x= @(n) n.*u(n)-2*n.*u(n-3)+6*u(n-3)-6*u(n-6)+n.*u(n-6);
n=-20:20;
figure
stem(n,x(n)); grid on;
title('x[n]')
axis([-1 7 0 3.5])
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
%% Apendice A
% Puede consultar los codigos de programaci�n de cada uno de los ejercicios
% en la siguiente <https://drive.google.com/open?id=1S92ylMvayw-5UA44VN2ODfq4XybUVxp6 carpeta>
%% Referencias
% # Lathi, B. (2005). _Linear Systems and Signals_. E.U.A.: Oxford University Press
% # Moore, H. (2009). _MATLAB for Engineers._ E.U.A.: Prentice Hall.
% # Ashok Ambardar. (1999). Analog and Digital Signal Processing. M�xico 
% D. F., M�xico: BROOKS/COLE PUBLISHING COMPANY.
% # Hwei P. Hsu. (2013). Se�ales y Sistemas. M�xico D. F., 
% M�xico: McGrawHill.