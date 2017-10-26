require 'test_helper'
require 'generators/uploader/uploader_generator'

class UploaderGeneratorTest < Rails::Generators::TestCase
  tests UploaderGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
