# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils

DESCRIPTION="Qt based music player for SID music"
HOMEPAGE=""
SRC_URI="mirror://sourceforge/xsidplay2/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sidplay2 +sidplayfp sdl alsa"
DEPEND="sidplayfp? ( media-libs/libsidplayfp[static-libs] )
		sidplay2? ( media-libs/libsidplay:2[cia] 
					media-libs/resid
					media-libs/libsidplay:1 )
		sdl? ( media-libs/libsdl )
		alsa? ( media-libs/alsa-lib )
		dev-qt/qtgui
		dev-qt/qtsql
		kde-frameworks/kdelibs:4"

BUILD_DIR=${WORKDIR}/${P}/build

src_configure() {
	mycmakeargs=( 
		-DSID_WITH_SIDPLAY2=$(usex sidplay2)
		-DSID_WITH_SIDPLAYFP=$(usex sidplayfp)
	)
	cmake-utils_src_configure
}

