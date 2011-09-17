module Randy::Distributions
  class Weighted < Base

    def initialize(weight_map)
      @total_weight = weight_map.values.sum

      # sort descending and produce cumulative weight
      # 
      # 
      @sorted_map = weight_map.sort{|l,r| r.last <=> l.last }

      # normalize and sum up the probabilities, such each represents the cumulative 
      # weight of itself and the heigher probability choices before it
      previous_weight = 0.0
      @sorted_map.map! do |kv|
        normalized = kv.last.to_f / @total_weight
        new_weight = normalized + previous_weight
        previous_weight = new_weight
        [kv.first, new_weight]
      end
    end

    def next
      cutoff = rand
      @sorted_map.find{|kv| cutoff < kv.last}.first
    end
    
  end
end
