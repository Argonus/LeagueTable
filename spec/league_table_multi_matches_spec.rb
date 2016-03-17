require 'spec_helper'
require_relative '../league_table'

describe LeagueTable do

  context 'multi win or lose matches' do
    let!(:league) { LeagueTable.new }

    before(:each) do
      league.matches.push('Man Utd 3 - 1 Liverpool')
      league.matches.push('Liverpool 2 - 2 Man Utd')
      league.matches.push('Man Utd 3 - 1 Tottenham')
      league.matches.push('Liverpool 1 - 0 Tottenham')
    end

    context 'get points' do
      it 'for first team' do
        expect(league.get_points('Man Utd')).to eq(7)
      end

      it 'for second team' do
        expect(league.get_points('Liverpool')).to eq(4)
      end

      it 'for third team' do
        expect(league.get_points('Tottenham')).to eq(0)
      end
    end

    context 'get goals for' do
      it 'first team' do
        expect(league.get_goals_for('Man Utd')).to eq(8)
      end

      it 'second team' do
        expect(league.get_goals_for('Liverpool')).to eq(4)
      end

      it 'third team' do
        expect(league.get_goals_for('Tottenham')).to eq(1)
      end
    end

    context 'get goals against' do
      it 'for first team' do
        expect(league.get_goals_against('Man Utd')).to eq(-4)
      end

      it 'for second team' do
        expect(league.get_goals_against('Liverpool')).to eq(-5)
      end

      it 'for third team' do
        expect(league.get_goals_against('Tottenham')).to eq(-4)
      end
    end

    context 'get wins' do
      it 'for first team' do
        expect(league.get_wins('Man Utd')).to eq(2)
      end

      it 'for second team' do
        expect(league.get_wins('Liverpool')).to eq(1)
      end

      it 'for third team' do
        expect(league.get_wins('Tottenham')).to eq(0)
      end
    end

    context 'get draws' do
      it 'for first team' do
        expect(league.get_draws('Man Utd')).to eq(1)
      end

      it 'for second team' do
        expect(league.get_draws('Liverpool')).to eq(1)
      end

      it 'for third team' do
        expect(league.get_draws('Tottenham')).to eq(0)
      end
    end

    context 'get losses' do
      it 'for first team' do
        expect(league.get_losses('Man Utd')).to eq(0)
      end

      it 'for second team' do
        expect(league.get_losses('Liverpool')).to eq(1)
      end

      it 'for third team' do
        expect(league.get_losses('Tottenham')).to eq(2)
      end
    end

    context 'get goal difference' do
      it 'for first team' do
        expect(league.get_goal_difference('Man Utd')).to eq(4)
      end

      it 'for second team' do
        expect(league.get_goal_difference('Liverpool')).to eq(-1)
      end

      it 'for third team' do
        expect(league.get_goal_difference('Tottenham')).to eq(-3)
      end
    end

  end
end