# Copyright 1999-2013 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit  cmake-utils

DESCRIPTION="Maxflow "
HOMEPAGE="https://github.com/gerddie/maxflow"
SRC_URI="https://github.com/gerddie/maxflow/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
