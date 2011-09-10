# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_PV="22"

DESCRIPTION="Free Chess engine."
HOMEPAGE="http://www.glaurungchess.com/"
SRC_URI="http://www.glaurungchess.com/glaurung${MY_PV}.zip
	http://www.glaurungchess.com/g2book.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

S=${WORKDIR}/${PN}${MY_PV}

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -ie "/#include <iostream>/ a\#include <cstdio>" src/main.cpp
}

src_compile() {
	cd ${S}/src
	sed -ie "s/CXXFLAGS =/CXXFLAGS +=/g" Makefile
	LDFLAGS="" emake  || die
}

src_install() {
	dodoc *.txt
	dogamesbin src/glaurung
	insinto ${GAMES_DATADIR}/${PN}
	doins ../Book.bin
	prepgamesdirs
}
