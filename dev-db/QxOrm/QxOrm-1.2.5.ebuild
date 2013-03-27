# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2

DESCRIPTION="C++ library designed to provide Object Relational Mapping (ORM) feature."
HOMEPAGE="ihttp://www.qxorm.com"
SRC_URI="http://www.qxorm.com/version/${PN}_${PV}.zip"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc debug examples"

DEPEND="dev-libs/boost[debug?]
		 dev-qt/qtsql[debug?]
		 dev-qt/qtgui[debug?]
		 dev-qt/qtcore[debug?]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	eqmake4 PREFIX="/usr" || die
}

src_install() {
	qt4-r2_src_install
	dodoc changes.txt 
	if use doc; then
		dohtml -r ${S}/doc/* || die
	fi
	if use examples; then
		docinto examples
		dodoc -r ${S}/test/* || die
		docompress -x /usr/share/doc/${PF}/examples
	fi
	rm -r ${D}/usr/inl
}

