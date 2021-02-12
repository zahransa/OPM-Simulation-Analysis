% STEPS:

% 1. Run Brainstorm
% 2. Create a new protocol
% 3. Import the subject anatomy (Go to the Download page of the brainstorm website, and download the file: sample_introduction.zip) -- Unzip it in a folder that is not in any of the Brainstorm folders (program folder or database folder).
% 4. Switch to the "functional data" view -- Right-click on the subject folder > Review raw file -- Select the file format: "MEG/EEG: CTF (*.ds...)" -- Select all the .ds folders in: sample_introduction/data
% 5. Load the channelmeg.mat in matlab then right click on CTF channels ->
% file -> import from matlab and choose channelmeg
% 6. Run 1_center_of_meg.m to get the center of each meg sensors
% 7. Export the scalp to the matlab then do: scalpp=scalp.Vertices;
% scalpnn=scalp.VertNormals; -- for ind = 1: 102 coiln(ind,:)=chmeg.Channel(ind).Orient(:,1); end
% 8. Run 2_CreateArraysFromSQUIDs.m (this script need ConstructRotationMatrix.m)
% 9. Run 3_creatopm.m, you will get ChOPMn, ChOPMt1, ChOPMt2
% 10. You can now run the 4_Plot_OPM to check the orientation of OPMs
% 11. Put them in a right structure so that you can load it in brainstorm: Chopmt1=chmeg; Chopmt1.Channel=ChOPMt1;
% 12. Right click on the channel --> Compute head model --> Cortex surface
% (OPENMEEG) -->  Export the headmodel to matlab.
% 13. The leadfield is always computed for 3 orientations at each point. To
% apply an orientation constraint to it, use bst_gain_orient.m: Gain_normal = bst_gain_orient(leadfield, Cortex.VertNormals);
% 14. Run 5_Topography_Power.m you can find on this script the steps to visualize the Topography power in the cortex 
% 16. To compute the total information you can run 6_Total_information.m
% 17. For Primary- and volume-current contributions we can do this with openmeeg https://openmeeg.github.io/tutorial.html#om-gain
% we would need to zero either of the matrices Source2MEGMat or Head2MEGMat
% see the note, read the matrix in matlab, put only zeros and save it back
% using om_xxx functions in brainstorm. To do so you can just add those 3
% lines: load(h2mmfile); linop = zeros(size(linop)); save(h2mmfile,
% 'linop'); to Primary- and volume-current/bst-openmeeg.m in line 474 --> For Primary- and volume-current contributions you can run Primary- and
% volume-current/TP_PV.m
% 18. Inorder to polt the topograpy for 3 dipole orientaion (2 tangential,
% radial): a) Compute a volume head model b) Simulate recordings from scouts Desikan-Killiany-BanksstsL) c) Compute sources d) Dipole
% modeling then Dipole scanning  (Sources > Dipoles scanning) Desikan-Killiany-BanksstsL --> Run Volume_dipole_orientation.m 
% 19. To compute the sensitivity map check: Other_metric_with_Python\Sensitivity_map_ahlfors.py
% 20. Compute spatial resolution metrics