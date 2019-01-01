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

7) When done, Ubuntu will want to "update" - let that happen, it will take another 20 to 30 minutes

8) Now is a good time to reconfig VM

   I have a reasonable desktop, an Intel i7 @ 4ghz, 12G of installed ram
   I set the CPU=3, and RAM=4GIG = plenty 
   key thing to remember, it's only you - not a gang of merry men and women on your machine.
   So ... when you are not using the VM close it - move the CPUs back of to Windows....
  
9)  For VM machines ...  I also do this:

   On windows, create a directory:  c:\linux
   You could put it in c:\users\yourname\linux
      
   I  also create a SHARED FOLDER on from Linux to Windows
   I make all Virtual machines use the SAME folder. It's simpler that way.

10) By some means - get this REPO onto your Ubuntu box

   Initially you can't use GIT ... Ubuntu 18 does not ship with GIT pre installed.
   You have these options:
   
   Option 1: manually install git, ie: 
   
   first: "sudo apt-get update"
   then:  "sudo apt-get install git"

   Option 2: Download a zip and unpack it.

   Option 3: You'll find a way.
   
   
  
