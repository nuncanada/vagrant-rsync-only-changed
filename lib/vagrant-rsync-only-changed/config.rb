require "vagrant"

module VagrantPlugins
  module RsyncOnlyChanged
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :rsync_on_startup

      def initialize
        @rsync_on_startup = UNSET_VALUE
      end

      def finalize!
        if @rsync_on_startup == UNSET_VALUE
          @rsync_on_startup = true
        else
          @rsync_on_startup = !!@rsync_on_startup
        end
      end

    end
  end
end
