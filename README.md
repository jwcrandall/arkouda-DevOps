# Arkouda-DevOps: Notes for Joseph Crandalls Work on Arkouda

## Export and Source

In both chapel and arkouda directories
```bash
unset PYTHONPATH
```

To source the arkouda module, in order to connect to and arkouda_server,
and import arkouda into a jupyter notebook, run Bash command

```bash
export PYTHONPATH=$PYTHONPATH:~/Documents/professional/employment/2019/DOD/arkouda/
```
## Logging Execution Data

When starting arkouda_server run the following command

```python
./arkouda_server -nl 1 > ak.log
```

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

The Los Alamos National Lab [NetFlow] dataset with Network Event Data [field] types

[NetFlow]:https://csr.lanl.gov/data/netflow.html
[field]:https://csr.lanl.gov/data/2017.html

## Building Arkouda on a Mac

You may need to download a missing [SDK]

[SDK]:https://github.com/phracker/MacOSX-SDKs
