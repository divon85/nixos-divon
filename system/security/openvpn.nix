{ pkgs, ... }:

{
  environment = {
    systemPackages = [ pkgs.openvpn ];
    etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  };
}
