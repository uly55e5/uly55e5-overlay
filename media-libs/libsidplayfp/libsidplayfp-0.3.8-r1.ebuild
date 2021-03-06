# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libsidplayfp/libsidplayfp-0.3.8.ebuild,v 1.1 2012/12/16 16:09:02 ssuominen Exp $

EAPI=5
inherit eutils

DESCRIPTION="A library for the sidplay2 fork with resid-fp"
HOMEPAGE="http://sourceforge.net/projects/sidplay-residfp/"
SRC_URI="mirror://sourceforge/sidplay-residfp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs cia"

DOCS=( AUTHORS NEWS README TODO )

src_prepare() {
	if use cia; then
		epatch ${FILESDIR}/cia1.patch || die 
		epatch ${FILESDIR}/resid.patch || die
	fi
	# fix automagic. warning: modifying .ac triggers maintainer mode.
	sed -i -e 's:doxygen:dIsAbLe&:' configure || die
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	dosym ./ /usr/include/sidplayfp/builders/resid 
	dosym ./ /usr/include/sidplayfp/builders/residfp 
	prune_libtool_files
}
