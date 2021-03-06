# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vim-plugin vcs-snapshot

GIT_HASH="057dad8c90d72af5d9bca9cd33746c3b59285191"

DESCRIPTION="vim plugin: highlight the exact differences, based on characters and words"
HOMEPAGE="https://github.com/rickhowe/diffchar.vim https://www.vim.org/scripts/script.php?script_id=4932"
SRC_URI="https://github.com/rickhowe/diffchar.vim/archive/${GIT_HASH}.tar.gz -> ${P}.tar.gz"
LICENSE="vim.org"
KEYWORDS="amd64 x86"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	default
	rm *.gif *.png *.md || die
}
