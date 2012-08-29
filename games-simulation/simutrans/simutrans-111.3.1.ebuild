# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI="4"

inherit games

MYPV="${PV/./-}"
MYPV="${MYPV/./-}"

DESCRIPTION="A free Transport Tycoon clone"
HOMEPAGE="http://simutrans.sourceforge.net/"
SRC_URI="mirror://sourceforge/simutrans/simutrans/${MYPV}/simutrans-src-${MYPV}.zip
		 mirror://sourceforge/simutrans/simutrans/${MYPV}/simulinux-${MYPV}.zip"

LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE="allegro +sdl +pak64"

DEPEND="sys-libs/zlib
		media-libs/libpng
		sdl? (
			media-libs/libsdl
			media-libs/sdl-mixer )
		allegro? (
			media-libs/allegro )"

RESTRICT="mirror"

RDEPEND="pak64? (
			games-simulation/simutrans-pak64 )"

S=${WORKDIR}

pkg_setup() {
	if ! ( use sdl || use allegro ); then
		die "One backend sdl or allegro has to be enabled in USE flags!"
	fi
	if ( use sdl && use allegro ); then 
		die "Only one USE flag sdl or allegro should be set!"
	fi
}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/*.patch
}

src_compile() {
	cp config.template config.default
	sed -ie "s/#OSTYPE = linux/OSTYPE = linux/g" config.default
	sed -ie "s/#COLOUR_DEPTH = 16/COLOUR_DEPTH = 16/g" config.default
	sed -ie "s/#DEBUG = 3/DEBUG = 0/g" config.default
	if use sdl; then
		sed -ie "s/#BACKEND = mixer_sdl/BACKEND = mixer_sdl/g" config.default
	fi
	if use allegro; then
		sed -ie "s/#BACKEND = allegro/BACKEND = allegro/g" config.default
	fi
	sed -ie "s/FLAGS =/FLAGS = -DUSE_C /g" config.default
	emake || die "emake failed"
}

src_install() {
	local gamesdir=${GAMES_PREFIX}/${PN}
	games_make_wrapper ${PN} ./sim "${gamesdir}"
	rm ${PN}/${PN}
	exeinto ${gamesdir}
	doexe build/default/sim
	dodoc ${PN}/*.txt
	rm ${PN}/*.txt
	mv ${PN}/* "${D}/${gamesdir}/" || die "copy simutrans failed"
	find "${D}/${gamesdir}/"{text,font} -type f -print0 | xargs -0 chmod a-x
	
	prepgamesdirs
	doicon ${FILESDIR}/${PN}.png
	make_desktop_entry simutrans SimuTrans simutrans.png "Simulation;Game"
}
