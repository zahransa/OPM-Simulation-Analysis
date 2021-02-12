import scipy.io
import numpy as np
import scipy.io as sio
mat = scipy.io.loadmat('resmat.mat')
resmat=mat['R']

resmat = np.absolute(resmat)

mat1 = scipy.io.loadmat('location.mat')
locations=mat1['location']



resmatctf = np.absolute(resmat)

resmatctf = resmatctf.T

maxamps = resmatctf.max(axis=0)  # maximum amplitudes per column
maxmaxamps = maxamps.max()  # global absolute maximum
relampp = maxamps / maxmaxamps

# ratio between sums of absolute amplitudes

sumamps = np.sum(resmatctf, axis=0)  # sum of amplitudes per column
sumampsmax = sumamps.max()  # maximum of summed amplitudes
relamps = sumamps / sumampsmax


sio.savemat('peak_amp_ctf.mat',{"peak_amp_ctf":relampp})
sio.savemat('sum_amp_ctf.mat',{"sum_amp_ctf":relamps })