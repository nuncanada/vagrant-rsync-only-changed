# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-rsync-only-changed/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-rsync-only-changed"
  spec.version       = VagrantPlugins::RsyncOnlyChanged::VERSION
  spec.authors       = ["Fl\xC3\xA1vio Botelho"]
  spec.email         = ["fezsentido@gmail.com"]

  spec.summary       = %q{Vagrant plugin to speed rsync-auto for big file trees}
  spec.description   = %q{Currently Vagrant rsync-auto command will always issue a full rsync when an event is detected during rsync-auto. With this plugin rsync will be called with the parameter --files-from with only the added/changed/removed files and/or directories listed. This will speed up a lot the command for big file trees.}
  spec.homepage      = "https://github.com/nuncanada/vagrant-rsync-only-changed"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
