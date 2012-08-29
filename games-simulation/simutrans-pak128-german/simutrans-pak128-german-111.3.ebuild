# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV=""

PAKNAME="PAK128.german"

PAKV="0.4"
PAKR="r1206"

DESCRIPTION="Simutrans-Pakset with larger graphics"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="mirror://sourceforge/simutrans/${PAKNAME}/${PAKNAME}_${PAKV}_${PV}_${PAKR}.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RDEPEND=">=games-simulation/simutrans-111.3"

RESTRICT="mirror"

S=${WORKDIR}

src_install() {
	cd ${S}
	local gamesdir=${GAMES_PREFIX}/simutrans
	dodir ${gamesdir}
	cp -R simutrans/* "${D}/${gamesdir}/" || die "copy failed"
	prepgamesdirs
}
