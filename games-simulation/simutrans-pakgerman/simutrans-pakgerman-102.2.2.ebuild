# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV="0-102-2-2"

PAKNAME="pak.german"

DESCRIPTION="A free Transport Tycoon clone"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="http://dfn.dl.sourceforge.net/sourceforge/simutrans/pak.german_${MYPV}_full.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RDEPEND=">=games-simulation/simutrans-102.2.2"

RESTRICT="mirror"

S=${WORKDIR}


src_install() {
	cd ${S}
	local dir=${GAMES_PREFIX}/simutrans
	dodir ${dir}
	cp -R simutrans/* "${D}/${dir}/" || die "copy failed"
	prepgamesdirs
}
