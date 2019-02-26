# Magick Minimalistic

A ruby wrapper for ImageMagick command line. I have just added the gravity, crop
and resize options from image-magick. 
## Requirements

Imagemagick command-line tool has to be installed. You can check their official
website documentation: [website](www.imagemagick.org)

## Installation

Add the gem to your Gemfile:

`gem 'magick_minimalistic'`

## Usage

Here's a basic example:

```
require 'magick_minimalistic'

im = MagickMinimalistic::Configurator.new({source: 'file_source.png', config: {gravity: 'Center', crop: "50%", resize: "100x100"}, destiny: 'file_destiny.png'})
im.run
```
For the resize and crop options you can use a percentile or a number x number like:
```
crop: '50%'
resize: '100x100'
```
You can use any gravity option:
```
NorthWest, North, NorthEast, West, Center, East, SouthWest, South, SouthEast
```
