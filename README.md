# Arkouda-DevOps: NumPy-like arrays at massive scale backed by Chapel.
## _REMEMBER_: this is not yet open source software... we are currently seeking approval to open source Arkouda

## Building Arkouda

Simply run `make` to build `arkouda_server.chpl`.

If your environment requires non-system paths to find dependencies (e.g.,
[Anaconda]), append each path to a new file `Makefile.paths` like so:

```make
# Makefile.paths

# Custom Anaconda environment for Arkouda
$(eval $(call add-path,/home/user/anaconda3/envs/arkouda))
#                      ^ Note: No space after comma.
```

The `chpl` compiler will be executed with `-I`, `-L` and an `-rpath` to each
path.

[Anaconda]: https://www.anaconda.com/distribution/

## Running arkouda_server

 * startup the arkouda_server
 * defaults to port 5555
```bash
./arkouda_server -nl 1
```
 * config var on the commandline
 * --v=true/false to turn on/off verbose messages from server
 * --ServerPort=5555
 * or you could run it this way if you don't want as many messages
and a different port to be used
```bash
./arkouda_server -nl 1 --ServerPort=5555 --v=false
```
 * in the same directory in a different terminal window
 * run the ak_test.py python3 program
 * this program just does a couple things and calls shutdown for the server
 * edit the server and port in the script to something other than the
default if you ran the server on a different server or port
```bash
./ak_test.py
```
or
```bash
python3 ak_test.py
```
or
```bash
./ak_test.py localhost 5555
```
 * This also works fine from a jupyter notebook
 * there is an included Jupyter notebook called test_arkouda.ipynb

## Data for Development and Testing
<<<<<<< HEAD
The [Los Alamos National Lab NetFlow] dataset
=======
The Los Alamos National Lab [NetFlow] dataset with Network Event Data [field] types

[NetFlow]:https://csr.lanl.gov/data/netflow.html
[field]:https://csr.lanl.gov/data/2017.html
>>>>>>> 12e6e96e49fa4ad09a20100de667bf140d84008a

## Building Arkouda on a Mac

You may need to download a missing [SDK]

[SDK]:https://github.com/phracker/MacOSX-SDKs
