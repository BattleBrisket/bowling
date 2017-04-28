require 'spec_helper'

describe Bowling do

	context "startup" do
		it '#initialize' do
			bowling = Bowling.new
			expect(bowling).to be_a(Bowling)
			expect(bowling.score).to be_a(Hash)
			expect(bowling.score).to eq({1=>[]})
		end
	end

	context "gaming" do
		before :example do
			@bowling = Bowling.new
		end

		it "throws the ball" do
			expect(@bowling.ball).to eq 1
			@bowling.roll(5)
			expect(@bowling.ball).to eq 2
			expect(@bowling.frame).to eq 1
			expect(@bowling.frame_total(1)).to eq 5
			@bowling.roll(3)
			expect(@bowling.frame_total(1)).to eq 8
			expect(@bowling.frame).to eq 2
			expect(@bowling.ball).to eq 1
		end

		it 'counts each ball' do
			@bowling.roll(4)
			@bowling.roll(3)
			@bowling.roll(2)
			@bowling.roll(1)
			@bowling.roll(0)
			expect(@bowling.get_roll(1,1)).to eq 4
			expect(@bowling.get_roll(1,2)).to eq 3
			expect(@bowling.get_roll(2,1)).to eq 2
			expect(@bowling.get_roll(2,2)).to eq 1
			expect(@bowling.get_roll(3,1)).to eq 0
		end

		it "counts a spare" do
			@bowling.roll(5)
			expect(@bowling.frame).to eq 1
			expect(@bowling.frame_total(1)).to eq 5
			@bowling.roll(5)
			expect(@bowling.frame_total(1)).to eq 10
			expect(@bowling.spare?(1)).to eq true
			expect(@bowling.strike?(1)).to eq false
		end

		it "counts a stike" do
			expect(@bowling.frame).to eq 1
			@bowling.roll(10)
			expect(@bowling.frame).to eq 2
			expect(@bowling.spare?(1)).to eq false
			expect(@bowling.strike?(1)).to eq true
			expect(@bowling.frame_total(1)).to eq 10
			@bowling.roll(5)
			expect(@bowling.frame_total(1)).to eq 15
			@bowling.roll(3)
			expect(@bowling.frame_total(1)).to eq 18
		end

	end

end
