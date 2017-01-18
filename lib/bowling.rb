class Bowling
        
    def initialize
        @score = 0
    end
    
    def add_score(pins)
        @score += pins
    end
    
    def total_score
        @score
    end

end