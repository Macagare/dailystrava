# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "DailyStrava"
  spec.version       = '1.0'
  spec.authors       = ["Christian Namberger"]
  spec.summary       = %q{tack your daily rides}
  spec.description   = %q{Keep track of your daily rides without adding them every single day.}
  spec.homepage      = ""

  spec.files         = ['lib/dailystrava.rb']
  spec.executables   = ['bin/dailystrava']
  spec.test_files    = ['test/tc_dailystrava.rb']
  spec.require_paths = ["lib"]
end
