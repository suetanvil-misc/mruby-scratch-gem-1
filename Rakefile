# Rakefile for gem development.

MRUBY_CONFIG = File.expand_path("test_build_config.rb")
MRUBY_VERSION = "master"
#MRUBY_VERSION = "3.0.0"

file :mruby do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git"
  if MRUBY_VERSION != 'master'
    Dir.chdir 'mruby' do
      sh "git fetch --tags"
      rev = %x{git rev-parse #{MRUBY_VERSION}}
      sh "git checkout #{rev}"
    end
  end
end

desc "test"
task :test => :mruby do
  rm_rf 'test_build_config.rb.lock' # lockfile can mask the bug
  sh "cd mruby && rake all test MRUBY_CONFIG=#{MRUBY_CONFIG}"
end

desc "cleanup"
task :clean do
  sh "cd mruby && rake deep_clean" if File.directory?('mruby')
end

task :default => :compile

desc "thorough cleanup; gemdev only"
task :spotless => :clean do
  sh "rm -rf mruby *.lock"
end
