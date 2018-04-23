function [root, fx, ea, iter] = falsePosition(func,xl,xu,es,maxiter);
%READ THIS FIRST IF YOU INCORECTLY USE THIS FUNCTION IT WILL NOT WORK
%This function accepts a function and returns the root(the zero) of that function
%between the upper bound xu and lower bound. The funtion runs until either
%the max iterations(maxiter) are reached or the desireded relative error(es) is reached.
%HERE IS HOW YOU CORRECTLY INPUT THIS
%f = @(x)(x+3)*(x-4);
%[root, fx, ea, iter]=falsePosition(f,0,5,0.1,1000)
%If you fail to correctly pass the function handle it will not work.
if nargin <4
    maxiter=200;
    es=0.0001;
elseif nargin <5
    maxiter=200;
elseif nargin<3 || nargin>5
    error('to many or to few arguements');
end

iter=0;
yl=feval(func,xl);
yu=feval(func,xu);
ea=1000*es;
xrold=0;
if (yl*yu)>0
    error('Your brakets have the same sign');
end
while ea>es;
    xr=xu-(((yu)*(xl-xu))/(yl-yu));
    yr=func(xr);
    if yr*yl>0
        xl=xr;
    else
        xu=xr;
    end
    if iter > 0
        ea=(abs((xr-xrold)/xr))*100;
    end
    xrold=xr;
    iter=iter+1;
    if iter>maxiter
        break
    end
end
fx=func(xr);
root=xr;