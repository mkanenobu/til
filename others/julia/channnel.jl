function producer(c::Channel)
  put!(c, "start")
  for n = 1:4
    put!(c, 2n)
  end
  put!(c, "stop")
end

ch = Channel(producer)
println(take!(ch))
println(take!(ch))
println(take!(ch))
println(take!(ch))
println(take!(ch))
println(take!(ch))
# error, can't access 'closed channel
# println(take!(ch))
