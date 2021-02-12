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
resmax = resmatctf.argmax(axis=0)
#  if metric == 'sd_ext':   spatial deviation as in Molins et al. ctf

widthsdctf = np.empty(len(resmax))
widthsd50ctf = np.empty(len(resmax))

threshold = 0.5

for ii in range(locations.shape[0]):
  diffloc = locations - locations[ii, :]  # locs w/r/t true source
  locerr = np.sum(diffloc**2, 1)  # squared Eucl dists to true source
  resvec = resmatctf[:, ii]**2       # pick current row
  # spatial deviation (Molins et al, NI 2008, eq. 12)
  widthsdctf[ii] = np.sqrt(np.sum(np.multiply(locerr, resvec)) /
                                np.sum(resvec))

# elif metric == 'maxrad_ext': maximum radius to 50% of max amplitude ctf

maxamp = resmatctf.max(axis=0)  # peak ampl. per location across columns
for ii, amps in enumerate(maxamp):  # for all locations
  resvec = resmatctf[:, ii]  # pick current column
  # indices of elements with values larger than fraction threshold
            # of peak amplitude
  thresh_idx = np.where(resvec > threshold * amps)
            # get distances for those indices from true source position
  locs_thresh = locations[thresh_idx, :] - locations[ii, :]
            # get maximum distance
  widthsd50ctf[ii] = np.sqrt(np.sum(locs_thresh**2, 1).max())

sio.savemat('widthsdctf.mat', {"widthsdctf": widthsdctf})
sio.savemat('widthsd50ctf.mat', {"widthsd50ctf": widthsd50ctf})