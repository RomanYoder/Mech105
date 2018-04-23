function I= Simpson(x,y)
%This program will not handle step sizes smaller then 1*10^-14
if round(max(diff(x))-min(diff(x)),14)~=0 || length(x)~=length(y)
    error('x is not evenly spaced, or x and y are not of the same length');
end
%Make sure the data is evenly spaced and the lengths are equal
termdif=round(x(length(x))-x(length(x)-1),14);
%calculates distance between terms
intsumstore=0;
%creates array for value storage of the iterative 1/3 rule and trapoziod
%rule
h=0;
if rem(length(x),2)==1
    h=((length(x)-1)/2);
    intsumstore=1:1:h;
else
    intsumstore=1:1:(length(x)/2);
    h=(length(x)-2)/2;
    intsumstore(h+1)=(termdif/2)*(y(length(x))+y(length(x)-1));
    warning('The trapazoid rule is in play');
end
%sees the the term length of x sets the iterations needed for the for loop
%and 1/3 rule and uses trap rule if needed
xiterateadjust=0;
for k=1:1:h
    intsumstore(k)=((2*termdif)/6)*(y(k+xiterateadjust)+4*y(k+xiterateadjust+1)+y(k+xiterateadjust+2));
    xiterateadjust=xiterateadjust+1;
end
%only iterates once for each grou of 3 points
I=sum(intsumstore);
end