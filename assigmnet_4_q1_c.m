clear;clc;

syms t

b=0;
c=pi/2;
d=2.5;
a=1.5*c;
q_dot(t) = a*(b+sin(c*t));
t = linspace(0,2);
plot(t,q_dot(t));
%  q(t) =a*b*t- a*cos(c*t)/c;
%  t = linspace(0,2);
%   plot(t,q(t));
 
%  d_2dot(t) = a*cos(c*t);
%   t = linspace(0,2);
%   plot(t,d_2dot(t));
%  