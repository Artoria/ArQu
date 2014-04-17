class HeroView < ArQu::View
  def initialize(hero)
    super
    @b = mark Bitmap.new(100, 200)
    mark(Sprite.new).bitmap = @b
  end
  def update
    onchange(:face) do 
      name, index = self[:face]
      bm = ArQu.bitmap(name)
      rect = Rect.new(index % 4 * 96, index / 4 * 96, 96, 96)
      @b.clear
      @b.blt(0, 0, bm, rect)
    end

   onchange(:name) do 
      @b.draw_text(0, 100, 100, 100, self[:name])
   end
  end
end