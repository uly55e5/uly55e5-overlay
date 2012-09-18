# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_V="27"
DESCRIPTION="Winboard Chess engine."
HOMEPAGE="http://dshawul.googlepages.com/home"
SRC_URI="http://wbec-ridderkerk.nl/html/downloada/scorpio/${PN}-${MY_V}-ja.zip
		 http://wbec-ridderkerk.nl/html/downloada/scorpio/${PN}_book.rar"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

S=${WORKDIR}/${PN}-${MY_V}-ja

src_unpack() {
	unpack ${PN}-${MY_V}-ja.zip
	/opt/bin/unrar x "${DISTDIR}/${PN}_book.rar"
}

src_compile() {
	cd Src
	sed -ie "s/CFLAGS = -O3/CFLAGS += -O3/g" Makefile
	emake || die
}

src_install() {
	local dir=${GAMES_PREFIX}/${PN}
	insinto ${dir}
	exeinto ${dir}
	doins -r Linux/scorpio.ini Linux/log
	doins ${WORKDIR}/scorpio_book/book.dat
	doexe Src/scorpio
	dodoc license.txt readme.txt
	games_make_wrapper scorpio  ${dir}/scorpio ${dir}
	prepgamesdirs
}
