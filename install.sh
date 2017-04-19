export WONDIR=$(pwd)

[ -d ~/.emacs.d ] && grep -q WONFIG ~/.emacs.d/init.el || {
     mv ~/.emacs.d ~/.emacs.d-$$
     echo "your ~/.emacs.d has been moved to ~/.emacs.d-$$"
     ln -s $WONDIR/emacs ~/.emacs.d
}
     
grep -q WONFIG ~/.profile || {
    echo "##WONFIG" >> ~/.profile
    echo "export WONDIR=$WONDIR" >> ~/.profile
    echo ". $WONDIR/bash/won.sh" >> ~/.profile
}

