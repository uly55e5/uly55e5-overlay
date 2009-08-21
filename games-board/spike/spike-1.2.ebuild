# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="A Chess-engine using the Winboard or UCI protocol."
HOMEPAGE="http://spike.lazypics.de/index_en.html"
SRC_URI="http://spike.lazypics.de/downloads/Spike_12_linux.tar.gz"
S=${WORKDIR}

LICENSE="FREE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_compile() {
	return
}

src_install(){
	local dir=${GAMES_PREFIX_OPT}/${PN}
	dodoc Readme.txt
	insinto ${dir}
	doins Spike.cnfg spike.scb
	exeinto  ${dir}
	doexe spike
	games_make_wrapper spike ${dir}/spike ${dir} 
	prepgamesdirs
}

