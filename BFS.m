%   Max z=2x1+3x2+4x3
%   s.t  2x1+3x2-x3+4x4=8
%        x1-2x1+6x3-7x4=-3
clc;
clear;
C=[2 3 4 7];
A=[2 3 -1 4;1 -2 6 -7];
B=[8;-3];
n=size(A,2);%no of variables
m=size(A,1);%no of equations
P=nchoosek(n,m);%nCm
q=nchoosek(1:n,m);%1 to n variables mein se koi bhi 2 choose kro aur q mein store kro
%1 2
%1 3
%1 4
%2 3
%2 4
%3 4
sol=[];
if n>m
    for i=1:P
        y=zeros(n,1);
        s=q(i,:);% ek ek krke q ki sabhi rows choose kr rhe hai hum
        t=A(:,s);%eg s=1 2 so t will have all rows where  column value is 1,2
        x=inv(t)*B;%hr type basic solution x mein store ho jayege aur non basic wali equation hamien maaam paper mein dengi nai
        if x>=0%feasibility check kr rhi hu
          y(s)=x;% s position pe x daal dia baki jagah pe 0
          sol=[sol y];%solutions store kr lie sare
        end
    end
else 
    error('eq larger than variables')
end

z=C*sol;
[r s]=max(z)%r will be maximum value and s will be its index
