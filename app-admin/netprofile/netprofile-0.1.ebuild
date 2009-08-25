# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A simple net profile switcher"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install()
{
	exeinto /etc/init.d
	doexe ${FILESDIR}/netprofile
	insinto /etc/conf.d
	doins ${FILESDIR}/netprofile-files.example

}

