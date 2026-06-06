#!/usr/bin/env bats

load fixture

@test "remaining arguments are printed" {
    run -0 frobnize one two three
    assert_output 'Remaining arguments: one two three'
}

@test "remaining arguments are printed without separator" {
    run -0 frobnize -- one two three
    assert_output 'Remaining arguments: one two three'
}
