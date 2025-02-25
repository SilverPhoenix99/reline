require_relative '../helper'
require 'reline/windows'

class Reline::Windows
  class KeyEventRecord::Test < Reline::TestCase

    def setup
      # Ctrl+A
      @key = Reline::Windows::KeyEventRecord.new(0x41, 1, Reline::Windows::LEFT_CTRL_PRESSED)
    end

    def test_matches__with_no_arguments_raises_error
      assert_raises(ArgumentError) { @key.matches? }
    end

    def test_matches_char_code
      assert_true @key.matches?(char_code: 0x1)
    end

    def test_matches_virtual_key_code
      assert_true @key.matches?(virtual_key_code: 0x41)
    end

    def test_matches_control_keys
      assert_true @key.matches?(control_keys: :CTRL)
    end

    def test_doesnt_match_alt
      assert_false @key.matches?(control_keys: :ALT)
    end

    def test_doesnt_match_empty_control_key
      assert_false @key.matches?(control_keys: [])
    end

    def test_matches_control_keys_and_virtual_key_code
      assert_true @key.matches?(control_keys: :CTRL, virtual_key_code: 0x41)
    end

  end
end
