require 'seed_data'

describe SeedData do
	let(:seed_data) { SeedData.new('testurl.com', ['testing', 'rspec'], 'testing SeedData here!', 'wow. Much testing, such greens.') }

	describe 'initializing' do
		it 'exists' do
			expect(seed_data).to be_truthy
		end	
		it 'takes in urls' do
			expect(seed_data.urls).to eq 'testurl.com'
		end
		it 'takes in keywords' do
			expect(seed_data.keywords).to eq ['testing', 'rspec']
		end
		it 'takes in description' do
			expect(seed_data.description).to eq 'testing SeedData here!'
		end
		it 'takes in text' do
			expect(seed_data.text).to eq 'wow. Much testing, such greens.'
		end
	end
end
