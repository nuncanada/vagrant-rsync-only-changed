begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant rsync-only-changed plugin must be run within Vagrant."
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

      def self.usable(raise_error=false)
        
       # Build up the actual command to execute
        command = [
          "rsync",
          "--version"
        ].flatten

        r = Vagrant::Util::Subprocess.execute(*(command))

		version_re = /version (\d.\d.\d)/  
		m = version_re.match( r.stdout )  

        return true if Gem::Version.new(m[1]) >= Gem::Version.new('3.1.0')
        return false if !raise_error
        require_relative "errors"
        raise Errors::Rsync310RequiredError
      end

      action_hook "startup-rsync" do |hook|
        setup_i18n
        require_relative "action/startup_rsync"
        hook.after Vagrant::Action::Builtin::SyncedFolders, StartupRsync
      end

      command "rsync-auto-only-changed" do
	    is_usable = usable(raise_error=true)
        setup_i18n
        require_relative "command/rsync_auto"
        RsyncOnlyChangedAuto
      end

      config "rsync_only_changed" do
        require_relative "config"
        Config
      end
    end
  end
end
