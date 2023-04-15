ARG1=${1:-'kinde-mgmt-api-specs.yaml'}
ARG2=${2:-'./kinde_api'}

npm install @openapitools/openapi-generator-cli -g

wget https://kinde.com/api/kinde-mgmt-api-specs.yaml --output-document=$ARG1

rm -rf $ARG2

npx @openapitools/openapi-generator-cli generate -i $ARG1 -g ruby -o $ARG2 \
  --skip-validate-spec --additional-properties=gemAuthor=Kinde,gemName=kinde_api,moduleName=KindeApi,useAutoload=true

rm $ARG2/Rakefile
rm $ARG2/git_push.sh
rm $ARG2/kinde_api.gemspec
rm $ARG2/.rubocop.yml
rm $ARG2/Gemfile
rm $ARG2/.gitlab-ci.yml
rm $ARG2/.travis.yml
rm $ARG2/.openapi-generator-ignore
rm -rf $ARG2/.openapi-generator

cp ./files/api_client.rb $ARG2/lib/kinde_api/api_client.rb
cp ./files/api_client_spec.rb $ARG2/spec/api_client_spec.rb

ruby -e "p='$ARG2/README.md';d=File.read('$ARG2/README.md');File.write(p, \"## Getting Started#{d.split('Please follow the [installation](#installation) procedure and then run the following code:')[1]}\")"

rubocop -A

rm $ARG1
