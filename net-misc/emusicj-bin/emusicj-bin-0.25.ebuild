# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/portage/local/david/net-misc/emusicj-0.24.ebuild $

inherit eutils flag-o-matic

DESCRIPTION="Open source download manager for the eMusic.com music service"
HOMEPAGE="http://www.kallisti.net.nz/EMusicJ/HomePage"
SRC_URI="x86? (
		http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-i686-${PV}.tar.gz )
	amd64? ( 
		http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-x86_64-${PV}.tar.gz )"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.5"

src_compile() {
	return
}

src_install() {
	cd ${WORKDIR}/emusicj-linux
	exeinto /opt/emusicj
	doexe emusicj
	dodir /opt/emusicj/lib
	cp lib/* ${D}/opt/emusicj/lib/
	echo "cd /opt/emusicj; ./emusicj" > emusicj-start
	exeinto /opt/bin
	newexe emusicj-start emusicj
	doicon emusicj.xpm
	make_desktop_entry "/opt/bin/emusicj" "eMusic/J" "emusicj.xpm"\
	"Network;FileTransfer" "/opt/emusicj"
	dodoc COPYING README-emusicj.txt
}
