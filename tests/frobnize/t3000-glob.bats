#!/usr/bin/env bats

load fixture

@test "with file glob" {
    shopt -qs nullglob
    run -0 frobnize -- *.md *.orig
    assert_output 'Remaining arguments: README.md'
}
