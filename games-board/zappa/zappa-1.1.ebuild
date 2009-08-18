# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_V="11"

DESCRIPTION="Zappa is a chess engine, or a program that plays chess."
HOMEPAGE="https://netfiles.uiuc.edu/acozzie2/www/zappa/"
SRC_URI="https://netfiles.uiuc.edu/acozzie2/www/zappa/${PN}_${MY_V}_all.zip"

S=${WORKDIR}

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="mirror"

src_unpack() {
	unpack ${A} || die
	cd ${S}
	if use x86; then
		local arch="32"
	elif use amd64; then
		local arch="64"
	fi
	unzip ${PN}_${MY_V}_linux_${arch}.zip || die
}

src_compile() {
	return
}

src_install(){
	local dir=${GAMES_PREFIX_OPT}/${PN}
	insinto ${dir}
	doins zappa.ini
	exeinto  ${dir}
	doexe zappa
	games_make_wrapper  zappa ${dir}/zappa ${dir} 
	prepgamesdirs
}

