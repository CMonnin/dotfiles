#! /bin/bash

echo "Copying fastfetch configuration..."
cp -r ./fastfetch ~/.config/
echo "✓ Fastfetch configuration copied"

echo "Copying i3 configuration..."
cp -r ./i3 ~/.config/
echo "✓ i3 configuration copied"

echo "Copying nvim configuration..."
cp -r ./nvim ~/.config/
echo "✓ Neovim configuration copied"

echo "Copying picom configuration..."
cp -r ./picom/ ~/.config/
echo "✓ Picom configuration copied"

echo "Copying starship configuration..."
cp -r ./starship/starship.toml ~/.config/
echo "✓ Starship configuration copied"

echo "Copying wezterm configuration..."
cp ./wezterm/.wezterm.lua ~
echo "✓ Wezterm configuration copied"

echo "Change background (y/n)"
read answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
  echo "Please enter path"
  read image_path

  image_path="${image_path/#\~/$HOME}"

  if [ -f "$image_path" ]; then
    echo "exec --no-startup-id feh --bg-scale $image_path" >> ~/.zshrc
    echo "Background has been changed."
    echo "Source your .zshrc to apply the changes."
  else 
    echo "File does not exist."
    exit 1
  fi
else
  echo "No changes made."
fi

echo "Copying .zshrc configuration..."
cp ./zsh/.zshrc ~
echo "✓ .zshrc configuration copied"

echo "All configurations have been successfully copied!"
