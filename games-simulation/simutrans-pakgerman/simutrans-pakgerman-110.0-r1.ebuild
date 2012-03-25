# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV="${PV/./-}"

PAKNAME="simupak-german64"

DESCRIPTION="A free Transport Tycoon clone"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="mirror://sourceforge/simutrans/pak.german/${PAKNAME}-${MYPV}c.zip
		mirror://sourceforge/simutrans/pak.german/${PAKNAME}-industry-${MYPV}.zip
		mirror://sourceforge/simutrans/pak.german/simutrans-german64-addons-${MYPV}.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RDEPEND=">=games-simulation/simutrans-102.2.2"

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_install() {
	cd ${S}
	local dir=${GAMES_PREFIX}/simutrans
	dodir ${dir}
	cp -R simutrans/* "${D}/${dir}/" || die "copy failed"
	prepgamesdirs
}
