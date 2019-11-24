      %trajectory calculation%
  syms t
    to=0;
     tf=2;
     qo=1;
     vo=0;
     qf=4;
     vf=0;
      a=   [1 to to^2 to^3;
            0  1  2*to  3*to^2;
            1 tf tf^2 tf^3;
            0  1  2*tf 3*tf^2];
    
    c=[qo,vo,qf,vf]';
     b= a\c;
     a0=b(1,1);
     a1=b(2,1);
    a2=b(3,1);
     a3= b(4,1);
     
     fn(t) = a0+a1*t+ a2*t^2+a3*t^3
     v(t) = 2*a2*t+3*a3*t^2;
     fun = @(t) 2.*a2.*t+3.*a3.*t.^2 ;
     v33= integral(fun,0,2)
    ac(t) = diff(fn(t), t, 2);
     
     t = linspace(0,2);
     % plot(t,ac(t))
     %plot(t,v(t))
     %plot(t,fn(t));
        

  subplot(4,1,1);
  t = linspace(0,2);
  fplot(@(t) fn(t))

  subplot(4,1,2);
  t = linspace(0,2);
fplot(@(t) v(t))
subplot(4,1,3);
t = linspace(0,2);
fplot(@(t) ac(t))
subplot(4,1,4);
t = linspace(0,2);
hold on
 t = linspace(0,2);
fplot(@(t) fn(t));
 t = linspace(0,2);
fplot(@(t) v(t));
 t = linspace(0,2);
fplot(@(t) ac(t));
hold off

     
   
     
       f0=q(0,a0,a1,a2,a3);
       f1=q(0.667,a0,a1,a2,a3);
       f2=q(0.667,a0,a1,a2,a3);
       f3=q(0.667,a0,a1,a2,a3);
         n=3;
     dt=(tf-to)/n;
     ddt=dt/2;
     
     T=ddt*(f0 + 2*f1 + 2*f2 + f3);
       
       
     function f=  q(t,a0,a1,a2,a3) 
      f= a0+a1*t+ a2*t^2+a3*t^3;
     end
   