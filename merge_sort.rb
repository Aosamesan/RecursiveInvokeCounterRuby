require './recursive_counter.rb'

def is_sorted(list)
  previous = list[0]
  list.each {|item|
    if previous > item
      return false
    end
    previous = item
  }
  return true
end

counter = RecursiveCounter.create_recursive_counter do |invoker, list, s, e|
  unless e - s < 2
    mid = (s + e) / 2

    invoker.invoke(list, s, mid)
    invoker.invoke(list, mid, e)

    left = s
    right = mid
    q = []

    while left < mid and right < e
      if list[left] < list[right]
        q << list[left]
        left = left + 1
      elsif
        q << list[right]
        right = right + 1
      end
    end

    while left < mid
      q << list[left]
      left = left + 1
    end

    while right < e
      q << list[right]
      right = right + 1
    end

    idx = s
    q.each {|item|
      list[idx] = item
      idx = idx + 1
    }
  end
end


l = [8, 4, 5, 3, 7, 6, 1, 2]
counter.invoke(l, 0, l.length)
puts "list : #{l}, sorted? : #{is_sorted(l)}, count : #{counter.count}"