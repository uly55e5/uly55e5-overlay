# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit toolchain-funcs multilib eutils

DESCRIPTION="A graphical multiple sequence alignment editor"
HOMEPAGE="http://pbil.univ-lyon1.fr/software/seaview.html"
SRC_URI="ftp://pbil.univ-lyon1.fr/pub/mol_phylogeny/seaview/seaview.tar.gz"
LICENSE="public-domain"

SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND="x11-libs/fltk
	media-libs/pdflib
	sci-biology/clustalw"

RESTRICT="mirror"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd ${S}

	sed -i \
		-e "s%\"seaview.help\", %\"/usr/share/${PN}/seaview.help\", %" seaview.cxx || die

	# Respect CXXFLAGS. Package uses CFLAGS as CXXFLAGS.
	# Fix invocation of C++ compiler.
	# Fix include and library paths.
	sed -i \
		-e 's:#FLTK:FLTK:' \
		-e 's:#IFLTK:IFLTK:' \
		-e 's:#LFLTK:LFLTK:' \
		-e "s:^CXX.*:CXX = $(tc-getCXX):" \
		-e 's:-I$(FLTK):-I/usr/include/fltk-1.1:' \
		-e 's:-I$(X11)/include:-I/usr/include/X11R6:' \
		-e "s:\(^CFLAGS .*\):\1 ${CXXFLAGS}:" \
		-e "s:-L\$(FLTK)/lib:-L/usr/$(get_libdir)/fltk-1.1:" \
		-e "s:-L\$(X11)/lib:-L/usr/$(get_libdir)/X11:" \
		Makefile || die
}

src_install() {
	doicon seaview.xpm
	dobin seaview
	dodoc seaview.html
	#insinto /usr/share/${PN}
	#doins protein.mase seaview.help
	make_desktop_entry seaview SeaView seaview.xpm "Science;Biology"
}
