# Vimrc

Este es mi conjunto de archivos de vimrc, con configuraciones por
archivo y cosas por el estilo.

### Instalación:
Soft link para cada uno de los siguientes archivos, ejemplo:
```bash
ln -s ./.vimrc $HOME/.vimrc
```

~/.vimrc \
~/.bin/online-search - Algún lugar de tu \$PATH \
~/.vim/functions.vim \
~/.vim/plugins.vim \
~/.vim/snippets-used/ \
~/.vim/colors/solarized.vim \
~/.vim/ftplugin/blade.vim \
~/.vim/ftplugin/gitcommit.vim \
~/.vim/ftplugin/haskell.vim \
~/.vim/ftplugin/make.vim \
~/.vim/ftplugin/php.vim \
~/.vim/ftplugin/tex.vim

Para instalar el [administrador de
plugins](https://github.com/junegunn/vim-plug) hacen falta estas dos líneas en
nuestra terminal:

```console
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Pronto haré un script para automatizar el vínculo de los archivos
:sweat_smile:
