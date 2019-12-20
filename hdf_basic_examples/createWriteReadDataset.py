#
# This examaple creates an HDF5 file dset.h5 and an empty datasets /dset in it.
#
import h5py
import numpy as np
#
# Create a new file using defaut properties.
#
file = h5py.File('dset.h5','w')
#
# Create a dataset under the Root group.
#
#dataset = file.create_dataset("dset",(100, 1), h5py.h5t.STD_I32BE)
dataset = file.create_dataset("dset",(100,), h5py.h5t.STD_I32BE)
print ("Dataset dataspace is", dataset.shape)
print ("Dataset Numpy datatype is", dataset.dtype)
print ("Dataset name is", dataset.name)
print ("Dataset is a member of the group", dataset.parent)
print ("Dataset was created in the file", dataset.file)
#
# Close the file before exiting
#
file.close()
#
# Open an existing file using default properties.
#
file = h5py.File('dset.h5','r+')
#
# Open "dset" dataset under the root group.
#
dataset = file['/dset']
#
# Initialize data object with 0.
#
#data = np.zeros((100,1))
data = np.zeros(100)

#
# Assign new values
#
#for i in range(100):
#    for j in range(1):
#        data[i][j]= i*1+j+1
for i in range(100):
    #for j in range(1):
    data[i]= i+1
#
# Write data
#
print ("Writing data...")
dataset[...] = data
#
# Read data back and print it.
#
print ("Reading data back...")
data_read = dataset[...]
print ("Printing data...")
print (data_read)
#
# Close the file before exiting
#
file.close()
