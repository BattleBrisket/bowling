require 'finishing_moves'

class Bowling

	attr_reader :frame, :ball, :score

	def initialize
		@score = {}
		@frame = 0
		next_frame
	end

	def roll(pins = 0)
		@score[@frame] << pins
		@ball += 1
		next_frame if @ball == 3  # 10 FRAME, 3 BALLS
	end

	def get_roll(frame, ball)
		@score[frame][ball - 1]
	end

	def frame_total(frame)
		raw = @score[frame].sum
		next_frame = frame + 1
		return raw if nil_chain{@score[next_frame].empty?} || !strike_or_spare?(next_frame)
		next_raw = @score[next_frame].sum
		return raw + next_raw
	end

	def frame_rolls(frame)
		@score[frame].size
	end

	def frame_total_bak(frame)
		tally = 0
		@score[frame].each do |pins|
			tally += pins
		end
		tally
	end

	def strike?(frame)
		spare?(frame) && @score[frame].size == 1
	end

	def spare?(frame)
		frame_total(frame) == 10
	end

	def strike_or_spare?(frame)
		strike?(frame) || spare?(frame)
	end

	def running_total
	end

	private
	def next_frame
		@frame += 1
		@ball = 1
		@score[@frame] = []
	end


end