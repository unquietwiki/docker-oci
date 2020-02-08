# Unofficial container for Areca's RAID controller web-server
#
# Areca's website is at https://www.areca.com.tw/
#
# Michael Adams; unquietwiki@gmail.com; Feb 7, 2020
#
# VERSION        1
#

# ldd says the following libraries are needed...
# linux-vdso.so.1 =>  (0x00007ffca4f9f000) = Provided by Kernel
# libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f1281c79000) = libc6
# libstdc++.so.6 => /lib64/libstdc++.so.6 (0x00007f1281972000) = libstdc++
# libm.so.6 => /lib64/libm.so.6 (0x00007f1281670000) = libc6
# libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f128145a000) = libgcc
# libc.so.6 => /lib64/libc.so.6 (0x00007f128108d000) = libc6
# /lib64/ld-linux-x86-64.so.2 (0x00007f1281e95000) = libc6

# The port number it asks for on the command line; the web interface shows on the next available port.
# Cfg Assistant : port from config file / command line
# Controller[1](PCI) : next available TCP port

FROM debian:stable-slim
EXPOSE 81-82/tcp
ADD archttp64 /usr/local/bin/archttp64
ADD archttpsrv.conf /usr/local/bin/archttpsrv.conf
RUN chmod 555 /usr/local/bin/archttp64 \
    && chmod 666 /usr/local/bin/archttpsrv.conf
WORKDIR /usr/local/bin
ENTRYPOINT [ "archttp64" ]
