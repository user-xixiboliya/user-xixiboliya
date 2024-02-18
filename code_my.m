
%count=0
%for i=1:6
%    x=Test(:,i);
%    for j=1:6
%       count=count+1;
%        y=Test(:,j);
%       subplot(6,6,count)
%        scatter(x,y,5)
%   end
%end

%正态分布：
col=size(Test,2);
H=nan(1,6);
P=zeros(1,6)
for i =1:col
    [h,p]= jbtest(Test(:,i),0.05)
    H(i)=h
    P(i)=p
end
%% 
s1={'A','B','C','D','E','F','G','D','E','A','H','H'}
s2={'F','C','A','G','A','B','C','C','G','G','A','F'}
w=[6 3 6 4 14 3 5 4 8 3 5 3 ]
G1=graph(s1,s2,w)
p1=plot(G1,'EdgeLabel',w,'LineWidth',2)

[P,d]=shortestpath(G1,'D','H')
highlight(p1,P,'EdgeColor','red')

D=distances(G1)
D(1,2)
%% 
  times=300
  R=nan(times,1)
  K=nan(times,1)
 for i =1:times
     n=35
     x1=-10+rand(n,1)*20
     u1=rand(n,1)-normrnd(0.5,n,1)
     x2=0.3*x1+u1
     u=normrnd(0.1,n,1)
     y=0.5+2*x1+5*x2+u
     k=(n*sum(x1.*y)-sum(x1)*sum(y))/(n*sum(x1.*x1)-sum(x1)*sum(x1))
     K(i)=k
     u=x2+u
     r=corrcoef(x1,u)
     R(i)=r(2,1)
 end
 plot(R,K,'*')
 disp(r)
 %% 
 x=[9 9*1.01]
 y=6+9*log(x)
 (y(2)-y(1))/9

