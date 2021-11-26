
# Set to false to fix the build
BAD = true

MRuby::Gem::Specification.new('mruby-process2-gem-decoy-bug') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Chris Reuter'

  if BAD
    # This case doesn't work
    spec.add_dependency('mruby-process2')
  else
    # but this case does
    spec.add_dependency('mruby-process', :github => 'katzer/mruby-process')
  end

end
