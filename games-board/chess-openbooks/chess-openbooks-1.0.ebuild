# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Opening books for various chess engines."
HOMEPAGE="http://jose-chess.sourceforge.net/index.html"
SRC_URI="http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/book_small.bin
		http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/book.bin
		http://internap.dl.sourceforge.net/sourceforge/jose-chess/DCbook_large.zip
		http://internap.dl.sourceforge.net/sourceforge/jose-chess/Performance.bin
		http://superb-east.dl.sourceforge.net/sourceforge/jose-chess/Varied.bin"

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

