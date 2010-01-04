# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit qt4 cmake-utils eutils

DESCRIPTION="Desktop Publishing (DTP) and Layout program for Linux."
HOMEPAGE="http://www.scribus.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="cairo cups debug spell +fontconfig xml gs python +imaging debug +podofo "

DEPEND="dev-libs/boost
	>=media-libs/freetype-2.3.7
	media-libs/jpeg
	>=media-libs/lcms-1.15
	media-libs/libpng
	>=media-libs/tiff-3.6
	sys-libs/zlib
	x11-libs/qt-core:4
	x11-libs/qt-gui:4
	x11-libs/qt-sql:4
	x11-libs/qt-xmlpatterns:4
	dev-util/pkgconfig
	cairo? ( >=x11-libs/cairo-1.4.10[X,svg] )
	cups? ( net-print/cups )
	spell? ( app-text/aspell )
	fontconfig? ( >=media-libs/fontconfig-2.0 )
	xml? ( >=dev-libs/libxml2-2.6.0 )
	gs? ( virtual/ghostscript )
	python? ( >=dev-lang/python-2.3 )
	imaging? ( dev-python/imaging )
	podofo? ( >=app-text/podofo-0.5.0 )"

src_prepare() {
	# Fix lib2geom relocation errors on amd64
	if use amd64 ; then
		epatch "${FILESDIR}/${PN}-1.3.5-fpic.patch"
	fi
}

src_configure() {
	mycmakeargs="${mycmakeargs}
		-DWANT_NORPATH=ON
		-D2GEOM_BUILD_SHARED=ON
		-DHAVE_CMS=ON
		-DHAVE_FONTCONFIG=ON
		-DHAVE_LIBZ=ON
		-DHAVE_TIFF=ON
		-DWANT_NORPATH=ON
		-DWANT_QTARTHUR=OFF
		-DWANT_QT3SUPPORT=OFF
		$(cmake-utils_use_has debug DEBUG )
		$(cmake-utils_use_has python PYTHON )
		$(cmake-utils_use_has spell ASPELL )
		$(cmake-utils_use_want cairo CAIRO )
		$(cmake-utils_use_want fontconfig FONTCONFIG )
		$(cmake-utils_use_want xml XML )
		$(cmake-utils_use_has podofo PODOFO ) "

	if use amd64 ; then
		mycmakeargs="${mycmakeargs} -DWANT_LIB64=ON"
	fi

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile || die "compile failed"
}

src_install() {
	cmake-utils_src_install

	domenu scribus.desktop
	doicon scribus/icons/scribus.png || die "doicon failed"
}
