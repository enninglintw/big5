require_relative "big_five_results_text_serializer"
require "test/unit"

class TestBigFiveResultsTextSerializer < Test::Unit::TestCase
  FILE_NAME = "big5.txt"

  def test_hash_method
    text = File.open(FILE_NAME).read

    assert_equal(
      File.open("result_hash.rb").read.split("\n").first,
      BigFiveResultsTextSerializer.new(text).hash.to_s
    )
  end
end
