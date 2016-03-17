require_relative 'team_list'

class LeagueTable
  attr_reader :matches

  METHODS = %w(points wins draws losses goals_against)

  def initialize
    @matches    = []
    @teams_list = TeamList.new
  end

  def add_match(info)
    @matches << info
    @teams_list.collect_info(info)
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
    team = @teams_list.teams[team_name]
    !team.nil? ? team : create_team(team_name)
  end

  def create_team(team_name)
    @teams_list.add_team(team_name)
    get_team(team_name)
  end

end