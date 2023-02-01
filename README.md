## KindeSDK generator usage

Be sure you have `npm` (nodejs) installed first.

### Generate the new version
Generator usage is pretty simple, just call the `./generate <path-to-kinde-api-spec>.yaml <path-to-generated-result>` and that's it!
Actually, you don't need to pass any arguments at all - default values are `kinde-mgmt-api-specs.yaml` and 
`./kinde-sdk-ruby` for `path-to-kinde-api-spec` and `path-to-generated-result` accordingly

### Mounting it into kinde_api gem
Be sure that [SDK path](https://github.com/kinde-oss/kinde-ruby-sdk/blob/main/kinde_api.gemspec#L3) in gemspec of kinde_api gem
is the same as `path-to-generated-result`. If it is different from what it already is (default value is `./kinde-sdk-ruby`),
the auto deletion from script will not work and you need to delete it manually first.

After generation step just copy output folder with generated result into kinde_api root path and run `rubocop -A` from kinde_api directory.

The only thing you'll probably want to do manually is just some `kinde-sdk-ruby/README.md` edits - you don't need to keep
auto-generated *installation* part at all.


### Best usage
**The slickiest** way to use the generator is to just copy `generate.sh` and `kinde-mgmt-api-specs.yaml` files into kinde_api root
and run `./generate.sh` with no arguments. In that case you'll need just to remove some lines from `kinde-sdk-ruby/README.md` (see previously) and
make a new commit.
