# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_PV="131"

DESCRIPTION="A strong free UCI engine based on fruit."
HOMEPAGE="http://www.superchessengine.com/toga_ii.htm"
SRC_URI="http://www.superchessengine.com/Toga${MY_PV}.rar"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

S="${WORKDIR}/Toga${MY_PV}"

src_unpack() {
	/opt/bin/unrar x "${DISTDIR}/Toga${MY_PV}.rar"
}

src_compile() {
	cd "${S}/Distribute ${PV}/src"
	sed -ie "s/CXXFLAGS = -pipe/CXXFLAGS += -pipe/g" Makefile
	emake || die
}

src_install() {
	cd "${S}/Distribute ${PV}"
	newgamesbin src/fruit ${PN}
	dodoc  copying.txt readme.txt
	insinto ${GAMES_PREFIX}/${PN}
	newins "Toga II b105.bmp" Toga_II_b105.bmp 
	newins "Toga II b130.bmp" Toga_II_b130.bmp
	prepgamesdirs	
}

