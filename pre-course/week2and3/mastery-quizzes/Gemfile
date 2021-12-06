# frozen_string_literal: true
source "https://rubygems.org"

ruby '2.7.3'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rake"
gem "httparty"
gem "safe_ruby"
gem "rubocop", '1.18.3'
gem 'mastery_answer_code_quality', :git => 'https://github.com/makersacademy/mastery_answer_code_quality.git'

group :test do
  gem "timecop"
  gem "rspec"
  gem "webmock"
end
