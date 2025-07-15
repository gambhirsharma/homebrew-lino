class Lino < Formula
  desc "ETL tool to manage test data (Large Input Narrow Output)"
  homepage "https://github.com/CGI-FR/LINO"
  version "4.0.0"
  license "GPL-3.0"

  url "https://github.com/gambhirsharma/LINO/releases/download/v4.0.0/LINO_4.0.0_darwin_amd64.tar.gz"
  sha256 "042ae485034e9ac22b6988bd39076fd37d8826b24685866fe2c830df9d011f12"

  def install

    chmod "+x", "lino"
    bin.install "lino"

    generate_completions_from_executable(bin/"lino", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lino --version")
    assert_match "Usage:", shell_output("#{bin}/lino --help")
  end
end
