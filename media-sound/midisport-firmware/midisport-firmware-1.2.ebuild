# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils 

IUSE=""
DESCRIPTION="Midisport driver for midisport/oxygen"
HOMEPAGE=""
SRC_URI="http://downloads.sourceforge.net/project/usb-midi-fw/midisport-firmware/${PV}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#S="${WORKDIR}/${P}"

RESTRICT="mirror"

DEPEND="sys-fs/udev
	    sys-apps/fxload "

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/*.patch
}
src_compile() {
	cd ${S}
	econf || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README LICENSE
}
