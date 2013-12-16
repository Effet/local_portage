EAPI=4

DESCRIPTION="grml's zsh setup"
HOMEPAGE="http://grml.org/zsh/"
SRC_URI="http://deb.grml.org/pool/main/g/grml-etc-core/grml-etc-core_${PV}.tar.gz"

LICENSE="ZSH"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-shells/zsh"
DEPEND="${RDEPEND}
	app-text/txt2tags"

src_unpack() {
	unpack ${A}
	mkdir -p ${S}
	local SOURCE="${WORKDIR}"/grml-etc-core-${PV}
	mv ${SOURCE}/etc/zsh/{zshrc,keephack} "${S}"
	mv ${SOURCE}/etc/skel/.zshrc "${S}"
	cd ${SOURCE}/doc && make
	mv ${SOURCE}/doc/grmlzshrc.5 "${S}"
}

src_install() {
	insinto /etc/zsh/
	doins "${S}"/{zshrc,keephack}
	insinto /etc/skel/
	doins "${S}"/.zshrc
	doman "${S}"/grmlzshrc.5
}
