#!/bin/bash
set -e


TMP_DIR=/tmp/lsp.tar.gz


echo "Downloading latest nvim-lspconfig to ${TMP_DIR}"
curl -L https://github.com/neovim/nvim-lspconfig/archive/refs/heads/master.tar.gz -o $TMP_DIR

echo "Extracting..."
tar xzf /tmp/lsp.tar.gz -C /tmp

echo "Updating nvim-12/lsp..."
rm -rf nvim-12/lsp
mv /tmp/nvim-lspconfig-master/lsp nvim-12/

echo "Cleaning up..."
rm -rf /tmp/nvim-lspconfig-master /tmp/lsp.tar.gz
echo "Run:"
echo "  git add nvim-12/lsp"
echo "  git commit -m 'Update lsp configs from nvim-lspconfig'"
