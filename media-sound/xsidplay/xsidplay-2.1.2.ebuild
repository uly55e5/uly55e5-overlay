# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils cmake-utils

DESCRIPTION="Qt based music player for SID music"
HOMEPAGE=""
SRC_URI="mirror://sourceforge/xsidplay2/${P}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sidplay2 +sidplayfp sdl alsa"
DEPEND="sidplayfp? ( media-libs/libsidplayfp[static-libs,cia] )
		sidplay2? ( media-libs/libsidplay:2[cia] 
					media-libs/residi
					media-libs/libsidplay:1 )
		sdl? ( media-libs/libsdl )
		alsa? ( media-libs/alsa-lib )
		dev-qt/qtgui
		dev-qt/qtsql"
S=${WORKDIR}/${PN}

src_unpack() {
	cd ${WORKDIR}
	/bin/tar -xf  ${DISTDIR}/${A} &> /dev/null
	cd ${S}
	sed -ie "3 alink_directories(/usr/lib/sidplay/builders)" CMakeLists.txt
	sed -ie "s#/usr/local/include/sidplay/#/usr/include/sidplay/#g" CMakeLists.txt
	rm CMakeCache.txt
	rm Config.h
	rm src/Config.h
}

src_configure() {
	mycmakeargs=( 
		$(cmake-utils_use_with tsid)
		$(cmake-utils_use_with tsid2)
		$(cmake-utils_use_with sidplay1)
		$(cmake-utils_use_with sidplay2)
		$(cmake-utils_use_with sidplayfp)
	)
	cmake-utils_src_configure
}

