# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_PV="144"

DESCRIPTION="Chess database and frontend."

HOMEPAGE="http://jose-chess.sourceforge.net/index.html"

SRC_URI="http://prdownloads.sourceforge.net/jose-chess/${PN}-${MY_PV}-linux.zip
		textures?
			( http://superb-east.dl.sourceforge.net/sourceforge/jose-chess/bonus-textures.zip )	
		sounds? 
			( http://superb-west.dl.sourceforge.net/sourceforge/jose-chess/jose-sounds.zip )"

S=${WORKDIR}/${PN}

LICENSE="GPL"

SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="sounds textures engine"

DEPEND=""

RDEPEND="|| ( =virtual/jre-1.5*
			  =virtual/jre-1.4* )"

RESTRICT="mirror"

src_unpack() {
	unpack ${PN}-${MY_PV}-linux.zip || die
	cd ${S}
	if use textures; then
		unpack bonus-textures.zip || die
	fi
	if use sounds; then 
		unpack jose-sounds.zip || die
	fi
}

src_compile() {
	return
}

src_install(){
	local gamesdir=${GAMES_PREFIX_OPT}/${PN}
	cd ${S}
	if ! ( use engine ); then
		rm -r engines/*
	fi
	dohtml doc/*
	dodoc "LICENSE" "RELEASE NOTES"  "HISTORY"
	rm -r "doc"  "LICENSE" "RELEASE NOTES"  "HISTORY"
	insinto ${gamesdir}
	doins -r *  
	exeinto  ${gamesdir}
	doexe jose.sh
	games_make_wrapper jose ${gamesdir}/jose.sh ${gamesdir} 
	newicon images/jose128.png jose.png
	make_desktop_entry jose Jose jose.png "BoardGame;Game"
	prepgamesdirs
	chmod -R u+rwX,g+rwX,o-rwx \
		${D}/${gamesdir}/config \
		${D}/${gamesdir}/database
}

