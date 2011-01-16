# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/tuxonice-sources/tuxonice-sources-2.6.34.ebuild,v 1.1 2010/06/23 19:19:55 nelchael Exp $

ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_DEBLOB_AVAILABLE="0"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Kernel + TuxOnIce + Gentoo patchset + BFS + FTPro sources"
HOMEPAGE="http://dev.gentoo.org/~dsd/genpatches/ http://www.tuxonice.net
		 http://www.kernel.org/pub/linux/kernel/people/ck/patches/2.6/"
IUSE=""

TUXONICE_SNAPSHOT="0"
TUXONICE_VERSION="3.2-rc2"
TUXONICE_TARGET="2.6.37"


if [[ -n "${TUXONICE_SNAPSHOT}" ]]; then
	TUXONICE_SRC="current-tuxonice-for-${TUXONICE_TARGET}.patch_${TUXONICE_SNAPSHOT}"
else
	TUXONICE_SRC="tuxonice-${TUXONICE_VERSION}-for-${TUXONICE_TARGET}.patch"
fi

TUXONICE_URI="http://www.tuxonice.net/files/${TUXONICE_SRC}.bz2"


CK_VERSION="1"
CK_REVISION=""
K_SECURITY_UNSUPPORTED="1"

if [[ -z "${CK_REVISION}" ]]; then
	CK_URI="mirror://kernel/linux/kernel/people/ck/patches/2.6/${PV}/${PV}-ck${CK_VERSION}/patch-${PV}-ck${CK_VERSION}.bz2"
	UNIPATCH_LIST="${DISTDIR}/patch-${PV}-ck${CK_VERSION}.bz2"
else
	# This is ck${CK_VERSION} but resynced to apply cleanly
	# to stable kernel
	# release:
	CK_URI="mirror://gentoo/patch-${PV}-ck${CK_VERSION}-r${CK_REVISION}.bz2"
	UNIPATCH_LIST="${DISTDIR}/patch-${PV}-ck${CK_VERSION}-r${CK_REVISION}.bz2"
fi



UNIPATCH_LIST="${UNIPATCH_LIST}
			   ${DISTDIR}/${TUXONICE_SRC}.bz2
               ${FILESDIR}/fasttrackpro-${TUXONICE_TARGET}.patch"
UNIPATCH_STRICTORDER="yes"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${TUXONICE_URI} ${CK_URI}"

KEYWORDS="~amd64 ~x86"

RDEPEND="${RDEPEND}
		>=sys-apps/tuxonice-userui-1.0
		>=sys-power/hibernate-script-2.0"

K_EXTRAELOG="If there are issues with this kernel, please direct any
queries to the tuxonice-users mailing list:
http://lists.tuxonice.net/mailman/listinfo/tuxonice-users/"
K_SECURITY_UNSUPPORTED="1"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}
