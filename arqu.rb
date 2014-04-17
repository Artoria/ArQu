#fun and tears with coding:UTF-8
def require_all(*a)
  a.each{|x|
    Dir.glob("Data/Arqu/#{x}/**/*.rb").sort_by(&:length).each{|w|
      require_data w
    }
  }
end

module ArQu
  @stack = []
  def self.stack
    @stack
  end
  def self.run(a)
    @stack.push a.new
    unless @stack.empty?
      @stack[-1].run
    end
  end

  @cache = {}
  def self.bitmap(a)
    key = a.downcase
    @cache[key] ||= Bitmap.new(key)
  end
end

module ArQu
end


require_all :lib