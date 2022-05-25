# include file for bats tests

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
export PATH=${BATS_TEST_DIRNAME}/../bin:${PATH}
export CORRECT_FILE_PERMISSION_VERSION="v0.9.3"
export LIST_WWN_VERSION="v0.2.0-beta"
export TZ=UTC

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
function test::create-tempdir() {
  local prefix=${1:-test};
  local tempdir=${BATS_TMPDIR}/${prefix}-$$
  mkdir -p ${tempdir}
  export TEMPDIR=${tempdir}
}
