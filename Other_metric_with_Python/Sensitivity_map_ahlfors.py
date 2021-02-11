import matplotlib.pyplot as plt
from pandas import np
from scipy import linalg
import scipy.io

mat = scipy.io.loadmat('gainopmt2.mat')
gain=mat["gainopmt2"]


n_sensors, n_dipoles = gain.shape
n_locations = n_dipoles // 3

smap0 = np.empty(n_locations)
smap1 = np.empty(n_locations)
smap2 = np.empty(n_locations)
for k in range(n_locations):
    gg = gain[:, 3 * k:3 * (k + 1)]
    s = linalg.svd(gg, full_matrices=False, compute_uv=False)
    smap0[k] = s[0]
    smap1[k] = s[1]
    smap2[k] = s[2]

#scipy.io.savemat('sena0.mat', mdict={'sena0': smap0})
#scipy.io.savemat('sena1.mat', mdict={'sena1': smap1})
#scipy.io.savemat('sena2.mat', mdict={'sena2': smap2})
#smap0 /= np.max(smap0)
#smap1 /= np.max(smap1 )
#smap2 /= np.max(smap2 )


plt.hist([smap0.ravel()], bins=20, color=['g'],label='λ1=λmax')
plt.hist([smap1.ravel()], bins=20, color=['m'],label='λ2=λ')
plt.hist([smap2.ravel()], bins=20, color=['y'],label='λ3=λmin')
plt.legend()

plt.axis([ -0.00001,0.00025, 0, 8000])

plt.title("OPMt2")
plt.xlabel('sensitivity')
plt.ylabel('count')
plt.show()
#plt.xlim(0,0.00025)
