%Topography power

%Gain_normal = bst_gain_orient(lFF, Cortex.VertNormals);
%pow_n=sum(Gain_normal.^2, 1);
n=norm(gainopmn(:,1));
pow_n=sum(gainopmn.^2, 1);
hist(pow_n,50);

pow_t1 = sum(gainopmt1.^2, 1);
hist(pow_n./pow_t1,50);


% In order to visualize the Topography power in the cortex you shoud:
% 1. Simulate generic signal
% 2. Simulate recording from scout
% 3. Export the simulation to matlab
% 4. normalise the values f=pow_n/max(pow_n); -- simulation.ImageGridAmp=f';

% note that the opm all combination is computed like that: gaina = [gainopmn;gainopmt1;gainopmt2];

