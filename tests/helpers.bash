# include helpers for bats tests

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
export PATH=${BATS_TEST_DIRNAME}/helpers:${PATH}

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
function test::non-helpers-path() {
  export PATH=${PATH//${BATS_TEST_DIRNAME}\/helpers:}
}

function test::helpers-path() {
  export PATH=${BATS_TEST_DIRNAME}/helpers:${PATH}
}
