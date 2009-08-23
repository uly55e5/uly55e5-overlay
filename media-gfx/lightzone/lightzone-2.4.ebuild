# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Advanced non-destructive phot editor"
HOMEPAGE="http://www.lightcrafts.com/"
SRC_URI="LightZone-rev.8224.tar.gz"

LICENSE=""

SLOT="${PV}"

KEYWORDS="~amd64 ~x86"

IUSE="jre"

RESTRICT="fetch"

DEPEND=""
RDEPEND="!jre? ( virtual/jre )"

S=${WORKDIR}/LightZone

src_compile() {
	return
}

src_install () {
	into /opt
	cd ${S}
	if ! ( use jre ); then
		rm jre -r
	    cp ${FILESDIR}/lightzone-launcher ${S}
	    sed -ie "s/#LZPATH#/LightZone-${PV}/g" lightzone-launcher
	    exeinto /opt/bin
	    newexe lightzone-launcher LightZone-${PV}
		rm lightzone-launcher
	else
		dosym /opt/LightZone-${PV}/LightZone  /opt/bin/LightZone-${PV}
	fi
	dodir /opt/LightZone-${PV}
	cp * ${D}/opt/LightZone-${PV} -r
	newicon LightZone_32.png LightZone-${PV}.png
	make_desktop_entry "/opt/bin//LightZone-${PV}" "LightZone-${PV}" \
			"LightZone-${PV}.png" "Photography;Graphics"
}
