# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

PAKNAME="pak128"

DESCRIPTION="Simutrans-Pakset with larger graphics"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="http://downloads.sourceforge.net/project/simutrans/pak128/pak128%20for%20102.0/pak128-1.4.5--${PV}.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RDEPEND=">=games-simulation/simutrans-102.0-r1"

RESTRICT="mirror"

S=${WORKDIR}

src_install() {
	cd ${S}
	local gamesdir=${GAMES_PREFIX}/simutrans
	dodir ${gamesdir}
	cp -R simutrans/* "${D}/${gamesdir}/" || die "copy failed"
	prepgamesdirs
}
