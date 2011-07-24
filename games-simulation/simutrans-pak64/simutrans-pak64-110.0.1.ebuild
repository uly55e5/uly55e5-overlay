# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV="${PV/./-}"
MYPV="${MYPV/./-}"

PAKNAME="simupak64"

DESCRIPTION="The main and a base set for Simutrans"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="mirror://sourceforge/simutrans/pak64/${MYPV}/${PAKNAME}-${MYPV}.zip
	    mirror://sourceforge/simutrans/pak64/${MYPV}/${PAKNAME}-addon-food-${MYPV}.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RESTRICT="mirror"

RDEPEND=">=games-simulation/simutrans-102.0-r1"

S=${WORKDIR}

src_install() {
	cd ${S}
	local gamesdir=${GAMES_PREFIX}/simutrans
	dodir ${gamesdir}
	cp -R simutrans/* "${D}/${gamesdir}/" || die "copy failed"
	prepgamesdirs
}
