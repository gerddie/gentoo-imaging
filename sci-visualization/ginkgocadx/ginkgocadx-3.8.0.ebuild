# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils wxwidgets

DESCRIPTION="An advanced DICOM viewer and dicomizer"
HOMEPAGE="https://github.com/gerddie/ginkgocadx"
SRC_URI="https://github.com/gerddie/ginkgocadx/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"


LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=sci-libs/vtk-6.2[rendering]
	>=sci-libs/itk-4.8
	dev-db/sqlite
	dev-libs/openssl:0
	>=sci-libs/dcmtk-3.6.1_pre20150924
	>=x11-libs/wxGTK-3.0.1:3.0[opengl]
	x11-libs/gtk+:2
	!media-gfx/ginkgocadx
        "
RDEPEND="${DEPEND}"

pkg_setup() {
	[ `wx-config --release` = 3.0 ] || die "Pick wxwidgets-3.0 in 'eselect wxwidgets'"
}

src_prepare() {
	# clang++ fails otherwise
	sed -i -e 's#operator const std::string *() const#operator std::string () const#g' cadxcore/api/controllers/imodulecontroller.*
}
