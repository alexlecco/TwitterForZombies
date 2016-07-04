class Zombie < ActiveRecord::Base
  has_one :brain, dependent: :destroy

#  scope :rotting, where(rotting: true)
#  scope :fresh, where("age < 20")
#  scope :recent, order("created_at desc").limit(3)
=begin
  Method chaining examples to create queries
  Zombie.rotting.limit(5)
  Zombie.recent.rotting
  Zombie.recent.fresh.rotting
=end

  before_save :make_rotting

  def make_rotting
    self.rotting = true if age > 20
  end
end
