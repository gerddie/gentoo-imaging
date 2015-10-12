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
# $Id: xmedcon.ebuild.in,v 1.9 2008/03/14 21:49:15 enlf Exp $
#

inherit eutils

DESCRIPTION="Medical Image Conversion Utility"
HOMEPAGE="http://${PN}.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
RESTRICT="primaryuri"


LICENSE="GPL-2 LGPL-2"
SLOT="0"
#KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 sparc x86"
KEYWORDS="~x86 ~amd64"
IUSE="png gtk"

DEPEND="gtk? ( >=x11-libs/gtk+-2 )
		png? ( >=media-libs/libpng-1.2.1 )"

src_compile() {

	local myconf="$(use_enable gtk gui) $(use_enable png)"

	econf ${myconf} || die

	emake || die
}

src_install() {

	make DESTDIR=${D} install || die

	dodoc AUTHORS COPYING* INSTALL NEWS README REMARKS

	dodir /usr/share/pixmaps
	insinto /usr/share/pixmaps
	doins ${D}/etc/xmedcon.png
}
