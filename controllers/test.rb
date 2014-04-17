class AppController < ArQu::Controller
  def initialize
    @view = TestView.new
  end

  def run
    loop do
     Graphics.update
     Input.update
     @view.update
    end
  end    
end