# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit kde4-base

DESCRIPTION="A Metronome for KDE"

HOMEPAGE="http://kmetronome.sourceforge.net/kmidimon/"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/kmetronome/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=kde-base/kdelibs-4*
	>=media-libs/alsa-lib-1.0"

RDEPEND="$DEPEND"

RESTRICT="mirror"

mycmakeargs="-DHTML_INSTALL_DIR=/usr/share/doc/${PF}/html"

src_install() {
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO 
	kde4-base_src_install
}
