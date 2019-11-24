      %trajectory calculation%
      clear;clc;

  syms t
    to=0;
     tf=4;
     qo=1;
     vo=0;
     ao=0;
     qf=0;
     vf=0;
     af=0;
      a=   [1 to  to^2   to^3     to^4   to^5;
            0  1  2*to   3*to^2   4*to^3  5*to^4;
            0  0   2     6*to    12*to^2  20*to^3;
            1  tf  tf^2  tf^3     tf^4    tf^5;
            0  1   2*tf  3*tf^2  4*tf^3 5*tf^4;
            0  0   2     6*tf    12*tf^2  20*tf^3]; 
    
    c=[qo,vo, ao,qf,vf,af]';
     b= a\c;
      a0=b(1,1);
     a1=b(2,1);
    a2=b(3,1);
     a3= b(4,1);
     a4=b(5,1);
     a5=b(6,1);
      fn(t) = a0+a1*t+ a2*t^2+a3*t^3+a4*t^4 +a5*t^5;
      v(t) = diff(fn(t), t, 1);
      ac(t)= diff(v(t),t,1);
%        t = linspace(0,4);
%       plot(t,ac(t))
%      plot(t,v(t));
%      plot(t,fn(t));
      
tbc = [to tf]; % [x0 xf]
xbc = [qo qf];
xdotbc = [0 0];
xdotbb  =[ 0 0]

t = 0:0.1:4;
x =  spline(tbc,[xdotbc(1) xbc xdotbc(2)],t);

plot(t,x,tbc,xbc,'or');
title('Spline Equation')
xlabel('t')
ylabel('x')
axis([-1 11 0 4]);