%Topography power

%Gain_normal = bst_gain_orient(lFF, Cortex.VertNormals);
%pow_n=sum(Gain_normal.^2, 1);
n=norm(gainopmn(:,1));
pow_n=sum(gainopmn.^2, 1);
hist(pow_n,50);

pow_t1 = sum(gainopmt1.^2, 1);
hist(pow_n./pow_t1,50);