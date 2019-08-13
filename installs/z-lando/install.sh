[ ! -d ~/.lando ] && git clone https://github.com/lando/lando.git ~/.lando
$(cd ~/.lando ; yarn)
$(cd ~/.lando/bin; ln -s lando.js lando)
