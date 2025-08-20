class Buddy < Formula
  desc ""
  homepage "https://github.com/utwente-fmt/buddy"
  url "https://github.com/utwente-fmt/buddy/archive/refs/tags/v2.4.tar.gz"
  sha256 "361a86540b459d40faef4ec85a32ff153415e6530e8e6a23b2eb5008d15384ce"
  license ""

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build

  def install
    system "libtoolize"
    system "autoreconf", "-fvi"

    system "./configure", "--disable-silent-rules", *std_configure_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
