require 'seed_data'

describe SeedData do
	let(:seed_data) { SeedData.new(1,'seedurl.com', 'testurl.com', ['testing', 'rspec'], 'testing SeedData here!', 'Extra Extra! Volume of tests take over the country.', 'wow. Much testing, such greens.') }

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
		it 'takes in headers' do
			expect(seed_data.headers).to eq 'Extra Extra! Volume of tests take over the country.'
		end
		it 'takes in text' do
			expect(seed_data.text).to eq 'wow. Much testing, such greens.'
		end
	end

	describe 'storing data' do
		it 'stores the relevant data in a csv file' do
		end
	end
end
