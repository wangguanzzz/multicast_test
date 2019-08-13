for arg in ARGV
    puts arg
    File.open(arg, "r") do |f|
        expect_packages = []
        packages = []
        min = []
        max = []
        aver = []

        f.each_line do |line|
          if line.include? "We have receive msg number"
            expect_packages << line.scan(/\d+/).last.to_i
            packages << line.scan(/\d+/).first.to_i
          end

          if line.include? "The max delay"
            max << line.scan(/\d+/).first.to_i
          end

          if line.include? "The minimum delay"
            min << line.scan(/\d+/).first.to_i
          end

          if line.include? "The average delay"
            aver << line.scan(/\d+/).first.to_i
          end

        end
        ploss =  1- (packages.inject(0){|sum,x| sum + x }).to_f / expect_packages.inject(0){|sum,x| sum + x }
        max_av = max.inject(0){|sum,x| sum + x }/max.size
        min_av = min.inject(0){|sum,x| sum + x }/min.size
        aver_av = aver.inject(0){|sum,x| sum + x }/aver.size
        puts "ploss: #{ploss} , max: #{max_av}, min: #{min_av}, aver: #{aver_av}"
        
      end
 end