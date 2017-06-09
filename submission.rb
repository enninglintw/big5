require_relative "big_five_results_text_serializer"
require_relative "big_five_results_poster"
require "test/unit"

FILE_NAME = "big5.txt"
text = File.open(FILE_NAME).read
big_five = BigFiveResultsTextSerializer.new(text)
hash = big_five.hash

results_hash = BigFiveResultsPoster.new(hash)
puts results_hash.post
puts results_hash.response_code
puts results_hash.token
