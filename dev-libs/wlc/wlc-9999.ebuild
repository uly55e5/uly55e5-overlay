# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Wayland compositor library"
HOMEPAGE="https://github.com/Cloudef/wlc"
SRC_URI=""


EGIT_REPO_URI=https://github.com/Cloudef/wlc.git

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="dbus systemd"

DEPEND="systemd? ( sys-apps/systemd )
        dbus?  ( sys-apps/dbus )
		>=dev-libs/wayland-1.7
		dev-libs/libinput"
RDEPEND="${DEPEND}"
