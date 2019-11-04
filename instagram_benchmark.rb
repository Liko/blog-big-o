require 'benchmark'

# these two lines log the console output to a file
$stdout = File.new('benchmark.log', 'w')
$stdout.sync = true

def shuffle_accounts(accounts)
  accounts.each do |account|
    account[1].shuffle!
  end
end

def remove_big_accounts(accounts) 
  #remove at your own risk - some of these will take years to run, no joke!
  accounts.delete(:ja)
  accounts.delete(:duke)
  accounts.delete(:kk)
end

def performBenchmark(accounts, complexity)
  Benchmark.bmbm do |x|
    accounts.each do |account|
      followers = account[1]
      x.report(:"#{account[0]}") {
        selectMethodForComplexity(complexity, followers)
      }
    end
  end
end

def selectMethodForComplexity(complexity, followers)
  if complexity == "O(1)"
    getFirstFollowerInArray(followers)
  elsif complexity == "O(log n)"
    retrieveRecentFollowerLogarithmic(followers)
  elsif complexity == "O(n)"
    retrieveRecentFollowerLinear(followers)
  elsif complexity == "O(n log n)"
    mergesort(followers)
  elsif complexity == "O(n^2)"
    introduceFollowersToEachother(followers)
  end
end

def getFirstFollowerInArray(followers)
  followers.first
end

def retrieveRecentFollowerLogarithmic(followers)
  target = followers.count * 0.9
  followers.bsearch {|follower| follower == target}
end

def retrieveRecentFollowerLinear(followers)
  target = followers.count * 0.9
  followers.find {|follower| follower == target}
end

def introduceFollowersToEachother(followers)
  followers.each do |follower_introducer|
    followers.each do |follower_introducee|
      #simulating introduction of a follower to each other follower
      follower_introducer == follower_introducee
    end
  end
end

def mergesort(array) # borrowed from https://gist.github.com/aspyct/3433278
  if array.count <= 1
      # Array of length 1 or less is always sorted
      return array
  end

  # Apply "Divide & Conquer" strategy

  # 1. Divide
  mid = array.count / 2
  part_a = mergesort array.slice(0, mid)
  part_b = mergesort array.slice(mid, array.count - mid)

  # 2. Conquer
  array = []
  offset_a = 0
  offset_b = 0
  while offset_a < part_a.count && offset_b < part_b.count
      a = part_a[offset_a]
      b = part_b[offset_b]

      # Take the smallest of the two, and push it on our array
      if a <= b
          array << a
          offset_a += 1
      else
          array << b
          offset_b += 1
      end
  end

  # There is at least one element left in either part_a or part_b (not both)
  while offset_a < part_a.count
      array << part_a[offset_a]
      offset_a += 1
  end

  while offset_b < part_b.count
      array << part_b[offset_b]
      offset_b += 1
  end

  return array
end

#generating arrays with unique values, of different size
accounts = {
  :fish => [*1..10],
  :me => [*1..100],
  :dad => [*1..1_000],
  :dog => [*1..10_000],
  :gf => [*1..100_000],
  :ja => [*1..1_000_000],
  :duke => [*1..10_000_000],
  :kk => [*1..100_000_000]
  }

complexities = [
  "O(1)",
  "O(log n)",
  "O(n)",
  "O(n log n)",
  "O(n^2)"
]

complexities.each do |complexity|
  puts "\n\nperforming #{complexity} benchmark \n\n"
  shuffle_accounts(accounts) if complexity == "O(n log n)"
  remove_big_accounts(accounts) if complexity == "O(n^2)"
  performBenchmark(accounts, complexity)
end