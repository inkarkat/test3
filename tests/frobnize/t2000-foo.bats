#!/usr/bin/env bats

load fixture

@test "correct foo argument" {
    run -0 frobnize --foo bar
    assert_output 'Remaining arguments: '
}

@test "wrong foo argument" {
    run -2 frobnize --foo what
    assert_line -n 0 'ERROR: --foo requires argument "bar"!'
    assert_line -n 2 -e '^Usage:'
}
