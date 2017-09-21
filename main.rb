#!/usr/bin/ruby

class Plugin
	def self.create(a, &block)
		block.call
	end
end

plugins = []
Dir.entries('plugins').each do |name|
	path = "plugins/#{name}"
	next if File.ftype(path) == 'directory' or %w(. ..).include? name
	require_relative path
end

loop do
	plugins.each{|plugin| plugin.call}
end
