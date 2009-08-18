# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Databases with more than 1700k games for jose"
HOMEPAGE="http://jose-chess.sourceforge.net/index.html"
SRC_URI="http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/database-10k.jose
         http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/database-500k.jose
		 http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/database-1700k.jose"

S=${WORKDIR}

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_unpack() {
	return	
}
src_compile() {
	return
}

src_install(){
	insinto ${GAMES_PREFIX_OPT}/jose/extra
	doins ${DISTDIR}/database-10k.jose \
		  ${DISTDIR}/database-500k.jose \
		  ${DISTDIR}/database-1700k.jose
	prepgamesdirs
}

