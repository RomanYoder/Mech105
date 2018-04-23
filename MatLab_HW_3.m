%reset program
clear;clc;
%Ask the user to input a number in meters
prompt='Enter the height of the water in the tank between 0 & 33 in m \n (number followed by a m): \n ';
x=input(prompt,'s');
%find the length of the string entered
y=length(x);
%call to the numbers in the string
c=x(1:y-1);
h=str2num(c);
areacone=0;
areacyl=0;
upperradius=0;
if h<0
    fprintf('\n You done messed up boie');
    error('\n You really couldnt pick a positive number');
elseif h<= 19
    areacyl=((25/2)^2)*pi*h;
elseif h<=33
    %back to calc 2? jk I just found a formula for the shape
    upperradius=12.5+((h-19)*(10.5/14));
    areacone=(((pi*(h-19))/3)*(12.5^2+12.5*upperradius*upperradius^2));
    areacyl=((((25/2)^2)*pi*19)+areacone);
else
    fprintf('\n yo the tank aint that big cuh');
    error('\n why you gotta do that man');
end

formatSpec = '\n The water in the tank has a volume of %4.2f meters cubed';
fprintf(formatSpec,areacyl);
