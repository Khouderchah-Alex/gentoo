# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{5,6,7} pypy )

inherit distutils-r1

DESCRIPTION="MessagePack (de)serializer for Python"
HOMEPAGE="https://msgpack.org
	https://github.com/msgpack/msgpack-python/
	https://pypi.org/project/msgpack/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~x86"
IUSE="+native-extensions test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	native-extensions? (
		$(python_gen_cond_dep '>=dev-python/cython-0.16[${PYTHON_USEDEP}]' 'python*')
	)
	test? (
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	# Remove pre-generated cython files
	rm msgpack/{_packer,_unpacker}.cpp || die

	if ! use native-extensions ; then
		sed -i -e "/have_cython/s:True:False:" ./setup.py || die
	fi
	distutils-r1_python_prepare_all
}

python_test() {
	py.test -v test || die "Tests fail with ${EPYTHON}"
}
