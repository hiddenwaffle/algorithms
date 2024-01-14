$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "algorithms"

require "minitest/autorun"
require "minitest/reporters"
require "pry"

Minitest::Reporters.use!
