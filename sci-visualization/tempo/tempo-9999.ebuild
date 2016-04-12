# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 qmake-utils

DESCRIPTION="TEMPO is a software for 3D visualization of brain electrical activity."
HOMEPAGE="https://github.com/asamardzic/tempo"
EGIT_REPO_URI="https://github.com/asamardzic/tempo"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtopengl:4
	media-libs/glu
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/add_glu_library.patch
}

src_configure() {
	eqmake4 tempo.pro
}
