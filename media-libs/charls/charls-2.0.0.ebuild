# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit  cmake-utils flag-o-matic

DESCRIPTION="This project's goal is to provide a full implementation of JPEG-LS. "
HOMEPAGE="https://github.com/team-charls/charls"
SRC_URI="https://github.com/team-charls/charls/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

append-cflags $(test-flags-CC -fPIC -pic)
append-cxxflags $(test-flags-CXX -fPIC -pic)

src_prepare() {
	# remove those windows line endings
	find . \( -name "CMakeLists.txt" -or -name "*.h" -or -name "*.cpp" \) -exec sed -ie "s/\r//g" {} \;
#	epatch "${FILESDIR}"/charls_add_cmake_install_target.patch
#	epatch "${FILESDIR}"/charls_add_sharedlib_soname.patch
#	epatch "${FILESDIR}"/charls_fix_tests.patch
#	epatch "${FILESDIR}"/charls_fix_clang_compilation_issue.patch
#	epatch "${FILESDIR}"/add_visibility.patch
#	epatch "${FILESDIR}"/stl_symbols_hack.patch
}

src_configure() {
		local mycmakeargs=(
			-Dcharls_BUILD_SHARED_LIBS:BOOL=ON \
		)
	cmake-utils_src_configure
}
