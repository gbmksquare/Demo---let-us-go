## Fastlane - let us: Go!

This is a repository containing sample app projects used to present Fastlane on iOS conference "let us: Go!".



Each project directory also contains a git repository.



2017.04.01 👻

Seoul, Korea



### Commands

Install

```
xcode-select --install
sudo gem install fastlane
fastlane -v
rvm use system
sudo gem install fastlane -n /usr/local/bin
```

Fastlane .gitignore

```
fastlane/report.xml
fastlane/Preview.html
fastlane/screenshots
fastlane/test_output
Preview.html
```

Deliver
`fastlane deliver —skip_screenshots`

Snapshot

```
devices([
  "iPhone 6s"
])

languages([
  "en-US"
])
```

`clear_previous_screenshots true`

Demo - Produce

```
fastlane produce -i -u user@example.com
fastlane produce enable_services --homekit --healthkit -u user@example.com -a com.gbmksquare.DemoApp
fastlane produce disable_services --homekit --healthkit -u user@example.com -a com.gbmksquare.DemoApp
```

Demo - Pilot

```
fastlane pilot list -u user@example.com -a com.gbmksquare.DemoApp
fastlane pilot add -u user@example.com -a com.gbmksquare.DemoApp -f BumMo -l Koo -e ksquareatm@gmail.com
fastlane pilot list -u user@example.com -a com.gbmksquare.DemoApp
fastlane pilot find ksquareatm@gmail.com -u user@example.com -a com.gbmksquare.DemoApp
fastlane pilot remove ksquareatm@gmail.com -u user@example.com -a com.gbmksquare.DemoApp
fastlane pilot list -u user@example.com -a com.gbmksquare.DemoApp
```

Demo - Version & Git

```
ensure_git_status_clean
increment_version_number(bump_type: "minor")
increment_build_number
commit_version_bump
reset_git_repo(force: true)
```

Demo - Badge

```
version = "#{get_version_number}.#{get_build_number}"
badge(shield: "Version-#{version}-blue")
```

Demo - Snapshot
```
if UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT") {
    getSpecifiedPhotos()
} else {
    getRandomPhotos()
}
```
### LICENSE

Do whatever you want to do.