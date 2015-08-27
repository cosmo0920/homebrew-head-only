class FluentBit < Formula
  desc "Data Collector for IoT"
  homepage "http://fluentbit.io/"
  head "https://github.com/fluent/fluent-bit.git"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DWITH_IN_MEM=OFF", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("fluent-bit --version")
    assert_match /Fluent Bit/, output
  end
end
