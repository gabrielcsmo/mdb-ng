reset 100
# this is a comment
erase
program
verify
    ; this is a comment 2
lock
    // this is a comment 3
read
file demo.bin
target  ATSAME54P20A
list
serial 1
clock 48000
size 1024
fuse wv,*,fuses.bin
