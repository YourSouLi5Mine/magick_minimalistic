module MagickMinimalistic
  class Configurator
    require_relative './magick_minimalistic/option'
    require_relative './magick_minimalistic/sanitize'
    require_relative './magick_minimalistic/shell'

    include Option 
    include Sanitize
    include Shell

    attr_accessor :source, :config, :destiny

    def initialize(params = {})
      @source = params[:source]
      @config = params[:config] ? params[:config] : {}
      @destiny = params[:destiny]
    end

    def run
      super(command)
    end

    def command 
      cmd = 'magick '
      puts 'Checking source file...'
      cmd += "#{Sanitize::filename(source, true)} "
      puts 'Checking attributes...'
      cmd += "#{Sanitize::attributes(config)} "
      puts 'Checking destiny file...'
      cmd += "#{Sanitize::filename(destiny, false)}"
      cmd
    end
  end
end
