cask "brewer" do
  version "1.0.1"
  sha256 "3b6c323cdbf74d4a67ea806c99c97c3f671eb52ed569227b03c2363c4788b18e"

  url "https://github.com/monzdigital/brewer/releases/download/v#{version}/Brewer-#{version}.zip"
  name "Brewer"
  desc "Free native Homebrew manager with live brew output"
  homepage "https://monzdigital.github.io/brewer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Brewer.app"

  caveats <<~EOS
    This build is not yet notarized. If macOS blocks the first launch,
    right-click Brewer.app -> Open, or reinstall with:
      brew reinstall --cask --no-quarantine monzdigital/tap/brewer
  EOS

  zap trash: [
    "~/Library/Application Support/Brewer",
    "~/Library/Preferences/com.monz.brewer.plist",
    "~/Library/Saved Application State/com.monz.brewer.savedState",
  ]
end
