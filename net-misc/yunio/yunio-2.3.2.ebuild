# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Yunio."
HOMEPAGE="http://yunio.com/"
SRC_URI="x86? ( http://www.yunio.com/download/${P}-generic-i386.tgz )
	amd64? ( http://www.yunio.com/download/${P}-generic-amd64.tgz )"

SLOT=0
LICENSE=""
KEYWORDS="~amd64 ~x86"

RDEPEND="media-libs/fontconfig
	x11-libs/libSM
	x11-libs/libXext
	x11-libs/libXrender"
DEPEND=""

src_unpack() {
	unpack ${A}
	mkdir -p "${S}"
	mv "${WORKDIR}"/yunio "${S}"
}

src_install() {
	insinto "/opt/yunio"
	doins -r "${S}"/yunio
	fperms a+x "/opt/yunio/yunio"
	dosym "/opt/yunio/yunio" "/opt/bin/yunio"
}
