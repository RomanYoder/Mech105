clear;clc;
%First things first create the function we are taking the taylor seris for
syms x;
f = (25*x^3)+(-6*x^2)+(7*x)-88;
%how about we make this program better and simply ask the user how many
%terms they want to take the taylor seris out to, and what points they want
prompt='how many terms do you want for your taylor seris of the function 25x^3-6x^2+7x-88: \n ';
prompt2=' \n Input your base point: \n ';
prompt3=' \n Input number to be aproximated for: \n ';
l=input(prompt);
basep=input(prompt2);
x=input(prompt3);
%calculate the true value for use in error statements
trufunc=f;
truevalue=subs(f);
%so like create an array of the length they asked dude
taytay=[1:l];
newfunc=0;
 for k=1:l;
     if k == 1
         newfunc=f;
     else
         newfunc=diff(f,k-1);
     end
     taytay(k)=((subs(newfunc))/(factorial(k-1)))*(basep-x)^(k-1);
 end
 state1= ' the terms of the taylor seris are: ' ;
 disp(state1);
 taytay;
 disp(taytay);
 state2= ' the value of this taylor series is: ';
 disp(state2);
 taysum=sum(taytay);
 disp(taysum);
 state3= ' the true percent relative error of this taylor seris is: ';
 disp(state3);
 PRE=((truevalue-taysum)/(truevalue));
 disp(double(PRE*100));
 %Part 2 also my code is above the bar for part 1 so im gonna
 %be lazy on part 2
 state4 = ' Hey heres foward, backward, and central aproximations for the derivative of the function at x=2 using h=0.25';
 disp(state4);
 syms h;
 syms t;
 t=2;
 h=0.25;
 x=2;
 % Im sure theres some way to plug in t+h ot t-h into f to get the
 % different functions so f could be rewritten and everything would adjust
 fowardf=(((25*(t+h)^3)+(-6*(t+h)^2)+(7*(t+h))-88)-((25*t^3)+(-6*t^2)+(7*t)-88))/(h);
 backf=(((25*(t)^3)+(-6*(t)^2)+(7*(t))-88)-((25*(t-h)^3)+(-6*(t-h)^2)+(7*(t-h))-88))/(h);
 middlef=(((25*(t+h)^3)+(-6*(t+h)^2)+(7*(t+h))-88)-((25*(t-h)^3)+(-6*(t-h)^2)+(7*(t-h))-88))/(2*h);
disp(double(subs(fowardf)));
disp(double(subs(backf)));
disp(double(subs(middlef)));
state5= 'the real derivative at x=2 is:';
disp(state5);
disp(subs(diff(f)));
 
 
 
 