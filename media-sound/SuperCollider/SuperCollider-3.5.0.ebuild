# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE="http://supercollider.sourceforge.net"
SRC_URI="mirror://sourceforge/supercollider/Source/${PV}/${P}-Source.tar.bz2"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt4 readline wiimote avahi emacs vim gedit doc"

DEPEND="media-sound/jack-audio-connection-kit
	    >=media-libs/libsndfile-1.0
		>=dev-util/cmake-2.8
		>=sci-libs/fftw-3.0
		x11-libs/libXt
		dev-libs/icu
		qt4? ( >=x11-libs/qt-gui-4.5
			   >=x11-libs/qt-webkit-4.5 )
	    readline? ( >=sys-libs/readline-5 )
		wiimote? ( app-misc/cwiid )
		gedit? ( app-editors/gedit )
		avahi? ( net-dns/avahi )
		vim? ( app-editors/vim 
               dev-lang/ruby )
		emacs? ( virtual/emacs )"

RDEPEND="${DEPEND}"

S="${WORKDIR}/SuperCollider-Source"

src_configure() {
	mycmakeargs=(
	   $(cmake-utils_use qt4 SC_QT)
	   $(cmake-utils_use wiimote SC_WII)
	   $(cmake-utils_use_no avahi AVAHI)
	   $(cmake-utils_use doc INSTALL_HELP)
	   $(cmake-utils_use emacs SC_EL)
	   $(cmake-utils_use gedit SC_ED)
	   $(cmake-utils_use vim SC_VIM)
	)

	cmake-utils_src_configure
}
