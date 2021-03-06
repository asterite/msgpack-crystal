require "msgpack"
# gem install msgpack

def test_pack(name, count, data)
  t = Time.now
  print name
  res = 0
  count.times do |i|
    res += data.to_msgpack.bytesize
  end
  puts " = #{res}, #{Time.now - t}"
end

t = Time.now

test_pack("small string", 1000000, "a" * 200)
test_pack("big string", 10000, "a" * 200000)
test_pack("hash string string", 10000, (0..1000).reduce({}) { |h, i| h["key#{i}"] = "value#{i}"; h })
test_pack("hash string float64", 10000, (0..1000).reduce({}) { |h, i| h["key#{i}"] = i / 10.0; h })
test_pack("array of strings", 10000, Array.new(1000) { |i| "data#{i}" })
test_pack("array of floats", 20000, Array.new(3000) { |i| i / 10.0 })

puts "Summary time: #{Time.now - t}"
