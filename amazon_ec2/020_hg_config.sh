#!/bin/bash

# install version control, mercurial
sudo aptitude install -y mercurial 
# mercurial suggest diff tool ( kdiff3 | tkdiff | meld | xxdiff )
# kdiff3 is depend on KDE, will install KDE about 300MB
# all these diff tools are GUI tools, no need install.
#sudo aptitude install -y xxdiff
# mercurial suggest gui commit tool
#sudo aptitude install -y qct
