class TestView < ArQu::View
  def update
    msgbox 1 if Input.trigger?(:C)
  end
end