# frozen_string_literal: true

class Board
  attr_reader :width, :height

  DEFAULT_HEIGHT = 5
  DEFAULT_WITDTH = 5

  def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WITDTH)
    @height = height
    @width = width
  end
end
