# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Free chess engine."
HOMEPAGE="http://www.arasanchess.org/"
SRC_URI="http://www.arasanchess.org/${P}.tar.gz"

LICENSE="FREE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_compile() {
	cd src
	sed -ie "s/CFLAGS  = -Wall -march=native/CFLAGS  = ${CFLAGS}/g" Makefile
	emake || die
}

src_install() {
	dodoc doc/*
	cd src
	emake INSTALL=${D}/${GAMES_PREFIX} install || die
	games_make_wrapper arasan ${GAMES_PREFIX}/${P}/arasanx
	prepgamesdirs
}

