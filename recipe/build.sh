#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export OPENSSL_DIR=$PREFIX
export OPENSSL_NO_VENDOR=1

# strip debug symbols
export CARGO_PROFILE_RELEASE_STRIP=debuginfo

# check licenses
cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY.yml

# build statically linked binary with Rust
cargo install \
  --bins \
  --locked \
  --no-track \
  --path lychee-bin \
  --profile release \
  --root "${PREFIX}"
