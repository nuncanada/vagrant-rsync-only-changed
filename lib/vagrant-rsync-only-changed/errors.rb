require "vagrant"

module VagrantPlugins
  module RsyncOnlyChanged
    module Errors
      class VagrantRsyncOnlyChangedError < Vagrant::Errors::VagrantError
        error_namespace("vagrant_rsync_only_changed.errors")
      end

      class OSNotSupportedError < VagrantRsyncOnlyChangedError
        error_key(:os_not_supported)
      end

      class Vagrant15RequiredError < VagrantRsyncOnlyChangedError
        error_key(:vagrant_15_required)
      end

      class Rsync310RequiredError < VagrantRsyncOnlyChangedError
        error_key(:rsync_310_required)
      end
    end
  end
end
