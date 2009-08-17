# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils qt4

DESCRIPTION="An Esperanto dictionary (currently only German)"
SRC_URI="http://download.berlios.de/qvortaro/qvortaro-${PV}.tar.gz
		 dicts? ( http://download.berlios.de/qvortaro/ts_deeo.db.zip
		 		  http://download.berlios.de/qvortaro/ts_eode.db.zip )" 
HOMEPAGE="http://qvortaro.berlios.de"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="dicts"

DEPEND="x11-libs/qt-sql
		x11-libs/qt-gui
		x11-libs/qt-core"

S=${WORKDIR}/qvortaro-${PV}
src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/qvortaro-qt4.5.patch"
}
src_compile() {
	cd ${S}
	qmake || die "qmake failed"
	emake || die "emake failed"
}
src_install() {
	dobin qvortaro
	newicon  src/img/icon_16.png qvortaro.png
	make_desktop_entry qvortaro "qVortaro"
	if use dicts; then
		insinto /usr/share/qvortaro
		doins ../ts_deeo.db 
		doins ../ts_eode.db
	fi
}

pkg_postinst() {
	elog "More Dictionaries at http://qvortaro.berlios.de/lexika.php"
}
