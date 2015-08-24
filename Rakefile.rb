require 'rubygems'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
  # you can run tests with specific tag by t.cucumber_opts = "--format pretty -t @search_offer"
end
