{ system ? builtins.currentSystem,
  config ? {},
  pkgs ? import ../.. { inherit system config; }
}:

let
  inherit (import ../lib/testing-python.nix { inherit system pkgs; }) makeTest;
  testCombinations = pkgs.lib.cartesianProductOfSets {
    predictable = [true false];
    withNetworkd = [true false];
  };
in pkgs.lib.listToAttrs (builtins.map ({ predictable, withNetworkd }: {
  name = pkgs.lib.optionalString (!predictable) "un" + "predictable"
       + pkgs.lib.optionalString withNetworkd "Networkd";
  value = makeTest {
    name = "${pkgs.lib.optionalString (!predictable) "un"}predictableInterfaceNames${pkgs.lib.optionalString withNetworkd "-with-networkd"}";
    meta = {};

    nodes.machine = { lib, ... }: {
      networking.usePredictableInterfaceNames = lib.mkForce predictable;
      networking.useNetworkd = withNetworkd;
      networking.dhcpcd.enable = !withNetworkd;
      networking.useDHCP = !withNetworkd;

      # Check if predictable interface names are working in stage-1
      boot.initrd.postDeviceCommands = ''
        ip link
        ip link show eth0 ${if predictable then "&&" else "||"} exit 1
      '';
    };

    testScript = ''
      print(machine.succeed("ip link"))
      machine.${if predictable then "fail" else "succeed"}("ip link show eth0")
    '';
  };
}) testCombinations)
