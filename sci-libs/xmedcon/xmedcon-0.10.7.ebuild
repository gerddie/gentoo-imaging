# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# filename: xmedcon.ebuild.in                                             #
#                                                                         #
# UTILITY text: Medical Image Conversion Utility                          #
#                                                                         #
# purpose     : our Gentoo's portage ebuild template                      #
#                                                                         #
# project     : (X)MedCon by Erik Nolf                                    #
#                                                                         #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# $Id: xmedcon.ebuild.in,v 1.2 2006/03/01 23:10:54 enlf Exp $
#

EAPI="2"

inherit eutils

DESCRIPTION="Medical Image Conversion Utility"
HOMEPAGE="http://${PN}.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
#KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 sparc x86"
KEYWORDS="~amd64 ~x86"
IUSE="png gtk"

DEPEND="gtk? ( >=x11-libs/gtk+-2.0 )
		png? ( >=media-libs/libpng-1.5 )"

src_prepare() {
	epatch "${FILESDIR}/xmedcon-0.10.7-png15.patch"
}

src_compile() {

	myconf="`use_enable png` `use_enable gnome gui`"

	econf ${myconf} || die

	emake || die
}

src_install() {

	make DESTDIR=${D} install || die

	dodoc AUTHORS COPYING* INSTALL NEWS README REMARKS

	dodir /usr/share/pixmaps
	insinto /usr/share/pixmaps
	doins ${D}/etc/xmedcon.png
	rm ${D}/etc/xmedcon.ico
	rm ${D}/etc/xmedcon.png
	rm ${D}/etc/xmedconrc.win32
}
