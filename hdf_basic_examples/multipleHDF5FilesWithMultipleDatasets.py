import h5py
import numpy as np
import random
for i in range(1,5):
    genericFileName = 'testData'
    file = h5py.File(genericFileName+str(i)+'.h5','w')
    for ds in range(0,2):
        if ds == 0:
            dset = "ij"
            size = random.randint(int(10e0),int(10e1))
        if ds == 1:
            dset = "ijrand"
            size = random.randint(int(10e0),int(10e1))
        dataset = file.create_dataset(dset,(size,), h5py.h5t.STD_I32BE)
        print ("Dataset dataspace is", dataset.shape)
        print ("Dataset Numpy datatype is", dataset.dtype)
        print ("Dataset name is", dataset.name)
        print ("Dataset is a member of the group", dataset.parent)
        print ("Dataset was created in the file", dataset.file)
        file.close()
        file = h5py.File(genericFileName+str(i)+'.h5','r+')
        dataset = file['/'+dset]
        data = np.zeros(size)
        for j in range(size):
            if ds == 0:
                data[j]= i*(j)
            if ds == 1:
                data[j]= i*(j)*random.uniform(0,1)
        print ("Writing data...")
        dataset[...] = data
        print ("Reading data back...")
        data_read = dataset[...]
        print ("Printing data...")
        print (data_read)
    file.close()
