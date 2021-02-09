% get original square vertices
cmeg=chmeg.Channel(1).Loc;
% S1=cmeg(:,1);
% S2=cmeg(:,2);
aa = 0.01;
%aa = norm(S2-S1);
% S3=cmeg(:,3);
% S4=cmeg(:,4);
% X=[S1(1), S2(1), S3(1), S4(1)];
% Y=[S1(2), S2(2), S3(2), S4(2)];
% Z=[S1(3), S2(3), S3(3), S4(3)];
% e=mean(X);
% f=mean(Y);
% g=mean(Z);

% % plot the original square
% figure
% plot3(e, f, g, '*');
% grid on;
% axis equal;
% hold on
% plot3(X, Y, Z, 'k-');

t1t2S1 = zeros(102, 3);
t1t2S2 = zeros(102, 3);
t1t2S3 = zeros(102, 3);
t1t2S4 = zeros(102, 3);
t1nS1 = zeros(102, 3);
t1nS2 = zeros(102, 3);
t1nS3 = zeros(102, 3);
t1nS4 = zeros(102, 3);
t2nS1 = zeros(102, 3);
t2nS2 = zeros(102, 3);
t2nS3 = zeros(102, 3);
t2nS4 = zeros(102, 3);

ChOPMn = chmeg.Channel;
ChOPMt1 = chmeg.Channel;
ChOPMt2 = chmeg.Channel;

for indChannel = 1:102

% prepare to calculate new squares
v = OPMp(indChannel,:);
tt1 = OPMtt1(indChannel,:);
tt2 = OPMtt2(indChannel,:);
nn = OPMnn(indChannel,:);

vectT2 = tt2*(aa/2)*norm(tt2);
vectT1 = tt1*(aa/2)*norm(tt1);
vectN = nn*(aa/2)*norm(nn);

% calculate the t1t2 square
t1t2S1(indChannel, :)= v + vectT1 + vectT2;
t1t2S2(indChannel, :)= v - vectT1 + vectT2;
t1t2S3(indChannel, :)= v - vectT1 - vectT2;
t1t2S4(indChannel, :)= v + vectT1 - vectT2;

ChOPMn(indChannel).Loc = [t1t2S1(indChannel, :)', t1t2S2(indChannel, :)', t1t2S4(indChannel, :)', t1t2S3(indChannel, :)'];
ChOPMn(indChannel).Orient = nn' * [1 1 1 1];

% t1t2X=[t1t2S1(1), t1t2S2(1), t1t2S3(1), t1t2S4(1), t1t2S1(1)];
% t1t2Y=[t1t2S1(2), t1t2S2(2), t1t2S3(2), t1t2S4(2), t1t2S1(2)];
% t1t2Z=[t1t2S1(3), t1t2S2(3), t1t2S3(3), t1t2S4(3), t1t2S1(3)];

% calculate the t1n square
t1nS1(indChannel, :)= v + vectT1 + 2*vectN;
t1nS2(indChannel, :)= v - vectT1 + 2*vectN;
t1nS3(indChannel, :)= v - vectT1;
t1nS4(indChannel, :)= v + vectT1;
% t1nS1(indChannel, :)= v + vectT1 + vectN;
% t1nS2(indChannel, :)= v - vectT1 + vectN;
% t1nS3(indChannel, :)= v - vectT1 - vectN;
% t1nS4(indChannel, :)= v + vectT1 - vectN;

ChOPMt2(indChannel).Loc = [t1nS1(indChannel, :)', t1nS2(indChannel, :)', t1nS4(indChannel, :)', t1nS3(indChannel, :)'];
ChOPMt2(indChannel).Orient = tt2' * [1 1 1 1];

% t1nX=[t1nS1(1), t1nS2(1), t1nS3(1), t1nS4(1), t1nS1(1)];
% t1nY=[t1nS1(2), t1nS2(2), t1nS3(2), t1nS4(2), t1nS1(2)];
% t1nZ=[t1nS1(3), t1nS2(3), t1nS3(3), t1nS4(3), t1nS1(3)];

% calculate the t2n square 
t2nS1(indChannel, :)= v + vectT2 + 2*vectN;
t2nS2(indChannel, :)= v - vectT2 + 2*vectN;
t2nS3(indChannel, :)= v - vectT2;
t2nS4(indChannel, :)= v + vectT2;
% t2nS1(indChannel, :)= v + vectT2 + vectN;
% t2nS2(indChannel, :)= v - vectT2 + vectN;
% t2nS3(indChannel, :)= v - vectT2 - vectN;
% t2nS4(indChannel, :)= v + vectT2 - vectN;

ChOPMt1(indChannel).Loc = [t2nS1(indChannel, :)', t2nS2(indChannel, :)', t2nS4(indChannel, :)', t2nS3(indChannel, :)'];
ChOPMt1(indChannel).Orient = tt1' * [1 1 1 1];

% t2nX=[t2nS1(1), t2nS2(1), t2nS3(1), t2nS4(1), t2nS1(1)];
% t2nY=[t2nS1(2), t2nS2(2), t2nS3(2), t2nS4(2), t2nS1(2)];
% t2nZ=[t2nS1(3), t2nS2(3), t2nS3(3), t2nS4(3), t2nS1(3)];

% % plot squares
% plot3(v(1), v(2), v(3), '*');
% plot3(t1t2X, t1t2Y, t1t2Z, 'r-');
% plot3(t1nX, t1nY, t1nZ, 'g-');
% plot3(t2nX, t2nY, t2nZ, 'b-');

end


