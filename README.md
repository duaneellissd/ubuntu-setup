# ubuntu-setup
scripts for configuring a ubuntu machine they way I like it setup
generally the use case is:  Embedded (ARM CortexM3) SW development, Python, Etc.

Requried 
    assuming vm machine running on windows 10
    Vmware player
    ubuntu 18 iso image
 
 Should work(not tried yet)
    MAC running Parallels
  

1) Click Create new VM

2) Choose ISO image

3) Enter your username and password.
 Simplify your life: Your vm password should be password.
 Why? Well if somebody has already logged into your windows machine... 
 What good is the vm password?

4) Change configuration setting to 4GIG ram

5) DO NOT - I repeat DO NOT change the Number of CPUs - leave it at 1.
(The installer crashes if the N_CPUS != 1)

6) Start the install process - about 20 to 30 minutes depending on host system

7) When done, Ubuntu will want to "update" - let that happen.



  
