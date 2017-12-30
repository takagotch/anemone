require 'forwardable'

class MyQueue
  extend Forwardable

  def initialize
    @q = []
  end

  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  def_delegators :@q, :clear, :first, :push, :shift, :size
end

q = MyQueue.new
q.enq 1, 2, 3, 4, 5
q.push 6

q.shift
while q.size > 0
  puts q.deq
end

q.enq "tits",  "sex", "blowjob"
puts q.first
q.clear
puts q.first

class MyBadQueue < Array
  alias enq push
  alias deq shift
end

q = MyBadQueue.new
q.enq 1, 2, 3, 4, 5
q.push 6

q.shift
while q.size > 0
  puts q.first
end

q.enq "tits", "sex", "blowjob"
puts q.first
q.clear
puts q[0]

