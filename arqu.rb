#fun and tears with coding:UTF-8
def require_all(*a)
  a.each{|x|
    Dir.glob("Data/Arqu/#{x}/**/*.rb"){|w|
      require_data w
    }
  }
end

def run(a)
  a.new.run
end

module ArQu
end


require_all :lib