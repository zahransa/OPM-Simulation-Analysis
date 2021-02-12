%ple psf
%export gain
%export cortex
%export source

Gain_normal = bst_gain_orient(gain.Gain, cortecs.VertNormals);
R = ss.ImagingKernel * Gain_normal;
ar=abs(R);
location=cortecs.Vertices*.100;
[M,I] = max(ar); %find indices of maxima along columns
maxloc = location(I, :)%locations of maxima
diffloc = location - maxloc; %btw true locs and maxima locs
 for i=1:length(diffloc)% locerr = np.sqrt(np.sum(diffloc ** 2, 1)) 
D(i)  = sqrt(sum((location(i,:) - maxloc(i,:)) .^ 2));
 end
s.ImageGridAmp=D';



%ctf psf

Gain_normal = bst_gain_orient(gain.Gain, cortecs.VertNormals);
R = ss.ImagingKernel * Gain_normal;
R=R';
ar=abs(R);
location=cortecs.Vertices*.100;
[M,I] = max(ar); %find indices of maxima along columns
maxloc = location(I, :)%locations of maxima
diffloc = location - maxloc; %btw true locs and maxima locs
 for i=1:length(diffloc)% locerr = np.sqrt(np.sum(diffloc ** 2, 1)) 
D(i)  = sqrt(sum((location(i,:) - maxloc(i,:)) .^ 2));
 end
s.ImageGridAmp=D';


% centre of gravity (psf)
for i=1:15002
resvec = ar(:, i)';
end
C = dot(resvec,location)
% centre of gravity (ctf)