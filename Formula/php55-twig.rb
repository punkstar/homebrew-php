require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Twig < AbstractPhp55Extension
  init
  homepage 'http://twig.sensiolabs.org/'
  url 'https://github.com/fabpot/Twig/archive/v1.15.1.tar.gz'
  sha1 '6431a8544f3a95f01d3e36d723daec037131629a'
  head 'https://github.com/fabpot/Twig.git'

  def install
    ENV.universal_binary if build.universal?

    Dir.chdir 'ext/twig' do
      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig
      system "make"
      prefix.install %w(modules/twig.so)
    end
    write_config_file unless build.include? "without-config-file"
  end
end
