class Maude < Formula
  desc "Language based on Rewriting Logic"
  homepage "https://github.com/maude-lang/Maude"
  url "https://github.com/maude-lang/Maude/archive/refs/tags/Maude3.5.1.tar.gz"
  sha256 "3dce4f7b42fae2430a08ab2663303d1be244792bb3cc365c58cdb2f3f7bff170"
  license "GPL-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "flex" => :build
  depends_on "make" => :build

  depends_on "buddy"
  depends_on "gmp"
  depends_on "libsigsegv"
  depends_on "libtecla"
  depends_on "yices2"

  def install
    # Workaround since STATUS_* was renamed to YICES_STATUS_*
    system "sed", "-i", "s/STATUS_/YICES_STATUS_/g", "src/Mixfix/yices2_Bindings.cc"

    system "autoreconf", "-i"
    system "./configure", "--disable-silent-rules",
      "--datadir=#{share}/maude", *std_configure_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
