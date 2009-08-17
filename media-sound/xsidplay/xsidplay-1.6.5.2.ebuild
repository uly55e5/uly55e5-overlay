# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="The SID-Player for X"
HOMEPAGE=""
SRC_URI="ftp://ftp.eenet.ee/pub/FreeBSD/distfiles/xsidplay-1.6.5.2.tgz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="arts esd"
DEPEND="x11-libs/qt:3
		<media-libs/libsidplay-2.1
		arts? ( kde-base/arts ) 
		esd? ( media-sound/esound )
		"
RESTRICT="mirror"

S="${WORKDIR}/${P}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/*.diff
}

src_compile() {
	cd ${S}
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	doicon xsidplay.xpm
	make DESTDIR=${D} install || die
	make_desktop_entry xsidplay xSIDPlay xsidplay.xpm "Player;Audio;AudioVideo"
}
