# NixOS Configuration

This repository contains the NixOS configuration files for a personal system. It's structured to manage system configuration, user environments, and development setups through the NixOS and home-manager configurations.

## Structure Overview

- `flake.nix` - The central file defining system-wide configuration and package management.
- `hosts/` - Host-specific configurations.
  - `default/` - Default configuration for a typical NixOS host.
- `modules/` - Modular configurations for different system aspects.
  - `home-manager/` - User environment configurations using home-manager.
- `shells/` - Shell environment definitions.

## Getting Started

To use these configurations, you'll need to have NixOS installed on your system and optionally, home-manager for managing user profiles.

1. Clone this repository to your local system.
2. Place the contents under `~/nixos`.
3. Change the variables in `home.nix` and `configuration.nix` to match the name of your user.
4. Run `nixos-rebuild switch --flake ~/nixos#default` to apply the system configuration.

## Folder Structure

- `/hosts` - Contains host-specific NixOS configurations.
- `/modules` - Reusable modules for setting up various parts of the system.
- `/shells` - Provides shell environments for different use-cases, e.g., development shells.

Each subfolder contains `.nix` files which are individual Nix expressions for different aspects of the configuration. For example, `dotfiles.nix` would manage user dotfiles, while `work.nix` would contain configuration specific to a work environment.

## Contributing

Contributions are welcome! Please submit a pull request or create an issue if you have any suggestions or improvements.

## License

This project is open-source and available under the [MIT License](LICENSE).


