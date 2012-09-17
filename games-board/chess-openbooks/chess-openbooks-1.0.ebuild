# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Opening books for various chess engines."
HOMEPAGE="http://jose-chess.sourceforge.net/index.html"
SRC_URI="mirror://sourceforge/jose-chess/book_small.bin
		mirror://sourceforge/jose-chess/book.bin
		mirror://sourceforge/jose-chess/DCbook_large.zip
		mirror://sourceforge/jose-chess/Performance.bin
		mirror://sourceforge/jose-chess/Varied.bin"

S=${WORKDIR}

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_unpack() {
	unpack DCbook_large.zip
}
src_compile() {
	return
}

src_install(){
	insinto ${GAMES_PREFIX}/${PN}
	doins ${DISTDIR}/book_small.bin \
		  ${DISTDIR}/book.bin \
		  ${DISTDIR}/Performance.bin \
		  ${DISTDIR}/Varied.bin \
		  DCbook_large.bin
	prepgamesdirs
}

