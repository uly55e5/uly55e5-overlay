# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games eutils

DESCRIPTION="DreamChess is an open source chess game."
HOMEPAGE="http://www.dreamchess.org/"
SRC_URI="http://download.berlios.de/dreamchess/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -ie "s/\(LIBS=\"-lmxml \)/\1 -lpthread /g" configure
}

src_install() {
	emake DESTDIR=${D} install
	dodoc doc/*.txt
	doicon desktop/dreamchess.png
	domenu desktop/dreamchess.desktop
	prepgamesdirs
}
