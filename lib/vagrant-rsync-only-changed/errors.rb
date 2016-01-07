require "vagrant"

module VagrantPlugins
  module RsyncOnlyChanged
    module Errors
      class VagrantRsyncOnlyChangedError < Vagrant::Errors::VagrantError
        error_namespace("vagrant_gatling_rsync.errors")
      end

      class OSNotSupportedError < VagrantRsyncOnlyChangedError
        error_key(:os_not_supported)
      end

      class Vagrant15RequiredError < VagrantRsyncOnlyChangedError
        error_key(:vagrant_15_required)
      end
    end
  end
end
