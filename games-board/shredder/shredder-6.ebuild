# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Chess engine and frontend."
HOMEPAGE="http://www.shredderchess.de/linux.html"
SRC_URI="shrd6ct.tgz"

S=${WORKDIR}/Shredder6ct

RESTRICT="fetch"

LICENSE="Commercial"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""


src_compile() {
	return
}

src_install(){
	local dir=${GAMES_PREFIX_OPT}/${PN}
	insinto ${dir}
	doins -r * 
	exeinto  ${dir}
	doexe Shredder6ct 
	exeinto  ${dir}/engines
	doexe engines/Shredder6ctLinux
	games_make_wrapper  shredder ${dir}/Shredder6ct ${dir} 
	games_make_wrapper  shredder-engine ${dir}/engines/Shredder6ctLinux \
	        ${dir} 
	newicon images/logo_68_pix.png shredder.png
	make_desktop_entry /usr/games/bin/shredder Shredder shredder.png \
			"BoardGame;Game"
	prepgamesdirs
}

