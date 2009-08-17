# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="The Uppsala Software factory files"

HOMEPAGE="http://xray.bmc.uu.se/usf/"


DOWNLOAD_URL=""
DAT_V="jul08"
SRC_URI="ftp://xray.bmc.uu.se/pub/gerard/dejavu/dejavu_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/rave/rave_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/voidoo/voidoo_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/xutil/xutil_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/spasm/spasm_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/sbin/sbin_linux.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/dejavu/dejavu_etc.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/voidoo/voidoo_etc.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/spasm/spasm_etc.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/xutil/xutil_etc.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/sbin/sbin_etc.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/rave/exam.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/extras/omac/omac.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/extras/symm/symm.tar.gz
	ftp://xray.bmc.uu.se/pub/gerard/dejavu/dejavu_100_${DAT_V}.lib.gz
	ftp://xray.bmc.uu.se/pub/gerard/dejavu/dejavu_25_${DAT_V}.lib.gz
	ftp://xray.bmc.uu.se/pub/gerard/spasm/rigor_${DAT_V}.lib.gz
	ftp://xray.bmc.uu.se/pub/gerard/extras/freebies/aconio/LX_ACONIO
	ftp://xray.bmc.uu.se/pub/gerard/spasm/spasm_100_${DAT_V}.lib.gz
	ftp://xray.bmc.uu.se/pub/gerard/spasm/spasm_25_${DAT_V}.lib.gz
	doc? ( ftp://xray.bmc.uu.se/pub/gerard/extras/freebies/aconio/aconio.man
	       ftp://xray.bmc.uu.se/pub/gerard/rave/rave_doc.tar.gz
	       ftp://xray.bmc.uu.se/pub/gerard/extras/html_manuals/manuals.tar.gz )
	"

LICENSE=""

SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="doc"

DEPEND="app-misc/mmv"

RDEPEND=""

S="${WORKDIR}"

RESTRICT="mirror"

USFDIR="/opt/usf"

src_unpack() {
	unpack ${A} 
	cp ${DISTDIR}/LX_ACONIO ${DISTDIR}/aconio.man ${S}
}

src_install() {
	cd ${S}
	dodir ${USFDIR}
	
	into /opt 
	dobin dejavu_linux/*
	dobin rave_linux/*
	dobin sbin_linux/*
	dobin spasm_linux/*
	dobin voidoo_linux/*
	dobin xutil_linux/*
	newbin LX_ACONIO aconio
	mmv "${D}/opt/bin/lx_*" "${D}/opt/bin/#1"
	sed -i -e 's~/nfs/public/lib/dejavu.may97~${USFDIR}/lib/dejavu_100_${DAT_V}.lib.gz~' dejavu_etc/dejavu_user.lib 
	
	insinto ${USFDIR}/lib
	doins dejavu_etc/*.lib dejavu_100_${DAT_V}.lib
	doins sbin_etc/*.lib
	doins spasm_etc/*.lib 
	doins spasm_100_${DAT_V}.lib 
	doins rigor_${DAT_V}.lib
	doins voidoo_etc/*.lib voidoo_etc/maprop.atypes voidoo_etc/maprop.charges voidoo_etc/maprop.polar voidoo_etc/maprop.radii
	doins xutil_etc/*.lib
	doins rave_doc/*.pdb
	
	insinto ${USFDIR}/omac
	doins dejavu_etc/make_sse
	doins rave_doc/*.csh
	doins omac/*
	
	insinto ${USFDIR}/osym
	doins symm/*
	
	dodoc dejavu_etc/*.doc
	dodoc rave_doc/*.doc
	dodoc xutil_etc/*.doc
	dodoc voidoo_etc/*.doc 
	dodoc spasm_etc/*.doc
	dodoc sbin_etc/*.txt
	
	insinto ${USFDIR}/rave-tutorial	
	doins -r exam/*
	
	if  use doc ;then
		dohtml -r manuals/*
		newman aconio.man aconio.1
	fi
	insinto /etc/env.d
	doins ${FILESDIR}/97usf
}
