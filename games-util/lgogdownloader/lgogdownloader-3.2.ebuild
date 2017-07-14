# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: lgogdownloader-2.4.ebuild,v 1.0 2013/04/28 10:15:41 by frostwork Exp $

EAPI=6

inherit eutils cmake-utils

DESCRIPTION="Linux compatible gog.com downloader"
HOMEPAGE="https://sites.google.com/site/gogdownloader/"
SRC_URI="https://sites.google.com/site/gogdownloader/${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/jsoncpp
		net-libs/liboauth
		net-misc/curl
		dev-libs/boost
		dev-libs/tinyxml2
		app-crypt/rhash
		dev-cpp/htmlcxx"
DEPEND="${RDEPEND}"

