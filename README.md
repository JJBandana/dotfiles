# dotfiles

Gestionados con [GNU stow](https://www.gnu.org/software/stow/). Cada carpeta es un
"paquete" que replica la estructura desde `~`, por ejemplo `waybar/.config/waybar/`.

## Instalar en una máquina nueva

```sh
git clone --recursive git@github.com:JJBandana/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow */          # o paquetes sueltos: stow hypr waybar zsh
```

## Agregar un programa nuevo

```sh
mkdir -p ~/.dotfiles/<prog>/.config
mv ~/.config/<prog> ~/.dotfiles/<prog>/.config/
cd ~/.dotfiles && stow <prog>   # crea ~/.config/<prog> -> .dotfiles/<prog>/.config/<prog>
```

Para archivos sueltos fuera de `.config` (ej. `~/.zshrc`) se replica la ruta: `zsh/.zshrc`.

## Útiles

- `stow -n -v <prog>`: simulacro, muestra qué haría sin tocar nada.
- `stow -R <prog>`: re-enlaza (si un programa reemplazó el symlink por un archivo).
- `stow -D <prog>`: quita los symlinks (los archivos quedan en el repo).

## Paquetes

| Paquete | Qué es |
|---|---|
| hypr | Hyprland, hypridle, hyprlock y el modo teclado de Claude (`claude-waybar.conf`) |
| waybar | Barra, con los módulos de sesiones y uso de Claude |
| claude | Script `claude-waybar` (`~/.local/bin`) y `~/.claude/settings.json` (hooks + statusLine) |
| alacritty, yazi, nvim, zsh | Terminal, gestor de archivos, editor, shell |
| walker, btop, lazygit, atuin, glow, zed | Launcher y herramientas varias |
| i3, picom, polybar, rofi | Setup anterior con X11 (sin enlazar) |
