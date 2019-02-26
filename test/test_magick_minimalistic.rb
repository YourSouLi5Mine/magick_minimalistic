require          'minitest/autorun'
require_relative '../lib/magick_minimalistic.rb'

class TestMagickMinimalistic < MiniTest::Test
  def setup
    @empty = MagickMinimalistic::Configurator.new
    @wrong = MagickMinimalistic::Configurator.new({source: 'kirby.png', config: {gravities: 'Center', crops: "50%", resize: "50x50"}, destiny: 'kirby-2.png'})
    @correct = MagickMinimalistic::Configurator.new({source: 'kirby.png', config: {gravity: 'Center', crop: "50%", resize: "100x100"}, destiny: 'kirby-3.png'})
  end

  def test_that_an_empty_initialization_just_move_the_source_file_into_the_destiny
    @empty.run
    assert(File.exist?(@empty.destiny))
  end

  def test_that_wrong_attrs_will_not_be_used
    @wrong.run
    assert(File.exist?(@wrong.destiny))
  end

  def test_that_correct_attrs_will_create_the_avatar_properly
    @correct.run
    assert(File.exist?(@correct.destiny))
  end
end
