import h5py
import numpy as np
size = int(10e1)
for i in range(1,5):
    file = h5py.File('dset'+str(i)+'.h5','w')
    dataset = file.create_dataset("dset",(size,), h5py.h5t.STD_I32BE)
    print ("Dataset dataspace is", dataset.shape)
    print ("Dataset Numpy datatype is", dataset.dtype)
    print ("Dataset name is", dataset.name)
    print ("Dataset is a member of the group", dataset.parent)
    print ("Dataset was created in the file", dataset.file)
    file.close()
    file = h5py.File('dset'+str(i)+'.h5','r+')
    dataset = file['/dset']
    data = np.zeros(size)
    for j in range(size):
        data[j]= i*(j)
    print ("Writing data...")
    dataset[...] = data
    print ("Reading data back...")
    data_read = dataset[...]
    print ("Printing data...")
    print (data_read)
    file.close()
