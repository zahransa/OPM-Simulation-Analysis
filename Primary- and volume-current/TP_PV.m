
%T=P+V

megv=megt.Gain - megp.Gain;
opmnv=opmnt.Gain - opmnp.Gain;
opmt1v=opmt1t.Gain - opmt1p.Gain;
opmt2v=opmt2t.Gain - opmt2p.Gain;


Tmegx=sqrt(sum(megt.Gain.^2, 1));
Pmegx=sqrt(sum(megp.Gain.^2, 1));
Vmegx=sqrt(sum(megv.^2, 1));
TPmegx=Tmegx./Pmegx;
meanTPmegx=mean(TPmegx);
PVmegx=Pmegx./Vmegx;
meanPVmegx=mean(PVmegx);

Topmnx=sqrt(sum(opmnt.Gain.^2, 1));
Popmnx=sqrt(sum(opmnp.Gain.^2, 1));
Vopmnx=sqrt(sum(opmnv.^2, 1));
TPopmnx=Topmnx./Popmnx;
meanTPopmnx=mean(TPopmnx);
PVopmnx=Popmnx./Vopmnx;
meanPVopmnx=mean(PVopmnx);

Topmt1x=sqrt(sum(opmt1t.Gain.^2, 1));
Popmt1x=sqrt(sum(opmt1p.Gain.^2, 1));
Vopmt1x=sqrt(sum(opmt1v.^2, 1));
TPopmt1x=Topmt1x./Popmt1x;
meanTPopmt1x=mean(TPopmt1x);
PVopmt1x=Popmt1x./Vopmt1x;
meanPVopmt1x=mean(PVopmt1x);

Topmt2x=sqrt(sum(opmt2t.Gain.^2, 1));
Popmt2x=sqrt(sum(opmt2p.Gain.^2, 1));
Vopmt2x=sqrt(sum(opmt2v.^2, 1));
TPopmt2x=Topmt2x./Popmt2x;
meanTPopmt2x=mean(TPopmt2x);
PVopmt2x=Popmt2x./Vopmt2x;
meanPVopmt2x=mean(PVopmt2x);

