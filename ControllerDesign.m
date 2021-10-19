Vac = 220;
Frq = 50;

Vdc = 500;

Li = 3e-3;
C = 10e-6;
Lg = 1.5e-3;

Rl = 1;
Ll = 10e-3;

Rld = 50;

Rld1 = 200;

sw_fr = 10e3;

N = [1];
D = [10e-3 51];
P = tf(N,D);
wc = 2*pi*sw_fr/10;
wc1 = 2*pi*sw_fr/100;

P.u = 'u';
P.y = 'y';

[C_pi,info] = pidtune(P,'PI',wc);

C_pi.u = 'e';
C_pi.y = 'u';

Sum = sumblk('e = r - y');

P1 = connect(P,C_pi,Sum,'r','y');

[C_pi1,info1] = pidtune(P1,'PI',wc1);