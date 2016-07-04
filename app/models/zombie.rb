class Zombie < ActiveRecord::Base
  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(3)

=begin
  Method chaining examples to create queries
    Zombie.rotting.limit(5)
    Zombie.recent.rotting
    Zombie.recent.fresh.rotting
=end
end
