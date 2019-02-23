Gem::Specification.new do |s|
  s.name        = 'magick_minimalistic'
  s.version     = '0.1.'
  s.summary     = 'Image manipulator with ImageMagick'
  s.description = <<-EOF
    Magick Minimalistic allows you to use some commands from the imagemagick's
    shell package with Ruby's hashes.
  EOF

  s.requirements << 'You must have ImageMagick installed'
  s.license     = 'MIT'

  s.authors     = ["YourSouLisMine"]
  s.email       = 'precichysim@gmail.com'
  s.homepage    = 'https://github.com/YourSouLi5Mine/magick_minimalistic'

  s.files       = Dir['lib/**/*', 'test/*', 'README.md']
  s.require_paths = ['lib']
end

