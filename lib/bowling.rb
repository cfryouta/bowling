class Bowling
        
    def initialize
        @total_score = 0
        @array_score = []
    end
    
    def add_score(pins)
        @array_score << pins
    end
    
    def calc_score
        i = 0
        @array_score.each do |num|
            if i != 0 && i != 19 && (i % 2) === 1
                if (@array_score[i - 1] + num) === 10
                    @total_score += (num + @array_score[i + 1])
                    i += 1
                else
                    @total_score += num
                    i += 1
                end
            else
                @total_score += num
                i += 1
            end
        end
    end
    
    def total_score
        @total_score
    end

end