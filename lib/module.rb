module ArQu
  class Collection
    def initialize(type)
      @type = type
      @arr = []
    end

    def [](index)
      @arr[index]
    end

    def []=(index, b)
      @arr[index] = b
    end

    def create
      obj = @type.new     
      @arr.push obj
      obj
    end

    def update(index, thing)
      @arr[index].update(thing)      
    end
    
    def push(thing)
      if Hash === thing
         create.update(thing)
      else
         raise TypeError unless thing.is_a?(@type)
         @arr.push thing
      end
    end
  end
  class Model
    def self.Collection(a, b = :Object)
      attr_accessor a
      @data ||= {}
      @data[a] = [:col, b]
    end
    def self.Data(a, b = :Object)
      attr_accessor a
      @data ||= {}
      @data[a] = [:data, b]
    end
    def self.create(klass = self)
      if self != Model && self.superclass != Model
        a = superclass.create(klass)
      else
        a = klass.new
      end
      @data ||= {}
      @data.each{|k, v|
        case v[0] 
          when :col
            a.update k => Collection.new(Object.const_get(v[1]))
          when :data
            a.update k => Object.const_get(v[1]).new
        end
      }
      a
    end

    def update(thing)
      thing.each{|k, v|
        if send(k).is_a?(ArQu::Model)
          send(k).update(v)
        else
          send "#{k}=", v
        end
      }
      self
    end
  end

  class View
    def initialize(ctrlr)
      @ctrlr = ctrlr
      @changes = {}
      @disposes = []
      @moves = []
      @x, @y = 0
    end
    def moveall(x, y)
      dx, dy = x - @x, y - @y
      @moves.each{|z|
        z.x += dx
        z.y += dy
      }
    end
    def mark(a)
      @disposes << a
      a
    end
    def anchor(a)
      @moves << a
      a
    end

    def [](*a)
      @ctrlr.send(*a)
    end
    def onchange(a)
      u = self[a]
      [@changes[a] = u, yield] if @changes[a] != u
      self
    end
    def dispose
      @disposes.reverse_each(&:dispose)
    end
  end

  class Controller

  end
end