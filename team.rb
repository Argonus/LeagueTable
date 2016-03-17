class Team
  attr_accessor :name, :points, :goals

  def initialize(name, goals=0, points=0, wins=0, draws=0, loses=0)
    @name = name
    @points = points
    @goals = goals
    @wins = wins
    @draws = draws
    @loses = loses
  end


end