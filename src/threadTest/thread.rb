#!/usr/bin/ruby

t = Thread.new do
	puts "start thread"
	sleep 3
	puts "end thread"
end

puts "wating for the thread to complete"
t.join

puts "completed"

