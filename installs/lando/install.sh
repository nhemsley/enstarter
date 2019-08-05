[ ! -d ~/.lando ] && git clone git@github.com:nhemsley/lando.git ~/.lando
$(cd ~/.lando ; yarn)
$(cd ~/.lando/bin; ln -s lando.js lando)
