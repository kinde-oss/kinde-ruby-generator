ARG1=${1:-'kinde-mgmt-api-specs.yaml'}
ARG2=${2:-'./kinde-sdk'}

npm install @openapitools/openapi-generator-cli -g

rm -rf $ARG2

npx @openapitools/openapi-generator-cli generate -i $ARG1 -g ruby -o $ARG2 \
  --skip-validate-spec --additional-properties=gemAuthor=Kinde,gemName=kinde_sdk,moduleName=KindeSdk,useAutoload=true

rm $ARG2/Rakefile
rm $ARG2/git_push.sh
rm $ARG2/kinde_sdk.gemspec
rm $ARG2/.rubocop.yml
rm $ARG2/Gemfile
rm $ARG2/.gitlab-ci.yml
rm $ARG2/.travis.yml
rm $ARG2/.openapi-generator-ignore
rm -rf $ARG2/.openapi-generator

sed -i 's/@default_headers = {/@default_headers = {\n        "Accept-Encoding" => "gzip, deflate, br",/' "$ARG2/lib/kinde_sdk/api_client.rb"

ruby -e "p='$ARG2/README.md';d=File.read('$ARG2/README.md');File.write(p, \"## Getting Started#{d.split('Please follow the [installation](#installation) procedure and then run the following code:')[1]}\")"

rubocop -A
