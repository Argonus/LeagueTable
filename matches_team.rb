class MatchesTeam
  attr_reader :team_list

  def initialize
    @team_list = {}
  end

  def push(match_info)
    info = match_info.split(/\s-\s/)
    extract_team_result_info(info)
  end

  def add_team(team_name)
    update_or_create_team(team_name)
  end

  private

  def extract_team_result_info(info)
    two_teams = []
    info.each do |team_info|
      team_name = team_info.scan(/[a-zA-Z\s-]/).join('').strip
      goals = team_info.scan(/\d+/).join('').to_i
      two_teams << [team_name, goals]
    end
    set_match_score(two_teams)
  end

  def set_match_score(two_teams)
    if two_teams[0][1] > two_teams[1][1]
      update_or_create_team(two_teams[0][0], 3, two_teams[0][1], 1, 0, 0, -two_teams[1][1])
      update_or_create_team(two_teams[1][0], 0, two_teams[1][1], 0, 0, 1, -two_teams[0][1])
    elsif two_teams[0][1] < two_teams[1][1]
      update_or_create_team(two_teams[0][0], 0, two_teams[0][1], 0, 0, 1, -two_teams[1][1])
      update_or_create_team(two_teams[1][0], 3, two_teams[1][1], 1, 0, 0, -two_teams[0][1])
    else
      update_or_create_team(two_teams[0][0], 1, two_teams[0][1], 0, 1, 0, -two_teams[1][1])
      update_or_create_team(two_teams[1][0], 1, two_teams[1][1], 0, 1, 0, -two_teams[1][1])
    end
  end

  def update_or_create_team(team_name, points=0, goals=0, wins=0, draws=0, losses=0, goals_against=0)
    if @team_list.has_key?(team_name)
      update_team(team_name, points, goals, wins, draws, losses, goals_against)
    else
      create_team(team_name, points, goals, wins, draws, losses, goals_against)
    end
  end

  def create_team(team_name, points, goals, wins, draws, losses, goals_against)
    @team_list.merge!({"#{team_name}" => {points: points,
                                                 goals: goals, wins: wins, draws: draws,
                                                 losses: losses, goals_against: goals_against}})
  end

  def update_team(team_name, *args)
    i = 0
    @team_list[team_name].each do |k, v|
      @team_list[team_name][k] += args[i]
      i += 1
    end
  end

end