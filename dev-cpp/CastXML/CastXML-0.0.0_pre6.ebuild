# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="CastXML is a C-family abstract syntax tree XML output tool."
HOMEPAGE="https://github.com/CastXML/CastXML"
SRC_URI="https://github.com/gerddie/CastXML/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPENDS="${RDEPENDS}
	"

RDEPENDS="dev-libs/glib:2
		  dev-libs/libxml2
		  sys-devel/llvm:4
	"

src_configure() {
	local mycmakeargs=(
		-DLLVM_DIR=/usr/lib/llvm/4/lib64/cmake/llvm/
		-DCLANG_RESOURCE_DIR=/usr/lib/clang/4.0.0
	)
	cmake-utils_src_configure
}
