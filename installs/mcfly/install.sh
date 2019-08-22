[[ ! -d ~/.installs/mcfly ]] && git clone https://github.com/cantino/mcfly ~/.installs/mcfly
$(cd ~/.installs/mcfly; cargo install --path .)
