# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils 

RESTRICT="mirror"

DESCRIPTION="extreme sound stretching of the audio"
HOMEPAGE="http://hypermammut.sourceforge.net/paulstretch"

SRC_URI="mirror://sourceforge/hypermammut/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"


IUSE="fftw"
DEPEND="media-libs/portaudio
		media-libs/audiofile
		media-libs/libmad
		media-libs/libvorbis
		>=x11-libs/fltk-1.1.7
		fftw? ( =sci-libs/fftw-3* )"

src_unpack()
{
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/MP3InputS.cpp.patch
}
src_compile() {
	outfile=paulstretch
	fluid -c GUI.fl || die "generate gui failed"
	if use fftw ;then
		./compile_linux_fftw.sh || die "compilation failed"
	else
		./compile_linux_kissfft.sh || die "compilation failed"
	fi
}

src_install() {
	dobin paulstretch
	dodoc readme.txt
}
