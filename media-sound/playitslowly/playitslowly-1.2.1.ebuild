# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

DESCRIPTION="A software to play back audio files at a different speed or pitch."
HOMEPAGE="http://29a.ch/playitslowly/"
SRC_URI="http://29a.ch/playitslowly/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python
		>=dev-python/pygtk-2.10
        >=dev-python/gst-python-0.10
		>=media-libs/gstreamer-0.10
		>=media-plugins/gst-plugins-soundtouch-0.10"

RDEPEND="${DEPEND}"

src_compile()
{
	python setup.py build || die
}


src_install()
{
	dodoc README COPYING CHANGELOG
	python setup.py install --root=${D} || die
}
