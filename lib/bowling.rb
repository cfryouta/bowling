class Bowling
        
    def initialize
        @total_score = 0
        @array_score = []
        @frame_score = []
    end
    
    def add_score(pins)
        @frame_score << pins
        if @frame_score.size == 2
            frame_end
        end
        if pins == 10
            @frame_score << 0
            frame_end
        end
    end
    
    def add_many_scores(num, pins)
        num.times do
            @frame_score << pins
            if @frame_score.size == 2
                frame_end
            end
        end
    end
    
    def calc_score
        @array_score.each.with_index do |score, i|
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
    
    def spare?(score)
        score.inject(:+) == 10
    end
    
    def strike?(score)
        score.first == 10
    end
    
    def next_strike?(index)
        @array_score[index + 1].first == 10
    end
    
    def not_last_frame?(index)
        index < 9
    end
    
    def calc_spare_bonus(index)
        @array_score[index + 1].first
    end
    
    def double_bonus(index)
        @array_score[index + 1].inject(:+)
    end
    
    def turkey_bonus(index)
        @array_score[index + 1].inject(:+) + @array_score[index + 2].first
    end
    
    def frame_end
        @array_score << @frame_score
        @frame_score = []
    end
end