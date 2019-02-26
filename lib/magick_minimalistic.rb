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
      @source = Sanitize::filename(source, true) 
      cmd += "#{source} "
      puts 'Checking attributes...'
      attrs = Sanitize::attributes(config)
      @config = attrs[0]
      cmd += "#{attrs[1]} "
      puts 'Checking destiny file...'
      @destiny = Sanitize::filename(destiny, false)
      cmd += "#{destiny}"
      cmd
    end
  end
end
