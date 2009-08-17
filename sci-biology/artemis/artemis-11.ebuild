# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="A free genome viewer in Java"

HOMEPAGE="http://www.sanger.ac.uk/Software/Artemis/"

SRC_URI="ftp://ftp.sanger.ac.uk/pub/pathogens/software/artemis/v${PV}/artemis_compiled_v${PV}.tar.gz"

LICENSE=""

SLOT="0"

KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jre-1.5"

DEPEND=""

S="${WORKDIR}/${PN}"

RESTRICT="mirror"

src_unpack() {
		unpack ${A}
}

src_install() {
	cd ${S}
	ARTDIR="/opt/${PN}"
	dodoc README
	insinto ${ARTDIR}
	doins -r *
	rm ${D}/${ARTDIR}/README
	dosym ${ARTDIR}/art /usr/bin/artemis
	dosym ${ARTDIR}/act /usr/bin/artemiscomp
	chmod a+x ${D}/${ARTDIR}/art ${D}/${ARTDIR}/act ${D}/${ARTDIR}/dnaplotter
	make_desktop_entry artemis Artemis ${ARTDIR}/images/icon.gif 'Science;Biology'
	make_desktop_entry artemiscomp ArtemisCompare ${ARTDIR}/images/icon.gif "Science;Biology"
}
