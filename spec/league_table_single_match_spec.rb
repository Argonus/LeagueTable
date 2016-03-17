require_relative '../league_table'
require 'spec_helper'

RSpec.describe LeagueTable do

  context 'single win or lose match' do
    let(:league_single) { LeagueTable.new }

    before(:each) do
      league_single.matches.push('Man Utd 3 - 1 Liverpool')
    end

    context 'get points' do
      it 'for winning team' do
        expect(league_single.get_points('Man Utd')).to eq(3)
      end

      it 'for losing team' do
        expect(league_single.get_points('Liverpool')).to eq(0)
      end
    end

    context 'get number of goals' do
      it 'for winning team' do
        expect(league_single.get_goals_for('Man Utd')).to eq(3)
      end

      it 'for losing team' do
        expect(league_single.get_goals_for('Liverpool')).to eq(1)
      end
    end

    context 'get number of wins' do
      it 'for  winning team' do
        expect(league_single.get_wins('Man Utd')).to eq(1)
      end

      it 'for losing team' do
        expect(league_single.get_wins('Liverpool')).to eq(0)
      end
    end

    context 'get number of draws' do
      it 'for  winning team' do
        expect(league_single.get_draws('Man Utd')).to eq(0)
      end

      it 'for losing team' do
        expect(league_single.get_draws('Liverpool')).to eq(0)
      end
    end

    context 'get number of losses' do
      it 'for  winning team' do
        expect(league_single.get_losses('Man Utd')).to eq(0)
      end

      it 'for losing team' do
        expect(league_single.get_losses('Liverpool')).to eq(1)
      end
    end

    context 'get number of goals against' do
      it 'for  winning team' do
        expect(league_single.get_goals_against('Man Utd')).to eq(-1)
      end

      it 'for losing team' do
        expect(league_single.get_goals_against('Liverpool')).to eq(-3)
      end
    end

    context 'get number of goals difference' do
      it 'for  winning team' do
        expect(league_single.get_goal_difference('Man Utd')).to eq(2)
      end

      it 'for losing team' do
        expect(league_single.get_goal_difference('Liverpool')).to eq(-2)
      end
    end

  end


  context 'single draw match' do
    let(:league_single_draw) { LeagueTable.new }

    before(:each) do
      league_single_draw.matches.push('Man Utd 2 - 2 Liverpool')
    end

    context 'get number of points' do
      it 'for first team' do
        expect(league_single_draw.get_points('Man Utd')).to eq(1)
      end

      it 'for second team' do
        expect(league_single_draw.get_points('Liverpool')).to eq(1)
      end
    end

    context 'get number of draws' do
      it 'for  first team' do
        expect(league_single_draw.get_draws('Man Utd')).to eq(1)
      end

      it 'for second team' do
        expect(league_single_draw.get_draws('Liverpool')).to eq(1)
      end
    end

  end

  context 'team who never played a match' do
    let(:no_matches_league) { LeagueTable.new }

    it 'get points' do
      expect(no_matches_league.get_points('Tottenham')).to eq(0)
    end

    it 'get goals for' do
      expect(no_matches_league.get_goals_for('Tottenham')).to eq(0)
    end

    it 'get goals against' do
      expect(no_matches_league.get_goals_against('Tottenham')).to eq(0)
    end

    it 'get goal difference' do
      expect(no_matches_league.get_goal_difference('Tottenham')).to eq(0)
    end

    it 'get wins' do
      expect(no_matches_league.get_wins('Tottenham')).to eq(0)
    end

    it 'get draws' do
      expect(no_matches_league.get_draws('Tottenham')).to eq(0)
    end

    it 'get_losses' do
      expect(no_matches_league.get_losses('Tottenham')).to eq(0)
    end

  end
end