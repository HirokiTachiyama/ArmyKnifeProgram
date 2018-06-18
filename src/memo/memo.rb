#!/usr/bin/ruby


class Memo

	def memo_main
		files = Dir::entries "/home/student/Documents/"

		files.each do |file|
			puts file
		end
	end
end
memo = Memo.new
memo.memo_main




