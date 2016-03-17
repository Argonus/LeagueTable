class TeamList
  attr_reader :teams

  def initialize
    @teams = {}
  end

  def collect_info(match_info)
    info = match_info.split(/\s-\s/)
    set_match_result(info)
  end

  def add_team(team_name)
    create_team(team_name, 0, 0, 0, 0, 0, 0)
  end

  private

  def set_match_result(info)
    two_teams = extract_teams_goals_from_match(info)
    set_teams_score(two_teams)
  end

  def extract_teams_goals_from_match(info)
    two_teams = []
    info.each do |team_info|
      team_name = team_info.scan(/[a-zA-Z\s-]/).join('').strip
      goals = team_info.scan(/\d+/).join('').to_i
      two_teams << [team_name, goals]
    end
    two_teams
  end

  def set_teams_score(two_teams)
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
    if @teams.has_key?(team_name)
      update_team(team_name, points, goals, wins, draws, losses, goals_against)
    else
      create_team(team_name, points, goals, wins, draws, losses, goals_against)
    end
  end

  def create_team(team_name, points, goals, wins, draws, losses, goals_against)
    @teams.merge!({"#{team_name}" => {points: points,
                                      goals: goals, wins: wins, draws: draws,
                                      losses: losses, goals_against: goals_against}})
  end

  def update_team(team_name, *args)
    @teams[team_name].each_key.with_index do |k, i|
      @teams[team_name][k] += args[i]
    end
  end

end