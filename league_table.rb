require_relative 'team_list'

class LeagueTable
  attr_accessor :matches

  METHODS = %('points', 'goals_for', 'wins', 'draws', 'losses', 'goals_against')

  def initialize
    @matches = TeamList.new
  end

  def get_points(team_name)
    team = get_team(team_name)
    team[:points]
  end

  def get_goals_for(team_name)
    team = get_team(team_name)
    team[:goals]
  end

  def get_goals_against(team_name)
    team = get_team(team_name)
    team[:goals_against]
  end

  def get_wins(team_name)
    team = get_team(team_name)
    team[:wins]
  end

  def get_draws(team_name)
    team = get_team(team_name)
    team[:draws]
  end

  def get_losses(team_name)
    team = get_team(team_name)
    team[:losses]
  end

  def get_goal_difference(team_name)
    team = get_team(team_name)
    team[:goals] + team[:goals_against]
  end

  private

  def get_team(team_name)
    team = @matches.team_list[team_name]
    !team.nil? ? team : set_team(team_name)
  end

  def set_team(team_name)
    @matches.add_team(team_name)
    get_team(team_name)
  end

end