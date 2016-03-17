require_relative 'team'
class TeamList
  attr_reader :team_list

  def initialize
    @team_list = []
  end

  def push(match_info)
    info = match_info.split('-')
    extract_team_result_info(info)
  end

  private

  def extract_team_result_info(info)
    two_teams = []
    info.each do |team_info|
      team_name = team_info.scan(/[a-zA-Z\s]/).join('').strip
      points = team_info.scan(/\d+/).join('').to_i
      two_teams << [team_name, points]
    end
    set_match_score(two_teams)
  end

  def set_match_score(two_teams)
    if two_teams[0][1] > two_teams[1][1]
      @team_list << Team.new(two_teams[0][0], two_teams[0][1], 3)
      @team_list << Team.new(two_teams[1][0], two_teams[1][1])
    elsif two_teams[0][1] < two_teams[1][1]
      @team_list << Team.new(two_teams[0][0], two_teams[0][1])
      @team_list << Team.new(two_teams[1][0], two_teams[1][1], 0)
    else
      @team_list << Team.new(two_teams[0][0], two_teams[0][1], 1)
      @team_list << Team.new(two_teams[1][0], two_teams[1][1], 1)
    end
  end


end