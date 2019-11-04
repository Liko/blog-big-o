require 'benchmark'
require 'pry'




# data = (0..100_000_000)
# target = 1

# Benchmark.bmbm do |x|
#   x.report(:my_find) { data.find {|num| num > target } }
#   x.report(:my_bsearch) { data.bsearch {|num| num > target } }
# end

# data.bsearch {|num| num == target }

def getFirstFollowerInArrayBenchmark(accounts)

  Benchmark.bmbm do |x|
    accounts.each_with_index do |account, i|
      # binding.pry
      x.report(:"#{account[0]}") {getFirstFollowerInArray(account)}
    end
  end

end

def getFirstFollowerInArray(account)
  account[1][0]
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



getFirstFollowerInArrayBenchmark(accounts)



