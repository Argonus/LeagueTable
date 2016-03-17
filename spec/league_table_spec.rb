require_relative '../league_table'
require 'spec_helper'

RSpec.describe LeagueTable do

  context 'single win/lose match' do
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
      it 'get number of goals for team' do
        expect(league_single.get_goals_for('Man Utd')).to eq(3)
      end

      it 'for losing team' do
        expect(league_single.get_goals_for('Liverpool')).to eq(1)
      end
    end

    context 'single draw match' do
      let(:league_single_draw) { LeagueTable.new }

      before(:each) do
        league_single_draw.matches.push('Man Utd 2 - 2 Liverpool')
      end

      it 'get number of goals for team' do
        expect(league_single_draw.get_points('Man Utd')).to eq(1)
      end

      it 'for losing team' do
        expect(league_single_draw.get_points('Liverpool')).to eq(1)
      end

    end


  end

end