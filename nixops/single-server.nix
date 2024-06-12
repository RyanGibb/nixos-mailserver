{
  network.description = "mail server";

  mailserver =
    { config, pkgs, ... }:
    {
        imports = [
            ../default.nix
        ];

        mailserver = {
          enable = true;
          fqdn = "mail.example.com";
          domains = [ "example.com" "example2.com" ];
          loginAccounts = {
              "user1@example.com" = {
                  password = "password";
              };
          };
          extraVirtualAliases = {
              "info@example.com" = "user1@example.com";
              "postmaster@example.com" = "user1@example.com";
              "abuse@example.com" = "user1@example.com";
              "user1@example2.com" = "user1@example.com";
              "info@example2.com" = "user1@example.com";
              "postmaster@example2.com" = "user1@example.com";
              "abuse@example2.com" = "user1@example.com";
          };
        };
    };
}
