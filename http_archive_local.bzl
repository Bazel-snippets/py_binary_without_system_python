def _http_archive_local_impl(repository_ctx):
  repository_ctx.extract(repository_ctx.attr.src, stripPrefix = repository_ctx.attr.strip_prefix)
  repository_ctx.file("BUILD.bazel", repository_ctx.read(repository_ctx.attr.build_file))

http_archive_local = repository_rule(
    attrs = {
        "src": attr.label(mandatory = True, allow_single_file = True),
        "build_file": attr.label(mandatory = True, allow_single_file = True),
        "strip_prefix": attr.string(),
    },
    implementation = _http_archive_local_impl,
)