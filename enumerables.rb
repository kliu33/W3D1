class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end

    def my_any?(&prc)
        count = 0
        self.my_each do |ele|
            count += 1 if prc.call(ele)
        end
        count > 0
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            count += 1 if prc.call(ele)
        end
        count == self.length
    end

    def my_flatten
        return [self] if !self.is_a?(Array)

        if self[0].is_a?(Array)
            self[0].my_flatten + self[1..-1].my_flatten
        else
            self[0] + self[1..-1].my_flatten
        end
    end

    
end