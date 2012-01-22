# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Remove the markup tags from an HTML file"
HOMEPAGE="http://packages.debian.org/de/source/squeeze/unhtml"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/u/unhtml/${PN}_${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	cd ${S}
	emake || die "make failed"
}

src_install() {
	dobin unhtml
	doman unhtml.1
}
