import scipy.io

import matplotlib.pyplot as plt
from pandas import np
from scipy import linalg
import scipy.io



mat1 = scipy.io.loadmat('power1.mat')
pn=mat1["pow_a_n"]

mat2 = scipy.io.loadmat('power1.mat')
pt1=mat2["pow_t1_n"]

mat3 = scipy.io.loadmat('power1.mat')
pt2=mat3["pow_t2_n"]

mat4 = scipy.io.loadmat('power1.mat')
ps=mat4["pow_meg_n"]

mat5 = scipy.io.loadmat('power1.mat')
pa=mat5["pow_a_n"]



plt.hist([pn.ravel()], bins=20, color=['y'],label='OPMn')
plt.hist([pt1.ravel()], bins=20, color=['g'],label='OPMt1')
plt.hist([pt2.ravel()], bins=20, color=['m'],label='OPMt2')
plt.hist([ps.ravel()], bins=20, color=['b'],label='SQUID')
#plt.hist([pa.ravel()], bins=20, color=['r'],label='OPMall')

plt.legend()

plt.title("Signal power")
plt.xlabel('Power')
plt.ylabel('count')
plt.show()