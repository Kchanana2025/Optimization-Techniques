%equations are x1+4x2=24,3x1+x2=21,x1+x2=9,x2>=0,x1>=0
A=[1,4;3,1;1,1;0,1;1,0];
B=[24;21;9;0;0];
x1=0:1:50; %0 to 50 integers with an interval of 1
x21=(B(1)-A(1,1)*x1)/A(1,2);% ye sari x2 ki hi values hain lekin 1st equation ki x21 second ki x22....
x22=(B(2)-A(2,1)*x1)/A(2,2);
x23=(B(3)-A(3,1)*x1)/A(3,2);
x21=max(x21,0);
x22=max(x22,0);
x23=max(x23,0);
plot(x1,x21,'r',x1,x22,'g',x1,x23,'b')
hold on
grid on
%till now we have plotted all the lines

P=[0;0]
index=0
m=length(A);% length(A) returns the length of the longer dimension of array A(row/column mein se jiska length zyada hoga wo return hoga)
for i=1:m
    for j=i+1:m
        asub=A([i,j],:)
        bsub=B([i,j])
        if(det(asub)~=0)
            x1=inv(asub)*bsub;
            plot(x1(1),x1(2),'*')%x1(1) aur x1(2) represent kr rhe hain  point of intersection between two lines .basically iss loop se hr 2 lines ka intersection point show ho jayega
            hold on%This command is used to retain the current plot while adding new plots to it. 
            P=[P,x1]%This line appends the new solution x1 to the matrix P. The matrix P is used to store all the intersection points found so far.
            index=index+1 %The variable index is incremented by 1. This variable is used to keep track of the number of intersection points found
            k(index,:)=x1 %entire row at the index-th position pe x1(intersection point) ko daal do
        end
    end
end
% ham basically wo points nikal rhe hain wo feasible region mein lie krte
% hai
pt = P'; % Transpose of matrix P
number = length(P); % Number of solutions found during the loop
index_feasible = 0; % Counter for feasible solutions
m = size(A); % Size of matrix A
asub = A([1:m-2],:); % Submatrix of A excluding the last two rows
bsub = B([1:m-2]); % Submatrix of B excluding the last two rows
for i=1:number
    if(pt(i,:)>=0)% we are checking that ki points positive hai na
        pt1=pt(i,:)
        pt1=pt1'
        if(asub*pt1-bsub<=0)% we are checking ki contraints satisfied hai na
            index_feasible=index_feasible+1;
            feasible(:,index_feasible)=pt1;%It's specifying that the new feasible solution should be added as a column in the feasible matrix
        end
    end
end
c=[2,5];
z=c*feasible;
maxima=max(z);%Finds the maximum objective function value among the feasible solutions.
index_pnts = find(z == maxima);% Finds the indices of the solutions that achieve the maximum objective function value.
optsol = feasible(:,index_pnts)% Extracts the optimal solution(s) corresponding to the maximum objective function value.
zopt = maxima% Stores the maximum objective function value in the variable zopt.

