require_relative '../league_table'
require 'spec_helper'

RSpec.describe LeagueTable do

  context 'get points for existing team' do
    let(:league) { LeagueTable.new }

      it 'get points for team with single match' do
        league.matches.push('Man Utd 3 - 0 Liverpool')

        expect(league.get_points('Man Utd')).to eq(3)
      end

      it 'get number of goals for team' do
        league.matches.push('Man Utd 3 - 0 Liverpool')

        expect(league.get_points('Man Utd')).to eq(3)
      end

  end

end