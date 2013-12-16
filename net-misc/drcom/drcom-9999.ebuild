# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Python web client for Dr.com."
SRC_URI=""
HOMEPAGE=""
IUSE=""

PYTHON_DEPEND="2:2.7"

src_install()
{
  dobin "${FILESDIR}/drcom-client.py"

  insinto "/etc/"
  newins "${FILESDIR}/drcom.cfg" drcom.cfg

  newinitd "${FILESDIR}/drcom-daemon" drcom
}
