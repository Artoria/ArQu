class AppController < ArQu::Controller
  def initialize
    @h = Hero01.create
    @view = HeroView.new(@h)
  end

  def run
    loop do
     Graphics.update
     Input.update
     @view.update
     @game.wave += 1 if Input.trigger? :C
    end
  end    
end