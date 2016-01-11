# This file is required because Vagrant's plugin system expects
# an eponymous ruby file matching the rubygem.
#
# So this gem is called 'vagrant-rsync-only-changed' and thus vagrant tries
# to require "vagrant-rsync-only-changed"

require "vagrant-rsync-only-changed/plugin"

require "pathname"

module VagrantPlugins
  module RsyncOnlyChanged
    lib_path = Pathname.new(File.expand_path("../vagrant-rsync-only-changed", __FILE__))
    autoload :Errors, lib_path.join("errors")
    autoload :Errors, lib_path.join("helper")

    # This returns the path to the source of this plugin.
    #
    # @return [Pathname]
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end
  end
end
