cost=[2 7 4;3 3 1;5 5 4;1 6 2];
supply=[5 8 7 14];
demand=[7 9 18];
[m,n]=size(cost); %% m is row  m is sources,n is destination
icost=cost;
x=zeros(m,n);
S=sum(supply)
D=sum(demand)


if(S==D)
    fprintf('balanced problem')

elseif(S<D)
    fprintf('unbalanced problem,add a dummy row');
    cost=[cost;zeros(1,n)];
    icost=cost
    supply=[supply D-S];

else(D<S)
    fprintf('unbalanced problem ,add a dummy column')
    cost=[cost;zeros(m,1)];
    icost=cost
    demand=[demand S-D];
end

for i=1:m
    for j=1:n
min_cost=min(cost(:))
[r,c]=find(min_cost==cost )
[r,c]
x11=min(supply(r),demand(c))

[val,index]=max(x11)
posrow=r(index)
poscol=c(index)

value=min(supply(posrow),demand(poscol))
x(posrow,poscol)=value
supply(posrow)=supply(posrow)-value
demand(poscol)=demand(poscol)-value
cost(posrow,poscol)=Inf
    end
end

icost
x
initalcost=sum(sum(icost.*x))
