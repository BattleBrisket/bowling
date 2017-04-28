require 'finishing_moves'

class Bowling

  attr_reader :frame, :ball, :score

  def initialize
    @score = {}
    @frame = 0
  end

  def roll(pins = 0)
    new_frame if @frame == 0
    @score[@frame] << pins
    @ball += 1
    new_frame if @ball == 3 && @frame < 10
    # 10th frame, fill ball
  end

  def get_roll(frame, ball)
    @score[frame][ball - 1]
  end

  def frame_total(frame)
    return tenth_frame_total(frame) if tenth_frame?
    next_frame = frame += 1
    case
    when open_frame?(frame)
      return raw_frame_total(frame)
    when nil_chain{@score[next_frame].empty?}
      return :strike if strike?(frame)
      return :spare if spare?(frame)
    when strike?(frame)
      ;
    when spare?(frame)
      ;
    end
  end

  def tenth_frame_total(frame)
  end

  def raw_frame_total(frame)
    @score[frame].sum
  end

  def frame_rolls(frame)
    @score[frame].size
  end

  def strike?(frame)
    strike_or_spare?(frame) && frame_rolls(frame) == 1
  end

  def spare?(frame)
    strike_or_spare?(frame) && frame_rolls(frame) > 1
  end

  def strike_or_spare?(frame)
    raw_frame_total(frame) == 10
  end

  def open_frame?(frame)
    raw_frame_total(frame) != 10 && frame_rolls(frame) >= 1
  end

  def tenth_frame?
    @frame == 10
  end

  private

  def new_frame
    @frame += 1
    @ball = 1
    @score[@frame] = []
    true
  end

end
