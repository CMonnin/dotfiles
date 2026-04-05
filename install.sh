#! /bin/bash

echo "Copying fastfetch configuration..."
cp -r ./fastfetch ~/.config/
echo "✓ Fastfetch configuration copied"

echo "Removing current nvim config..."
rm -rf ~/.config/nvim/
echo "Copying nvim configuration..."
cp -r ./nvim ~/.config/
echo "✓ Neovim configuration copied"

echo "Copying alacritty configuration..."
cp -r ./alacritty ~/.config/
echo "✓ alacritty configuration copied"

echo "Copying picom configuration..."
cp -r ./picom/ ~/.config/
echo "✓ Picom configuration copied"

echo "Copying bspwm configuration..."
cp -r ./bspwm ~/.config/
echo "✓ bspwm configuration copied"

echo "Copying sxhkd configuration..."
cp -r ./sxhkd ~/.config/
echo "✓ sxhkd configuration copied"

echo "Copying polybar configuration..."
cp -r ./polybar ~/.config/
echo "✓ polybar configuration copied"

echo "Copying .bashrc configuration..."
cp ./bash/bashrc ~/.bashrc
echo "✓ .bashrc configuration copied"

echo "Sourcing .bashrc"
source ~/.bashrc

echo "All configurations have been successfully copied!"
