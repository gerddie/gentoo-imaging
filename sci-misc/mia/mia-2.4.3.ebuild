# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="Library and tools for medical image processing"
HOMEPAGE="http://mia.sf.net/"
SRC_URI="mirror://sourceforge/mia/${P}.tar.xz"
RESTRICT="primaryuri"

IUSE="doc tbb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPENDS="app-arch/xz-utils
		 dev-python/lxml
		 doc ? (doxygen[dot,latex]
				media-gfx/graphviz
				dev-libs/libxslt)
		${RDEPENDS}
	"

RDEPENDS="dev-cpp/eigen
		  dev-cpp/libxmlpp
		  tbb? ( dev-cpp/tbb )
		  !tbb? ( sys-devel/gcc >= 5.3.0 )
		  dev-libs/boost
		  media-libs/libpng
		  media-libs/openexr
		  media-libs/tiff
		  sci-libs/dcmtk
		  sci-libs/fftw:3.0
		  sci-libs/gsl
		  sci-libs/gts
		  sci-libs/hdf5
		  sci-libs/itpp
		  sci-libs/maxflow
		  sci-libs/nifticlib
		  sci-libs/nlopt
		  sci-libs/vtk
		  virtual/blas
		  virtual/jpeg:62
		"

src_configure() {
	local mycmakeargs=(
		-DSTRICT_DEPENDECIES=TRUE
		-DMIA_CREATE_MANPAGES=ON
		-DMIA_CREATE_NIPYPE_INTERFACES=ON
	)

	if use doc; then
		mycmakeargs+=(
			-DALWAYS_CREATE_DOC=ON
		)
	else
		mycmakeargs+=(
			-DALWAYS_CREATE_DOC=OFF
		)
	fi
	if use tbb; then
		mycmakeargs+=(
			-DWITH_TBB=ON
		)
	else
		mycmakeargs+=(
			-DWITH_TBB=OFF
		)
	fi
	cmake-utils_src_configure
}
