class Maude < Formula
  desc "Language based on Rewriting Logic"
  homepage "https://github.com/maude-lang/Maude"
  url "https://github.com/maude-lang/Maude/archive/refs/tags/Maude3.5.1.tar.gz"
  sha256 "3dce4f7b42fae2430a08ab2663303d1be244792bb3cc365c58cdb2f3f7bff170"
  license "GPL-2.0"

  depends_on "buddy"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "make" => :build

  def install
    system "autoreconf", "-i"
    system "./configure", "--disable-silent-rules",
      "--datadir=#{share}/maude", *std_configure_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
