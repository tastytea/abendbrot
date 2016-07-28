# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit libretro

DESCRIPTION="RetroArch Assets files"
HOMEPAGE="https://github.com/libretro/retroarch-assets"
SRC_URI="https://github.com/libretro/retroarch-assets/archive/81ba3ae3c38db9cba5382c5864d237b5b6b5459d.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/retroarch-assets-81ba3ae3c38db9cba5382c5864d237b5b6b5459d"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/libretro/retroarch-assets.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dodir "${RETROARCH_DATA_DIR}"/assets
	cp -R "${S}"/* "${D}${RETROARCH_DATA_DIR}"/assets
	prepgamesdirs
}