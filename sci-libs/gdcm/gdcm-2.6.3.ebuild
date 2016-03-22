# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="GDCM is an implementation of the DICOM standard."
HOMEPAGE="http://gdcm.sourceforge.net/"
SRC_URI="mirror://sourceforge/gdcm/${P}.tar.bz2"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc"

RDEPEND="sci-libs/vtk
	app-text/poppler
	dev-libs/libxml2
	dev-libs/expat
	dev-libs/json-c
	dev-libs/openssl:0
	net-libs/socket++
	media-libs/openjpeg:0
	media-libs/charls
	sys-libs/zlib
	"

DEPEND="app-arch/xz-utils
	doc? ( app-doc/doxygen )
	app-text/docbook-xsl-ns-stylesheets
	dev-libs/libxslt
	${RDEPEND}
"
PATCHES=(
	"${FILESDIR}"/dcm_group2_buggyfiles_fallback.patch
)

src_configure() {
		local mycmakeargs=(
		-DGDCM_DOXYGEN_NO_FOOTER:BOOL=ON \
				-DGDCM_BUILD_APPLICATIONS:BOOL=ON \
				-DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
				-DGDCM_USE_PVRG:BOOL=ON \
				-DGDCM_USE_SYSTEM_PVRG:BOOL=OFF \
				-DGDCM_BUILD_TESTING:BOOL=OFF \
				-DGDCM_USE_SYSTEM_EXPAT:BOOL=ON \
				-DGDCM_USE_SYSTEM_UUID:BOOL=ON \
				-DGDCM_USE_SYSTEM_ZLIB:BOOL=ON \
				-DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
				-DGDCM_USE_SYSTEM_OPENSSL:BOOL=ON \
				-DGDCM_USE_SYSTEM_CHARLS:BOOL=ON \
				-DGDCM_USE_SYSTEM_POPPLER:BOOL=ON \
				-DGDCM_USE_SYSTEM_LIBXML2:BOOL=ON \
				-DGDCM_USE_SYSTEM_JSON:BOOL=ON \
				-DGDCM_USE_PARAVIEW:BOOL=OFF \
				-DGDCM_USE_ACTIVIZ:BOOL=OFF \
				-DGDCM_USE_SYSTEM_PAPYRUS3:BOOL=OFF \
				-DGDCM_USE_SYSTEM_SOCKETXX:BOOL=ON \
				-DPython_ADDITIONAL_VERSIONS:STRING=$(PYVER)
		)
	cmake-utils_src_configure
}
