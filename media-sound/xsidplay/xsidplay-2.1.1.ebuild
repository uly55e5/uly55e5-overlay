# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit eutils cmake-utils

DESCRIPTION="Qt based music player for SID music"
HOMEPAGE=""
SRC_URI="mirror://sourceforge/xsidplay2/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="x11-libs/qt:4
		media-libs/libsidplay:2"
S=${WORKDIR}/${PN}

src_unpack() {
	cd ${WORKDIR}
	/bin/tar -xf  ${DISTDIR}/${A} &> /dev/null
	cd ${S}
	sed -ie "3 alink_directories(/usr/lib/sidplay/builders)" CMakeLists.txt
}

#src_compile () {
#	cd ${S}
#	cmake ../
#	emake
#}
