import matplotlib.pyplot as plt
from pandas import np
from scipy import linalg
import scipy.io

mat = scipy.io.loadmat('gainopmn.mat')
gain=mat["gainopmn"]

matt1 = scipy.io.loadmat('gainopmt1.mat')
gaint1=matt1["gainopmt1"]

matt2 = scipy.io.loadmat('gainopmt2.mat')
gaint2=matt2["gainopmt2"]

mata = scipy.io.loadmat('gaina.mat')
gaina=mata["gaina"]

mats = scipy.io.loadmat('gains.mat')
gains=mats["gains"]



n_sensors, n_dipoles = gaint1.shape
n_locations = n_dipoles // 3


smap2 = np.empty(n_locations)
smapt12 = np.empty(n_locations)
smapt22 = np.empty(n_locations)
smaps = np.empty(n_locations)
smapa = np.empty(n_locations)
for k in range(n_locations):
    gg = gain[:, 3 * k:3 * (k + 1)]
    ggt1 = gaint1[:, 3 * k:3 * (k + 1)]
    ggt2 = gaint2[:, 3 * k:3 * (k + 1)]
    gga = gaina[:, 3 * k:3 * (k + 1)]
    ggs = gains[:, 3 * k:3 * (k + 1)]
    s = linalg.svd(gg, full_matrices=False, compute_uv=False)
    st1 = linalg.svd(ggt1, full_matrices=False, compute_uv=False)
    st2 = linalg.svd(ggt2, full_matrices=False, compute_uv=False)
    sa = linalg.svd(gga, full_matrices=False, compute_uv=False)
    ss = linalg.svd(ggs, full_matrices=False, compute_uv=False)

    smap2[k] = s[2]
    smapt12[k] = st1[2]
    smapt22[k] = st2[2]
    smapa[k] = sa[2]
    smaps[k] = ss[2]




#smap2 /= np.max(smap2)
#smapt12 /= np.max(smapt12 )
#smapt22 /= np.max(smapt22 )
#smaps /= np.max(smaps)
#smapa /= np.max(smapa)

#plt.hist([smap2.ravel()], bins=20, color=['y'],label='OPMn')
#plt.hist([smapt12.ravel()], bins=20, color=['g'],label='OPMt1')
#plt.hist([smapt22.ravel()], bins=20, color=['m'],label='OPMt2')
plt.hist([smapa.ravel()], bins=20, color=['b'],label='OPMall')
plt.hist([smaps.ravel()], bins=20, color=['r'],label='SQUID')

plt.legend()
plt.axis([ -0.00001,0.00025, 0, 4000])
plt.title("λ3=λmin")
plt.xlabel('sensitivity')
plt.ylabel('count')
plt.show()