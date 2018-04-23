function [L,U,P]=luFactor(A)
%A must be a n*n matrix, this function returns a pivot matrix P, a upper
%triangular matrix U, and a Lower triangular matrix L
P=eye(size(A));
L=eye(size(A));
[m,n]=size(A);
if nargin~= 1
    error('This function only accepts one input of a non-zero square matrix');
end
if m~=n
    error('This is not a square matrix; either to many variables or to many equations');
end
if zeros(size(A))==A
    error('This is an array of just Zeros not really a system of equations');
end
BigNum=0;
pivotrow=1;
storedrow=0;
storedident=0;
rowfactor=0;
rowtransverse=0;
factorstorage=0;
for k=1:1:m%colomn  
    %find which row we want to pivot
    rowtransverse=k;
    while rowtransverse<=m
        if abs(A(rowtransverse,k))>BigNum
            BigNum=abs((A(rowtransverse,k)));
            pivotrow=rowtransverse;
            storedrow=A(rowtransverse,:);
            storedident=P(rowtransverse,:);
            factorstorage=rowfactor;
        end
        rowtransverse=rowtransverse+1;
    end
    BigNum=0;
    rowtransverse=k;
    %swap those rows baby
    if storedrow~=A(k,:);
    A(pivotrow,:)=A(k,:);
    P(pivotrow,:)=P(k,:);
    A(k,:)=storedrow;
    P(k,:)=storedident;
    if k>1&&k~=m
        L(k+1,k-1)=L(k,k-1);
        L(k,k-1)=factorstorage;
    end
    end
    %now preform matrix subtraction  
            while rowtransverse<m
                rowfactor=(A(rowtransverse+1,k))/(A(k,k));
                if A(rowtransverse+1,k)~=0
                A(rowtransverse+1,:)=(A(rowtransverse+1,:))-(rowfactor*(A(k,:)));
                L(rowtransverse+1,k)=rowfactor;
                end
                rowtransverse=rowtransverse+1;
            end
end
    U=A;
