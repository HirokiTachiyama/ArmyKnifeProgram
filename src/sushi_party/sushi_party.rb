#!/usr/bin/ruby

require 'net/http'
require 'uri'

require './Line'



line = Line.new ("NwEj4r8EmdmhHPtnvhFXhnOsI3oQTSAjmOnaCIaRwVf")
msg = ARGV[0]

res = line.send(msg)
puts res.code
puts res.body

