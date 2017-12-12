# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils

DESCRIPTION="A lightweight and fast raw image thumbnailer"
HOMEPAGE="https://github.com/erlendd/raw-thumbnailer"
SRC_URI="https://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND=">=media-libs/libopenraw-0.0.9[gtk]
	x11-libs/gtk+:2
	!media-gfx/gnome-raw-thumbnailer"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog )

src_prepare() {
	sed -i -e 's/libopenraw-1.0/libopenraw-0.1/g' ${S}/configure*
	sed -i -e 's/libopenraw-gnome-1.0/libopenraw-gnome-0.1/g' ${S}/configure*
	epatch_user
}
