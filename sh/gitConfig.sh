#!/bin/bash 
# Global config.
 
read -p "User Name: "  USER
read -p "Email "  EMAIL
echo "#"
echo "Configurando git"

git config --global user.name "$USER"
git config --global user.email $EMAIL
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --list
