workspace(name = "pkg_python")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("http_archive_local.bzl", "http_archive_local")

http_archive(
    name = "rules_python",
    sha256 = "954aa89b491be4a083304a2cb838019c8b8c3720a7abb9c4cb81ac7a24230cea",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_python/releases/download/0.4.0/rules_python-0.4.0.tar.gz",
        "https://github.com/bazelbuild/rules_python/releases/download/0.4.0/rules_python-0.4.0.tar.gz",
    ],
)

# Unfortunately prebuilt Python binaries from https://github.com/indygreg/python-build-standalone
# are only available as .zst and http_archive does not understand .zst, so
# I repackaged them as .zip and placed in "python" subfolder of this repo.

http_archive_local(
    name = "python_windows",
    build_file = "//python:python_windows.BUILD",
    src = "//python:cpython-3.10.0-i686-pc-windows-msvc-shared-pgo-20211017T1616.zip",
    strip_prefix = "python/install",
)

http_archive_local(
    name = "python_osx",
    build_file = "//python:python_posix.BUILD",
    src = "//python:cpython-3.10.0-aarch64-apple-darwin-pgo+lto-20211017T1616.zip",
    strip_prefix = "python/install",
)

http_archive_local(
    name = "python_linux",
    build_file = "//python:python_posix.BUILD",
    src = "//python:cpython-3.10.0-i686-unknown-linux-gnu-pgo+lto-20211017T1616.zip",
    strip_prefix = "python/install",
)

register_toolchains(":tab_python_toolchain")