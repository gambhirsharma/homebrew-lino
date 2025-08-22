class Lino < Formula
  desc "ETL tool to manage test data (Large Input Narrow Output)"
  homepage "https://github.com/CGI-FR/LINO"
  version "3.3.0"
  license "GPL-3.0"

  if OS.mac?
    url "https://github.com/CGI-FR/LINO/releases/download/v#{version}/LINO_#{version}_darwin_amd64.tar.gz"
    sha256 "04d1f7515d8e754f2614faef63cb289b9a3107140df52284ae79d0fb18e41351"
  elsif OS.linux? 
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/CGI-FR/LINO/releases/download/v#{version}/LINO_#{version}_linux_amd64.tar.gz"
        sha256 "3939db3e66219b0a1e002abf822443fed6261e67c1b0d031112d2db8009ef856"
      else
        url "https://github.com/CGI-FR/LINO/releases/download/v#{version}/LINO_#{version}_linux_386.tar.gz"
        sha256 "e1b37706c8fffa51b663257012b7d9a123272a19beffe39dfb2911528a2bf066"
      end
    end
  end

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
