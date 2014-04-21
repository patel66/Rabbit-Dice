require 'spec_helper'

describe "Game" do 

	# it 'can create users' do
	# 	user = db.create_user({:name => 'Bugs Bunny'})

	# 	expect(user).to be_a(RD::User)
	# 	expect(user.name).to eq('Bugs Bunny'))
	# 	expect(user.id).to_not be_nil
	# end 

	it 'adds users to a game' do
		p1 = User.new({:name => 'Bugs Bunny'})
		p2 = User.new({:name => 'Elmer Fud'})
		p3 = User.new({:name => 'Daffy Duck'})

		player_list = RD::Game.add_player(p1)
		player_list.add_player(p2)
		player_list.add_player(p3)

		expect(RD::Game.player_list.size).to eq(3)
		expect(RD::Game.player_list[0]).to eq(p1)

	end 

	it 'can cycle through players' do
		
	end 

	it 'can track the player score' do
	end 
	
end