# Vagrant::Rsync::Only::Changed

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/vagrant/rsync/only/changed`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Simply:

vagrant plugin install vagrant-rsync-only-changed

## Usage

vagrant rsync-auto-only-changed

You may trigger it automatically on vagrant up by setting the following configuration:

config.vm.rsync_only_changed.rsync_on_startup = true

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nuncanada/vagrant-rsync-only-changed.

