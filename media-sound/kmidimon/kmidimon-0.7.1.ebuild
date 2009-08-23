# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit kde4-base

IUSE=""

DESCRIPTION="MIDI monitor using ALSA sequencer and KDE user interface."

HOMEPAGE="http://kmetronome.sourceforge.net/kmidimon/"

SRC_URI="mirror://sourceforge/kmetronome/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"

RESTRICT="mirror"

RDEPEND=">=media-libs/alsa-lib-1.0
	=kde-base/kdelibs-4*"

DEPEND="${RDEPEND}"

mycmakeargs="-DHTML_INSTALL_DIR=/usr/share/doc/${PF}/html"

src_install() {
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO 
	kde4-base_src_install
}
