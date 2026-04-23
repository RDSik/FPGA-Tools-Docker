set -x

if [[ "${ARCH}" != "arm64" ]]; then
    ARCH="x86_64"
fi

BAZEL_VERSION=7.6.1
BAZEL_EXEC="/usr/bin/bazel"

wget --no-verbose "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-"${ARCH} -O ${BAZEL_EXEC}
chmod +x ${BAZEL_EXEC}
bazel --version
