# This Script modifies the necessaire files 
# to be able to compile enscript from source found on git://git.savannah.gnu.org
# Tested to be used after the commit of 2018-03-17
# Tested on Linux Arch, Linux Artix Artix
# Created by Wim Stockman - wim@thinkerwim.org - on 20230303

sed -i '/AC_FUNC_ALLOCA/a dnl its save to say that in 2023 all compilers support prototypes\nAC_DEFINE([PROTOTYPES], [1], [Define to 1 if your compiler supports function prototypes.])' configure.ac
sed -i '/AM_GNU_GETTEXT$/c AM_GNU_GETTEXT([external])' configure.ac
sed -i 's/intl\/Makefile//' configure.ac
sed -i 's/po\/Makefile.in//' configure.ac
sed -i 's/po\/Makefile//' configure.ac
sed -i 's/intl//' Makefile.am
sed -i '/include/a #include<langinfo.h>' src/util.c
gettextize 
aclocal -I m4
autoreconf --install

