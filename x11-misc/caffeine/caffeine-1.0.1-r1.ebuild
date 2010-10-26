# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A status bar application to temporarily prevent activation screensaver and sleep mode."
HOMEPAGE="https://launchpad.net/caffeine"
SRC_URI="http://launchpad.net/caffeine/1.0/1.0.1/+download/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/gconf-python
         dev-python/notify-python
		 dev-python/python-xlib"

