class Game < ArQu::Model
  Data :environment,  :Environment
  Data :list,         :ActionList
  Data :wave
  Data :party, :Party
  Data :troop, :Troop
end

class Battler < ArQu::Model
  Collection  :skills,    :Skill 
  Collection  :states,    
  Collection  :params,    
  Collection  :nowparams
end

class Hero < Battler
end

class Enemy < Battler
end

class Troop < ArQu::Model
  Collection :members, :Enemy
end

class Party < ArQu::Model
  Collection :members, :Hero
end

class Environment < ArQu::Model
  Data :weather
end

class ActionList < ArQu::Model
  Collection :action, :Action
end

class Action < ArQu::Model
  Data :sender
  Data :receiver
  Data :skill, :Skill
end

