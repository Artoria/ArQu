class TestView < ArQu::View
  def initialize(ctrlr)
    super
    @b = mark Bitmap.new(100, 30)
    mark(Sprite.new).bitmap = @b
  end
  def update
    onchange(:wave) do 
      @b.clear
      @b.draw_text(@b.rect, self[:wave])
    end
  end
end