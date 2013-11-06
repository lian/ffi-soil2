require 'ffi'

module SOIL2
  extend FFI::Library
  ffi_lib 'soil2'
  attach_function :load_OGL_texture, :SOIL_load_OGL_texture, [:string, :int, :uint, :uint], :uint

  SOIL_LOAD_AUTO = 0
  SOIL_LOAD_L = 1
  SOIL_LOAD_LA = 2
  SOIL_LOAD_RGB = 3
  SOIL_LOAD_RGBA = 4

  SOIL_CREATE_NEW_ID = 0

  SOIL_FLAG_POWER_OF_TWO = 1
  SOIL_FLAG_MIPMAPS = 2
  SOIL_FLAG_TEXTURE_REPEATS = 4
  SOIL_FLAG_MULTIPLY_ALPHA = 8
  SOIL_FLAG_INVERT_Y = 16
  SOIL_FLAG_COMPRESS_TO_DXT = 32
  SOIL_FLAG_DDS_LOAD_DIRECT = 64
  SOIL_FLAG_NTSC_SAFE_RGB = 128
  SOIL_FLAG_CoCg_Y = 256
  SOIL_FLAG_TEXTURE_RECTANGLE = 512
  SOIL_FLAG_PVR_LOAD_DIRECT = 1024
  SOIL_FLAG_ETC1_LOAD_DIRECT = 2048
  SOIL_FLAG_GL_MIPMAPS = 4096

  def self.load_texture(filename, type=nil, flags=nil)
    flags ||= SOIL_FLAG_MIPMAPS | SOIL_FLAG_INVERT_Y | SOIL_FLAG_NTSC_SAFE_RGB | SOIL_FLAG_COMPRESS_TO_DXT
    type  ||= SOIL_LOAD_AUTO
    r = load_OGL_texture(filename, type, SOIL_CREATE_NEW_ID, flags)
    p [r, filename, type, flags]
    r
  end

  @loaded_textures = {}

  def self.cache_load_texture(filename, name=nil, type=nil, flags=nil)
    name = name || filename
    @loaded_textures[name] ||= load_texture(filename, type, flags)
    @loaded_textures[name]
  end

  def self.texture_id(name); @loaded_textures[name]; end
end

if $0 == __FILE__
  # needs an actice opengl context
  p SOIL2.load_texture("data/textura cor-2.png")
  p SOIL2.cache_load_texture("data/textura cor-2.png", "body-texture")
  p SOIL2.texture_id("body-texture")
end
