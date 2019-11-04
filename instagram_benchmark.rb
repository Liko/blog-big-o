require 'benchmark'
require 'pry'

# data = (0..100_000_000)
# target = 1

# Benchmark.bmbm do |x|
#   x.report(:my_find) { data.find {|num| num > target } }
#   x.report(:my_bsearch) { data.bsearch {|num| num > target } }
# end

# data.bsearch {|num| num == target }

def performBenchmark(accounts, complexity)

  Benchmark.bm do |x|
    accounts.each do |account|
      followers = account[1]
      x.report(:"#{account[0]}") {
        if complexity == "constant"
          getFirstFollowerInArray(followers)
        elsif complexity == "linear"
          retrieveRecentFollowerLinear(followers)
        elsif complexity == "logarithmic"
          retrieveRecentFollowerLogarithmic(followers)
        elsif complexity == "quadratic"
          introduceFollowersToEachother(followers)
        end
      }
    end
  end
end

def getFirstFollowerInArray(followers)
  followers[0]
end

def retrieveRecentFollowerLinear(followers)
  target = followers.count*0.9
  followers.find {|follower| follower == target}
end

def retrieveRecentFollowerLogarithmic(followers)
  target = followers.count*0.9
  followers.bsearch {|follower| follower == target}
end

def introduceFollowersToEachother(followers)
  followers.each do |follower_introducing|
    followers.each do |follower_to_meet|
      follower_introducing == follower_to_meet
    end
  end
end

# fish = [*1..1]
# me   = [*1..100]
# dad  = [*1..10_000]
# ja   = [*1..1_000_000]
# kk   = [*1..100_000_000]

# accounts = {
#   "fish" => fish,
#   "me" => me,
#   "dad" => dad,
#   "ja" => ja,
#   "kk" => kk
#  }

fish = [*1..1]
me   = [*1..100]
dad  = [*1..10_000]

accounts = {
  :fish => fish,
  :me => me,
  :dad => dad
}

algorithms = [
  "constant",
  "linear",
  "logarithmic",
  "quadratic"
]


#O(1)
puts "\n\nperforming constant benchmark \n\n"
performBenchmark(accounts, "constant")

#O(n)
puts "\n\nperforming linear benchmark \n\n"
performBenchmark(accounts, "linear")

#O(log n)
puts "\n\nperforming logarithmic benchmark \n\n"
performBenchmark(accounts, "logarithmic")

#O(n**2)
puts "\n\nperforming quadratic benchmark \n\n"
performBenchmark(accounts, "quadratic")









