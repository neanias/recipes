#!/usr/bin/env ruby
# frozen_string_literal: true

if ARGV.empty?
  puts "USAGE: #{$PROGRAM_NAME} <POST TITLE> [TAG...]"
  exit
end

post_title, *tags = ARGV

unless Dir.exist?('_posts')
  puts 'Creating _posts dir...'
  Dir.mkdir('_posts')
end

require 'date'

post_title_filename = post_title.downcase.split(' ').join('-')

File.open("_posts/#{Date.today}-#{post_title_filename}.md", 'a') do |f|
  post_title_titlecase = post_title.split(/(\W)/).map(&:capitalize).join
  f.write("---\nlayout: post\ntitle: \"#{post_title_titlecase}\"\n")
  f.write("tags: #{tags.map(&:downcase).join(' ')}\n") unless tags.empty?
  f.write("---\n")
end
