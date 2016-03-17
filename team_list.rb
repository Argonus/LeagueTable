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
    info.each do |team_info|
      team_name = team_info.scan(/[a-zA-Z\s]/).join('').strip
      points = team_info.scan(/\d+/).join('').to_i
      @team_list << Team.new(team_name, points)
    end
  end


end