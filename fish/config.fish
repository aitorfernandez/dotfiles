set -gx EDITOR vim
set -g theme_color_scheme nord
set -x BAT_THEME Nord

source $HOME/.config/fish/conf.d/settings.fish

if status is-interactive
  # Commands to run in interactive sessions can go here

  set -gx ATUIN_NOBIND "true"
  atuin init fish | source
  bind \cr _atuin_search
end

# path
# https://fishshell.com/docs/current/tutorial.html#path-example
# fish_add_path $HOME/.cargo/bin
