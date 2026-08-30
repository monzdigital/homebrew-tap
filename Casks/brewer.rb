cask "brewer" do
  version "1.0.0"
  sha256 "c9cba07275b20651e05f23a9e26781699c0e2fffca283215fff181222583d08c"

  url "https://github.com/monzdigital/brewer/releases/download/v#{version}/Brewer-#{version}.zip"
  name "Brewer"
  desc "Free native Homebrew manager with live brew output"
  homepage "https://monzdigital.github.io/brewer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
