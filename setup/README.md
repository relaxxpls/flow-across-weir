# Installation  
#### *Windows 10 users only*  

1. Go to [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and follow the *manual instruction* steps presented there.  

2. Check if you've succesfully installed WSL, and make sure your using WSL 2, i.e. `wsl -l -v`  on cmd should show:  
```
  NAME      STATE           VERSION  
* Ubuntu    Running         2  
```
or something similar, just that VERSION should be 2.  
*All instructions henceforth should be followed on the Linux (Ubuntu) terminal*

3. Install OpenFOAM 8:
```Shell
sudo sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
sudo add-apt-repository http://dl.openfoam.org/ubuntu
sudo apt-get update
sudo apt-get install openfoam8
```

4. User configuration (required *only once*):  
You need to setup commands for using OpenFOAM and ensure that the DISPLAY element is setup correctly.  
```Shell
echo ". /opt/openfoam8/etc/bashrc" >> $HOME/.bashrc
echo "export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"" >> $HOME/.bashrc
echo "export LIBGL_ALWAYS_INDIRECT=1" >> $HOME/.bashrc
```

5. Source the bashrc file (*This step needs to be repeaated everytime you open a new terminal window!*):  
`source $HOME/.bashrc` can be used, or alternatively `. $HOME/.bashrc` would work.  
Lazy? Update the terminal's startup file to include bashrc by default!
```Shell
echo "source "$HOME/.bashrc"" >> $HOME/.profile
```

6. Hate the VGA font and want some GUI? Too Bad, WSL dosen't support that *yet*.  
An alternative is a Virtual Display ([VcXsrv](https://sourceforge.net/projects/vcxsrv/) or [Xming](https://sourceforge.net/projects/xming/)).  
Install using default settings.  
*This step needs to be followed before you want to open any GUI software (Firefox, ParaView, gedit, etc.)*  
Start up XLaunch, and select `One large window`, keep clicking next until you encounter this screen:  
![Enable "Disable Access Control" hehe :)](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/201596iBCB2B8DA889830E0/image-size/large?v=1.0&px=999)  
Make sure to select `Disable Access Control`. 
7. You can now freely run any GUI, and it will launch via your Virtual Display.  
Lazy? Create a [XLaunch Shortcut](https://siliconheaven.info/xlaunch-configuration-file/#gsc.tab=0)  
PS: *Make sure that XLaunch is running and before calling any Linux GUI Apps on Windows Desktop environment.*  

References : [1](https://openfoam.org/download/windows-10/) [2](https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242) 
