{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.initrd.kernelModules = [ "nvidia" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
}
