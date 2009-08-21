# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_V="22"
DESCRIPTION="Winboard Chess engine."
HOMEPAGE="http://dshawul.googlepages.com/home"
SRC_URI="http://wbec-ridderkerk.nl/html/downloada/scorpio/${PN}_${MY_V}.zip
		 http://wbec-ridderkerk.nl/html/downloada/scorpio/${PN}_book.rar"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

S=${WORKDIR}/${PN}_${MY_V}

src_unpack() {
	unpack ${PN}_${MY_V}.zip
	/opt/bin/unrar x "${DISTDIR}/${PN}_book.rar"
}

src_compile() {
	cd src
	sed -ie "s/CFLAGS = -O3/CFLAGS += -O3/g" Makefile
	emake || die
}

src_install() {
	local dir=${GAMES_PREFIX}/${PN}
	insinto ${dir}
	exeinto ${dir}
	doins -r scorpio.ini personality log
	doins ${WORKDIR}/scorpio_book/book.dat
	doexe src/scorpio
	dodoc liscense.txt readme.txt
	games_make_wrapper scorpio  ${dir}/scorpio ${dir}
	prepgamesdirs
}
