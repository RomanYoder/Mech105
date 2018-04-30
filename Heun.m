function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Nargin Stuff
if nargin==5
    maxit=50;
elseif nargin==4
    maxit=50;
    es=0.001;
elseif nargin<4
    error('you did not input enough things');
end
%Creates the t to return
t=tspan(1):h:tspan(2);
y=1:length(t);
%runs for each t
for k=1:length(t)
    %slope function really does the heavy lifting
    if k==1
        y(k)=y0;
    else
        y(k)=y(k-1)+slope(y(k-1),k-1,h,dydt,es,maxit)*h;
    end
end
%Adjusts for inperfect interval by recalling to the slope function.
if tspan(2)-t(length(t))~=0
    t(length(t)+1)=tspan(2)
    y(length(y)+1)=0;
    l=length(t)-1;
    h=t(length(t))-t(l);
    y(length(y))=y(1)+slope(y(1),l,h,dydt,es,maxit)*h;
end
%plots
plot(t,y);
end
function m= slope(y0,t,dt,mfunc,es,maxit)
ypresent=0;
currentslope=feval(mfunc,t-1,y0);
m=feval(mfunc,t-1,y0);
nextslope=0;
yprior=(m*dt)+y0;
currentError=inf;
for k=1:1:maxit
    nextslope=feval(mfunc,t,y0+(m*dt));
    ypresent=(nextslope*dt)+y0;
    currentError=abs((ypresent-yprior)/ypresent)*100;
    if currentError<=es
        break
    end
    m=(nextslope+currentslope)/2;
    yprior=ypresent;
end
    currentError
end 
