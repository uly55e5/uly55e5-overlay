# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WANT_ANT_TASKS="ant-contrib"

inherit java-utils-2 java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="mirror://sourceforge/swingosc/${PV}/${P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEP="dev-java/jmf-bin"

DEPEND=">=virtual/jdk-1.4
		${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.4
		 ${COMMON_DEP}"

S=${WORKDIR}/SwingOSC


src_compile() {
	CLASSPATH="$(java-pkg_getjar jmf-bin jmf.jar)"
	ant clean jar
}

src_install() {
	java-pkg_dojar build/*.jar
	mkdir -p ${D}/usr/share/SuperCollider/Extensions
	cp -r SuperCollider/SCClassLibrary/SwingOSC ${D}/usr/share/SuperCollider/Extensions/
	mkdir -p ${D}/usr/share/SuperCollider/Help
	cp -r SuperCollider/Help/* ${D}/usr/share/SuperCollider/Help/
	mkdir -p ${D}/etc/env.d/
	echo "SwingOSC.program= ${D}/usr/share/SwingOSC/lib/SwingOSC.jar" > ${D}/etc/env.d/90SwingOSC
}
