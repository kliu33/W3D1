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
        flattened = []
        (0...self.length).each do |idx|
            if self[idx].is_a?(Array)
                flattened += self[idx].my_flatten
            else
                flattened += [self[idx]]
            end
        end
        flattened
    end

    def my_zip(*args)
        arr = Array.new(self.length) {Array.new(args.length+1, nil)}
        self.each_with_index do |ele, idx|
            arr[idx][0] = ele
        end

        args.each_with_index do |sub, idx|
            (0...self.length).each do |jdx|
            arr[jdx][idx+1] = sub[jdx]
            end
        end
        arr
    end

    def my_rotate(rotate=1)
        arr = self.clone
        if rotate > 0
            rotate.times do
                arr.push(arr.shift)
            end
        else
            (-rotate).times do
                arr.unshift(arr.pop)
            end
        end
        arr
    end

    def my_join(sep = "")
        str = ""
        (0...self.length).each do |i|
            if i != self.length - 1
                str += self[i] + sep 
            else
                str += self[i]
            end
        end
        str
    end

    def my_reverse
        arr = []
        (0...arr.length).each do |idx|
            arr += self[1..-1] + [self[0]]
        end
        arr
    end

end