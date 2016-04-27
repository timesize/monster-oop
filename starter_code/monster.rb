# Monster class
class Monster

  # class constant - freeze freezes the value of an array or hash
  THREAT_LEVELS = [:low, :medium, :high, :midnight].freeze

  # getters and setters for instance variables
  attr_accessor :threat_level, :habitat, :name

  # class variable for count
@@count = 0


  # class instance variable for class description
  @class_description = "A scary monster!"

  # class method getter for @@count class variable

  def self.count
    @@count
  end

  # class method getter for @class_description class instance variable
  def self.class_description
    @class_description
  end

  # initial behavior
  def initialize(threat_level=:medium)
    # check that threat_level argument is valid
    if THREAT_LEVELS.include? threat_level
    @threat_level = threat_level
  else
    raise "cannot create monster - invalid threat level #{threat_level}"
    end
    puts "Rawr!"
    @@count = @@count + 1
    puts "#{@@count} monsters now roam the world!"
  end

  # habitat? instance method
  def habitat?(some_hab)
    @habitat == some_hab
  end

  # get_dangerous instance method
   def get_dangerous

  # ruby version of a switch statment is case
      case @threat_level
        when :low
          @threat_level = :medium
        when :medium
          @threat_level = :high
        when :high
          @threat_level = :midnight
        when :midnight
          :midnight
      end
    end

    include Comparable
  def <=>(other_monster)
    Monster::THREAT_LEVELS.index(@threat_level) <=> Monster::THREAT_LEVELS.index(other_monster.threat_level)
  end


  # fight class method
  def self.fight(monster1, monster2)
    if monster1.threat_level == monster2.threat_level
      monster2
    elsif monster1.threat_level == :low
      monster2
    elsif monster1.threat_level == :medium
      if monster2.threat_level == :low
        monster1
      else
        monster2
      end
    else # monster1.threat_level is :high or :midnight
      if monster2.threat_level == :midnight
        monster2
      else
        monster1
      end
    end
  end
end

# Zombie class
class Zombie < Monster

  # zombie version of class_description
  @class_description = "Shuffling, decaying flesh. Hungry and without remorse!"

  # initial behavior and values
  def initialize (threat_level=:medium)
    # note that zombies created without a threat level
    # will still have a default threat_level of :medium
    super(threat_level)
    @habitat = "graveyard"
  end
end

# Werewolf class
class Werewolf < Monster

  # werewolf version of class_description
  @class_description = "A man... a wolf... a monster!"

  # initial behavior and values
  def initialize (threat_level=:low)
    # werewolves created without a threat level
    # will have a default threat_level of :low
    super(threat_level)
    @name = name
  end

  # update_threat_level instance method
  def update_threat_level(full_moon)
    if full_moon
      @threat_level = :midnight
    else
      @threat_level = :low
    end
    @threat_level
  end
end

# Flying module
module Flying

  #fly method
  def fly
    puts "#{self.name || "it"} soars through the air"
  end
end

# Vampire class
class Vampire < Monster
  # vampire class description
@class_description = "Dark and sparly."
  # Flying module included

  include Flying
end
