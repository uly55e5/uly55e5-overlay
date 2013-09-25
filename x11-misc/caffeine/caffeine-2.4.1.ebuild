# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit distutils versionator

PYTHON_COMPAT=( python{2_7} )
MV=$(get_version_component_range 1-2)

DESCRIPTION="A status bar application to temporarily prevent activation screensaver and sleep mode."
HOMEPAGE="https://launchpad.net/caffeine"
SRC_URI="https://launchpad.net/caffeine/${MV}/${PV}/+download/${PN}_${PV}%2B419%7Eoneiric1.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/recipe-${PV}+419"

DEPEND=""
RDEPEND="${PYTHON_DEPS}
		 dev-python/pygtk
         dev-python/pygobject
		 dev-python/python-xlib"

