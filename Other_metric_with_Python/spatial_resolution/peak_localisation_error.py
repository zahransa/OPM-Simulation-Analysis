import scipy.io
import numpy as np
import scipy.io as sio
mat = scipy.io.loadmat('resmat.mat')
resmat=mat['R']

resmat = np.absolute(resmat)

mat1 = scipy.io.loadmat('location.mat')
locations=mat1['location']



#'peak_err'(psf)
resmax = resmat.argmax(axis=0)  # find indices of maxima along columns
maxloc = locations[resmax, :]   # locations of maxima
diffloc = locations - maxloc    # diff btw true locs and maxima locs
locerr_peak_err_psf = np.sqrt(np.sum(diffloc ** 2, 1))
#'cog_err'(psf)
locerr_cog_err_psf = np.empty(locations.shape[0])  # initialise result array
for ii, rr in enumerate(locations):
 resvec = resmat[:, ii].T  # corresponding column of resmat
 cog = resvec.dot(locations) / np.sum(resvec)   # centre of gravity
 locerr_cog_err_psf[ii] = np.sqrt(np.sum((rr - cog) ** 2))  # Euclidean distance




#"'peak_err''ctf':

resmatctf = np.absolute(resmat)

resmatctf = resmatctf.T


resmaxctf = resmatctf.argmax(axis=0)  # find indices of maxima along columns
maxlocctf = locations[resmaxctf, :]   # locations of maxima
difflocctf = locations - maxlocctf    # diff btw true locs and maxima locs
locerr_peak_err_ctf = np.sqrt(np.sum(difflocctf ** 2, 1))
#'cog_err'(ctf)
locerr_cog_err_ctf = np.empty(locations.shape[0])  # initialise result array
for ii, rr in enumerate(locations):
 resvecctf = resmat[:, ii].T  # corresponding column of resmat
 cogctf = resvecctf.dot(locations) / np.sum(resvecctf)   # centre of gravity
 locerr_cog_err_ctf[ii] = np.sqrt(np.sum((rr - cogctf) ** 2))  # Euclidean distance




















sio.savemat('locerr_peak_err_psf.mat',{"locerr_peak_err_psf":locerr_peak_err_psf})
sio.savemat('locerr_cog_err_psf.mat',{"locerr_cog_err_psf":locerr_cog_err_psf})
sio.savemat('locerr_peak_err_ctf.mat',{"locerr_peak_err_ctf":locerr_peak_err_ctf})
sio.savemat('llocerr_cog_err_ctf.mat',{"locerr_cog_err_ctf":locerr_cog_err_ctf})

