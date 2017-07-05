require 'seed_data'

describe SeedData do
	let(:seed_data) { SeedData.new }

	describe 'initializing' do
		it 'exists' do
			expect(seed_data).to be_truthy
		end	
	end
end
