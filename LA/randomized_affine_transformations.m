
% Randomized Affine Transformations: 

for N = [10 100 1000 10000 100000];
x = zeros(2,N);
x(:,1) = [0.5;0.5];
for k = 2:N;
r = rand;
if r<0.85, A1 = [.85 .04;-.04 .85], b1 = [0;1.6], A = A1, b = b1;
elseif r<0.92, A2 = [.2 -.26; .23 .22], b2 = [0;1.6], A = A2, b = b2;
else if r<0.99, A3 = [-.15 .28; .26 .24], b3 = [0;0.44], A = A3, b = b3;
    else A4 = [0 0; 0 .16], b4 = [0;0],A = A4, b = b4;
   
    end
end
x(:,k) = A*x(:,k-1)+b;
end
figure(N);
plot(x(1,:),x(2,:),'.', 'MarkerSize',1);
title(['N = ',num2str(N)]);
end


% Linear equations

main = 2.*(ones(1,10));
above_below = -1.*(ones(1,9));
A = diag(main) + diag(above_below,1) + diag(above_below,-1);
B = ones(10,1);
X1 = inv(A)*B;
X2 = A\B;

main2 = 2.*(ones(1,100));
above_below2 = -1.*(ones(1,99));
A2 = diag(main) + diag(above_below,1) + diag(above_below,-1);
B2 = ones(100,1);
[V,D] = eig(A2);
DD = diag(D);
stem(sort(DD));
title('Eigenvalue spectrum (scree plot)');
ymax = find(DD==max(DD));
ymin = find(DD==min(DD));
stem(V(:,ymax),'filled');
hold on
stem(V(:,ymin));
legend('vector of the largest eigen value','vectior of the smallest eigen value','Location','northoutside','Orientation','horizontal');
hold off
lessthan = sum(DD(:) < 0.2);
whos V
Vsparse = sparse(V);
whos Vsparse


