# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit distutils versionator

PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
MV=$(get_version_component_range 1-2)

DESCRIPTION="A status bar application to temporarily prevent activation screensaver and sleep mode."
HOMEPAGE="https://launchpad.net/caffeine"
SRC_URI="http://launchpad.net/caffeine/${MV}/${PV}/+download/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/gconf-python
         dev-python/notify-python
		 dev-python/python-xlib
		 x11-themes/gnome-icon-theme"

