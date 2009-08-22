# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A simple Linux Rock Guitar Amplifier for jack with one input and two outputs."
HOMEPAGE="http://sourceforge.net/projects/guitarix/"
SRC_URI="http://dfn.dl.sourceforge.net/sourceforge/guitarix/${P}-1.tar.bz2"

LICENSE="GPL-v2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-sound/jack-audio-connection-kit
	media-libs/libsndfile
	>=x11-libs/gtk+-2.15.0"

RDEPEND="${DEPEND}"

RESTRICT="mirror"

S="${WORKDIR}/${P}-1"

src_compile()
{
	cd ${S}
	./waf configure --prefix=/usr || die
	./waf build || die
}

src_install()
{
	cd ${S}
	DESTDIR="${D}" ./waf install
}
