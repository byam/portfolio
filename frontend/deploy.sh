#!/usr/bin/env bash

: Tune shell options && {
    set -o errexit
    set -o nounset
    set -o pipefail
    set -o xtrace
}

: Deploy frontend && {
    readonly AWS_PROFILE="cc"
    readonly BUCKET_NAME="byambasuren.com"

    yarn build
    aws s3 sync out s3://${BUCKET_NAME} --profile ${AWS_PROFILE}
}
