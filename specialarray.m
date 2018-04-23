function SA = specialarray(n,m);
%returns a specail array of n*m size
SA=zeros(n,m);
for a=1:n
    for b=1:m
        if a==1
            SA(a,b)=b;
        elseif b==1
            SA(a,b)=a;
        else
            SA(a,b)=SA(a-1,b)+SA(a,b-1);
        end
    end
end