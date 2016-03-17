require_relative 'league_matches'

class LeagueTable
  attr_reader :matches

  METHODS = %w(points wins draws losses goals_against)

  def initialize
    @matches = LeagueMatches.new
  end

  def get_goals_for(team_name)
    team = get_team(team_name)
    team[:goals]
  end

  def get_goal_difference(team_name)
    team = get_team(team_name)
    team[:goals] + team[:goals_against]
  end

  METHODS.each do |param|
    define_method("get_#{param}") do |argument|
      team = get_team(argument)
      team[param.to_sym]
    end
  end

  private

  def get_team(team_name)
    team = @matches.team_list[team_name]
    !team.nil? ? team : create_team(team_name)
  end

  def create_team(team_name)
    @matches.add_team(team_name)
    get_team(team_name)
  end

end