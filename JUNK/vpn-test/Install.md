You'll need to configure X11 forwarding from the container to the Windows host in order to display the GUI. This involves installing an X server on Windows and setting some environment variables.

Install VcXsrv which is a popular open-source X server for Windows: https://sourceforge.net/projects/vcxsrv/

Set the DISPLAY environment variable in the Docker container to point to the IP/port of the Xserver on host: