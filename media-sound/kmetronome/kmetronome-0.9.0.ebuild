# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit cmake-utils

DESCRIPTION="A Metronome for KDE"

HOMEPAGE="http://kmetronome.sourceforge.net/kmidimon/"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/kmetronome/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=kde-base/kdelibs-4*"
RDEPEND="$DEPEND"

RESTRICT="mirror"
