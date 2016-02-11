# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="i3-compatible window manager for Wayland"
HOMEPAGE="http://swaywm.org/"
SRC_URI=""

EGIT_REPO_URI=https://github.com/SirCmpwn/sway.git

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/wayland-1.7
		dev-libs/wlc"

RDEPEND="${DEPEND}"
