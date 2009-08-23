# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-libmms/gst-plugins-libmms-0.10.11.ebuild,v 1.5 2009/05/20 16:32:45 armin76 Exp $

inherit gst-plugins-bad

KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=media-libs/gst-plugins-base-0.10.22
	>=media-libs/gstreamer-0.10.22
	>=media-libs/libsoundtouch-1.3.1"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
