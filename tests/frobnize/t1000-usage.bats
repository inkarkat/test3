#!/usr/bin/env bats

load fixture

@test "no arguments prints empty remaining arguments" {
    run -0 frobnize
    assert_output 'Remaining arguments: '
}

@test "invalid option prints message and usage instructions" {
    run -2 frobnize --invalid-option
    assert_line -n 0 'ERROR: Unknown option "--invalid-option"!'
    assert_line -n 2 -e '^Usage:'
}

@test "-h prints long usage help" {
    run -0 frobnize -h
    refute_line -n 0 -e '^Usage:'
}
