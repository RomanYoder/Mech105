function nd = days(mo, da, leap);
%this function accepts the nessesary input of Month(mo)
%and Day of the month(da) and the optional input of wether it
%it is a leap year (leap) and returns the number of days that
%have passed in that year. leap is a boolean of true or false
%if leap is not asigned it will be asumed that it is not a leap
%year
dayinmonth=[31,28,31,30,31,30,31,31,30,31,30,31];
%creates array storing days in each month
if nargin < 2 || nargin > 3
    error('idiot');
elseif nargin==2
    leap=false;
else
end
if leap==true
    dayinmonth(2)=29;
end
if da> dayinmonth(mo);
    error('are not that many days in the month');
end
%stores just the months that have passed

if mo==0;
    monthpass=0;
else
    monthpass=dayinmonth(1:mo-1);
end
nd=sum(monthpass)+da;
end
