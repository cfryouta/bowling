class Bowling
        
    def initialize
        @total_score = 0
        @score = []
        @frame_score = []
    end
    
    def add_score(pins)
        @frame_score << pins
        if strike_get?(pins)
            strike
        else
            frame
        end
    end
    
    def add_many_scores(num, pins)
        num.times do
            frame
        end
    end
    
    def calc_score
        @score.each.with_index do |score, i|
            if strike?(score) && not_last_frame?(i)
                if next_strike?(i)
                    @total_score += score.inject(:+) + turkey_bonus(i)
                else
                    @total_score += score.inject(:+) + double_bonus(i)
                end
            elsif spare?(score) && not_last_frame?(i)
                @total_score += score.inject(:+) + calc_spare_bonus(i)
            else
                @total_score += score.inject(:+)
            end
        end
    end
    
    def total_score
        @total_score
    end
    
    private
    
# ストライクを取れたかどうかの判定
    def strike_get?(pins)
        pins == 10
    end

# スペアかどうかの判定
    def spare?(score)
        score.inject(:+) == 10
    end

# ストライクかどうかの判定
    def strike?(score)
        score.first == 10
    end

# ダブル以上かどうかの判定
    def next_strike?(index)
        @score[index + 1].first == 10
    end

# 10フレーム目かどうかの判定
    def not_last_frame?(index)
        index < 9
    end

# スペアボーナス
    def calc_spare_bonus(index)
        @score[index + 1].first
    end

# ダブルボーナス
    def double_bonus(index)
        @score[index + 1].inject(:+)
    end

# ターキーボーナス
    def turkey_bonus(index)
        @score[index + 1].inject(:+) + @score[index + 2].first
    end

# フレームごとに適切に格納するためのメソッド
    def frame_end
        @score << @frame_score
        @frame_score = []
    end

# ストライクをとった時に適切に@scoreに格納するためのメソッド
    def strike
        @frame_score << 0
        frame_end
    end

# 2投すると1フレームとして@scoreに格納するためのメソッド
    def frame
        if @frame_score.size == 2
            frame_end
        end
    end

end