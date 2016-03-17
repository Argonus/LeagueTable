require_relative 'team_list'

class LeagueTable
  attr_accessor :matches

  METHODS = %('points', 'goals_for', 'wins', 'draws', 'losses', 'goals_against')

  def initialize
    @matches = TeamList.new
  end

  def get_points(team_name)
    team = get_team(team_name)
    team.points
  end

  def get_goals_for(team_name)
    team = get_team(team_name)
    team.goals
  end

  def get_goals_against(team_name)
    team = get_team(team_name)
    team.goals_against
  end

  def get_wins(team_name)
    team = get_team(team_name)
    team.wins
  end

  def get_draws(team_name)
    team = get_team(team_name)
    team.draws
  end

  def get_losses(team_name)
    team = get_team(team_name)
    team.loses
  end

  def get_goals_difference(team_name)
    team = get_team(team_name)
    team.goals + team.goals_against
  end

  private

  def get_team(team_name)
    team = @matches.team_list.select { |team| team.name == team_name }.first
  end

end