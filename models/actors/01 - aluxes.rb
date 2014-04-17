#coding:UTF-8
class Hero01 < Hero
  def face
    ["Graphics\\Faces\\Actor1", 4]
  end

  def name
    "阿尔西斯"
  end

  def skill1
   a = Skill.new
   a.name = "十字斩"
   a.skillproc =  lambda{|s, r| [[:hp, :-, s.level * 10 + 100]]}
   a
  end 

  
end