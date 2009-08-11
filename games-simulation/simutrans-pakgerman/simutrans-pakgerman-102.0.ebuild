# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPV="0-102"

PAKNAME="pak.german"

DESCRIPTION="A free Transport Tycoon clone"

HOMEPAGE="http://simutrans.sourceforge.net/"

SRC_URI="http://dfn.dl.sourceforge.net/sourceforge/simutrans/pak.german_${MYPV}-0_full.zip
	http://simutrans-germany.com/pak.german/all_fixe_${MYPV}.zip
	http://simutrans-germany.com/pak.german/german_factory_${MYPV}-0a.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""

RDEPEND=">=games-simulation/simutrans-102.0-r1"

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	unpack pak.german_${MYPV}-0_full.zip
	unpack german_factory_${MYPV}-0a.zip
	cd ${S}/simutrans/${PAKNAME}
	unpack all_fixe_${MYPV}.zip
}

src_install() {
	cd ${S}
	local dir=${GAMES_PREFIX}/simutrans
	dodir ${dir}
	cp -R simutrans/* "${D}/${dir}/" || die "copy failed"
	prepgamesdirs
}
