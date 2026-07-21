# MOD Duo conectado via USB — cria perfil NetworkManager com IP estático.
# O dispositivo aparece como interface USB ethernet.
# O perfil garante que 192.168.51.2/24 seja aplicado automaticamente
# toda vez que o MOD Duo for plugado, sem precisar rodar nada manualmente.
# Interface web do MOD Duo: http://192.168.51.1
#
# IMPORTANTE: o nome da interface depende da porta USB usada.
# Para descobrir: plugue o MOD Duo e rode `ip link`.
# Procure uma interface nova (ex: enp0s29u1u2, usb0, etc.) e substitua abaixo.
# Use sempre a mesma porta USB para manter o nome consistente.
{ config, pkgs, ... }:

{
  networking.networkmanager.ensureProfiles.profiles = {
    "mod-duo" = {
      connection = {
        id             = "MOD Duo";
        type           = "ethernet";
        interface-name = "enp0s29u1u3";
        autoconnect    = "true";
      };
      ipv4 = {
        method   = "manual";
        address1 = "192.168.51.2/24";
      };
      ipv6 = {
        method = "ignore";
      };
    };
  };
}
