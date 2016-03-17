require_relative 'team_list'
require_relative 'invalid_input_format'


class LeagueTable
  METHODS = %w(points wins draws losses goals_against)
  PATTERN = /.+\s\d+\s-\s\d+\s.+/

  def initialize
    @teams_list = TeamList.new
  end

  def add_match(info)
    if info.is_a?(String) && PATTERN.match(info)
      @teams_list.push(info)
    else
      raise InvalidInputFormat
    end
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