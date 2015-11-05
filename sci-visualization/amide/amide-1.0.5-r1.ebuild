# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils autotools

DESCRIPTION="AMIDE's a Medical Imaging Data Examiner"
HOMEPAGE="http://${PN}.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gsl xmedcon fame volpack dicom debug doc"

RDEPEND="
>=x11-libs/gtk+-2.10:2
xmedcon? ( >=sci-libs/xmedcon-0.10 )
volpack? ( media-libs/volpack )
fame? ( media-libs/libfame )
gsl? ( sci-libs/gsl )
dicom? ( sci-libs/dcmtk )
"

DEPEND="${RDEPEND}"

PATCHES=(
		"${FILESDIR}"/${PN}-1.0.5-vistaio.patch
)

src_configure () {

	eautoreconf

	econf \
		$(use_enable gsl gsltest) \
		$(use_enable gsl libgsl) \
		$(use_enable xmedcon xmedcontest) \
		$(use_enable xmedcon libmdc) \
		$(use_enable fame libfametest) \
		$(use_enable fame libfame) \
		$(use_enable dicom libdcmdata) \
		$(use_enable volpack libvolpack) \
		$(use_enable debug amide-debug) \
		$(use_enable doc) \
		$(use_enable doc gtk-doc) \
		|| die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
}
