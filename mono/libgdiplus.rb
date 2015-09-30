require 'formula'

class Libgdiplus < Formula
  homepage 'http://www.mono-project.com/Libgdiplus'
  url 'https://github.com/mono/libgdiplus/archive/3.12.tar.gz'
  sha256 '7eadc5105c6352d456c5f8699dc89260bf402e82ce6668e7e0c625519f9e5b44'

  depends_on 'gettext'
  depends_on 'libtiff'
  depends_on 'libexif'
  depends_on 'glib'

  # Fix compilation against libpng1.5. See:
  # https://bugs.gentoo.org/355113
  # https://bugzilla.novell.com/show_bug.cgi?id=666583
  #def patches
  #  { :p0 =>
  #  'http://cvsweb.se.netbsd.org/cgi-bin/bsdweb.cgi/~checkout~/pkgsrc/graphics/libgdiplus/patches/patch-aa?rev=1.9;content-type=text%2Fplain'
  #  }
  #end if MacOS.lion?

  def install
    ENV.x11
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
