require 'ranking.rb'

describe Ranker do
	let(:hash) { { urls: { "a" => 1 }, keywords: { "b" => 2 }, description: { "c" => 3 }, headers: { "d" => 4 }, text: { "e" => 5 } } }
	let(:ranker) { Ranker.new(hash, :d ) }

	describe 'initializing' do
		it 'should exist' do
			expect(ranker).to be_truthy
		end
		
		it 'takes in a hash' do
			expect(ranker.hash).to eq({ urls: { "a" => 1 }, keywords: { "b" => 2 }, description: { "c" => 3 }, headers: { "d" => 4 }, text: { "e" => 5 } })
		end
	end

	describe 'calculates word score' do
		it 'starts with value of 0' do
			expect(ranker.word_score).to eq 0
		end
		
		it 'calculates points based on url' do
			ranker = Ranker.new(hash, "a")
			ranker.calculate_total_score
			expect(ranker.word_score).to eq 5
		end

		it 'calculates points based on keywords' do
			ranker = Ranker.new(hash, "b")
			ranker.calculate_total_score
			expect(ranker.word_score).to eq 8
		end

		it 'calculates points based on description' do
			ranker = Ranker.new(hash, "c")
			ranker.calculate_total_score
			expect(ranker.word_score).to eq 9
		end

		it 'calculates points based on headers' do
			ranker = Ranker.new(hash, "d")
			ranker.calculate_total_score
			expect(ranker.word_score).to eq 8
		end

		it 'calculates points based on text' do
			ranker = Ranker.new(hash, "e")
			ranker.calculate_total_score
			expect(ranker.word_score).to eq 5
		end
	end
end
