# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2

DESCRIPTION="C++ library designed to provide Object Relational Mapping (ORM) feature."
HOMEPAGE="ihttp://www.qxorm.com"
SRC_URI="mirror://sourceforge/qxorm/QxOrm_1.2.4.zip"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="dev-libs/boost[debug?]
		 dev-qt/qtsql[debug?]
		 dev-qt/qtgui[debug?]
		 dev-qt/qtcore[debug?]"
RDEPEND="${DEPEND}"

HTML_DOCS="doc/"
S="${WORKDIR}/${PN}"

src_configure() {
	eqmake4 PREFIX="/usr"
}

