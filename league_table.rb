require_relative 'team_list'

class LeagueTable
  attr_accessor :matches

  def initialize
    @matches = TeamList.new
  end

  def get_points(team_name)
    team = @matches.team_list.select{|team| team.name == team_name}.first
    team.points
  end

  def get_goals_for(team_name)
    team = @matches.team_list.select{|team| team.name == team_name}.first
    team.goals
  end


end