begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant gatling rsync plugin must be run within Vagrant."
end

module VagrantPlugins
  module RsyncOnlyChanged
    class Plugin < Vagrant.plugin(2)
      name "Rsync only the changed files and/or directories"
      description <<-DESC
      Rsync large project directories to your Vagrant VM without incurring the delay from the rsync filetree comparison.
      DESC

      # This initializes the internationalization strings.
      def self.setup_i18n
        I18n.load_path << File.expand_path("locales/en.yml", RsyncOnlyChanged.source_root)
        I18n.reload!
      end

      action_hook "startup-rsync" do |hook|
        setup_i18n
        require_relative "action/startup_rsync"
        hook.after Vagrant::Action::Builtin::SyncedFolders, StartupRsync
      end

      command "rsync-auto-only-changed" do
        setup_i18n

        require_relative "command/rsync_auto"
        RsyncOnlyChangedAuto
      end

      config "gatling" do
        require_relative "config"
        Config
      end
    end
  end
end
