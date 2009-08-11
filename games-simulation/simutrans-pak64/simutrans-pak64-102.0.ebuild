# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV="102-0"

PAKNAME="pak64"

DESCRIPTION="The main and a base set for Simutrans"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="http://downloads.sourceforge.net/project/simutrans/pak64/102-0/pak64-${MYPV}.zip"

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
