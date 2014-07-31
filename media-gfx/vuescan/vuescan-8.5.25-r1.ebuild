# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils 


MY_PV="85"

DESCRIPTION="A powerful, easy to use scan program"
HOMEPAGE="http://www.hamrick.com/index.html"
SRC_URI="http://www.hamrick.com/files/vuesca${MY_PV}.tgz"

LICENSE="Vuescan_License"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="x11-libs/libICE[abi_x86_32(-)]
		dev-libs/libusb-compat[abi_x86_32(-)]
		x11-libs/libSM[abi_x86_32(-)]"
RDEPEND=""

RESTRICT="fetch"

S=${WORKDIR}/VueScan
src_compile() {
	return
}

src_install() {
	insinto /opt/${PN}
	doins vuescan.dat vuescan.bmp
	exeinto /opt/${PN}
	doexe vuescan
	make_wrapper vuescan /opt/vuescan/vuescan
	dodoc vuescan.bmp vuescan.htm
	dosym /usr/share/doc/${PF}/html /opt/vuescan/html
	dosym /usr/share/doc/${PF}/vuescan.htm /opt/vuescan/vuescan.htm
	make_desktop_entry vuescan VueScan vuescan.bmp \
			"Scanning;Graphics;2DGraphics"
}
