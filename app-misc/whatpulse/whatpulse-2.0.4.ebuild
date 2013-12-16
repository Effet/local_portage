# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION=""
HOMEPAGE="http://detox.sourceforge.net/"
SRC_URI="x86? ( http://whatpulse.org/files/whatpulse-linux-32bit-${PV}.tar.gz )
		 amd64? ( http://whatpulse.org/files/whatpulse-linux-64bit-${PV}.tar.gz )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-libs/qt-core
		 x11-libs/qt-webkit
		 x11-libs/qt-sql
		 dev-libs/openssl"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	mkdir "${WORKDIR}/whatpluse-${PV}"
	mv "${WORKDIR}"/whatpulse "${S}"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README CHANGES
}
