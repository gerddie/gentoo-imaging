# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="Library and tools for medical image processing"
HOMEPAGE="http://mia.sf.net/"
SRC_URI="mirror://sourceforge/mia/${P}.tar.xz"
RESTRICT="primaryuri"

IUSE="doc itpp tbb +vtk"

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
		  dev-cpp/libxml2
		  tbb? ( dev-cpp/tbb )
		  !tbb? ( >=sys-devel/gcc )
		  dev-libs/boost
		  sci-libs/fftw:3.0
		  sci-libs/gsl
		  media-libs/libpng
		  media-libs/openexr
		  media-libs/tiff
		  sci-libs/dcmtk
		  sci-libs/gts
		  sci-libs/hdf5
		  itpp? ( sci-libs/itpp )
		  sci-libs/maxflow
		  sci-libs/nifticlib
		  sci-libs/nlopt
		  vtk? ( sci-libs/vtk )
		  virtual/blas
		  virtual/jpeg:62
		"

src_configure() {
	local mycmakeargs=(
		-DSTRICT_DEPENDECIES=TRUE
		-DMIA_CREATE_MANPAGES=ON
		-DMIA_CREATE_NIPYPE_INTERFACES=ON
		-DALWAYS_CREATE_DOC=$(usex doc)
		-DWITH_ITPP=$(usex itpp)
		-DWITH_TBB=$(usex tbb)
		-DWITH_VTKIO=$(usex vtk)
	)

	cmake-utils_src_configure
}
