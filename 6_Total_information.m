%q2 is the source variance and s2 is the noise varience
q2 = (10e-9)^2
s2 = (6e-15)^2;
SNR_n = q2*pow_n/(102*s2);
hist(SNR_n,50);
%k is signal covariance
Kt1 = (q2/1000)*gainopmt1*gainopmt1';
Kt2 = (q2/1000)*gainopmt2*gainopmt2';
Kn = (q2/1000)*gainopmn*gainopmn';

%S is noise covarince
S = s2*eye(size(gainopmt1,1));


en = eig(Kn);
et1 = eig(Kt1);
et2 = eig(Kt2);
%plot(e)

TIn = .5*sum(log2(en/s2+1));
TIt1 = .5*sum(log2(et1/s2+1));
TIt2 = .5*sum(log2(et2/s2+1));


semilogy(en); hold on;
semilogy(et1)
semilogy(et2)

semilogy(en/s2)
%en/s2 -> SNR of the orthogonal channels
%en/s2 -> SNR of the orthogonal channels of the normal OPM