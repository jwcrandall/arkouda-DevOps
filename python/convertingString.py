import numpy as np

#print(np.frombuffer(b'ABC', dtype=np.unit8))
string = "Hello World"

bytes1 = bytes(string,'utf-8')
print(type(bytes1))
print(bytes1)

bytes2 = string.encode()
print(type(bytes2))
print(bytes2)

for b1 in bytes1:
    print(b1, end=' ')

print()

for b2 in bytes2:
    print(b2, end=' ')
