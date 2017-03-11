class SudoTouchId < Formula
  desc "A fork of `sudo` with Touch ID support."
  homepage "https://github.com/mattrajca/sudo-touchid"
  url "https://github.com/mattrajca/sudo-touchid", :using => :git

  depends_on :macos => :sierra
  depends_on :xcode => :build

  def install
    xcodebuild
    bin.install 'build/Release/sudo'
  end

  def caveats; <<-EOS.undent
        sudo requires appropriate owner and mode:

        /usr/bin/sudo chown root:wheel #{opt_prefix}/bin/sudo
        /usr/bin/sudo chmod 4755 #{opt_prefix}/bin/sudo

        You can also set up your PATH by adding export PATH=#{opt_prefix}/bin:$PATH to .bashrc
    EOS
  end
end
