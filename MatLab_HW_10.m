f=@(x)(x/(1-x)*sqrt(6/(2+x))-0.05);
xi=0;%initial bracket to search for sign change
xf=5;%step end
h=0.25;%step size
pofi=h-1000;%point of intrest
xn=0;
while xi<=xf
    xn=xi;
    xi=xi+h;
    if feval(f,xn)*feval(f,xi)<0
        pofi=xn;
    end
    if pofi~=h-1000
        break
    end
end
if pofi==h-1000;
    error('No sign change was found');
end
x0=[xn xi];
r=fzero(f,x0);
disp('The root is:');
disp(r);
disp('The value of the function at that root is:' );
disp(feval(f,r));
