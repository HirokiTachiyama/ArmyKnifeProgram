#!/usr/bin/ruby

require_relative 'akp'

# config_file_path = "~/Documents/ArmyKnifeProgram/src/.akp.conf"
config_file_path = "~/Workspace/akp/src/.akp.conf"
akp = AKP.new
akp.main config_file_path
