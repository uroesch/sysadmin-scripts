# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------
SHELL := bash
.ONESHELL:
.SHELLFLAGS  := -o errexit -o nounset -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS    += --warn-undefined-variables
MAKEFLAGS    += --no-builtin-rules
BASH_VERSION += 4.2

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
USER_BIN  := $(HOME)/bin
REPO_NAME := $(shell basename $(CURDIR))

# -----------------------------------------------------------------------------
# User install
# -----------------------------------------------------------------------------
user_install:
	@echo "Install $(REPO_NAME) under $(USER_BIN)"
	mkdir -p $(USER_BIN) || :
	for script in bin/*; do
		basename=$${script##*/}
		install $${script} $(USER_BIN)/$${basename} &&
			echo "-> Installing $${script} to $(USER_BIN)/$${basename}"
	done

user_uninstall:
	@echo "Uninstall $(REPO_NAME) from $(USER_BIN)"
	for script in bin/*; do
		basename=$${script##*/}
		if [[ -f $(USER_BIN)/$${basename} ]]; then
			rm $(USER_BIN)/$${basename} &&
			echo "-> Unstalling $(USER_BIN)/$${basename}"
		fi
	done

# -----------------------------------------------------------------------------
# Run tests
# -----------------------------------------------------------------------------
test:
	bats tests/*.bats

test-bash:
	@echo "Bash tests"
	declare -a VERSIONS=( 4.2 4.3 4.4 5.0 5.1 5.2-rc );
	function  setup() {
		apk add \
			bats \
			coreutils \
			git \
			grep \
			make; \
			git config --global --add safe.directory /git-helpers; \
	};
	for version in $${VERSIONS[@]}; do
		@echo "Test bash version $${version}"
		docker run \
			--rm \
			--tty \
			--volume $$(pwd):/git-helpers \
			--workdir /git-helpers \
			bash:$${version} \
			bash -c "$$(declare -f setup); setup &>/dev/null && make test";
	done

# vim: shiftwidth=2 noexpandtab :
