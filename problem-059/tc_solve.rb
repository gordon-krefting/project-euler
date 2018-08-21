#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

  def test_crypt_string
    message = "The quick brown fox jumped over the lazy dog"
    key = "abc"

    encryted_message = crypt_string(message, key)

    assert_not_equal encryted_message, message

    assert_equal message, crypt_string(encryted_message, key)

  end

end
