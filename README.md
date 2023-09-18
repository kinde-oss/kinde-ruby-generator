# Kinde Ruby generator

The generator for the [Kinde Ruby SDK](https://github.com/kinde-oss/kinde-ruby-sdk).

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com) [![Kinde Docs](https://img.shields.io/badge/Kinde-Docs-eee?style=flat-square)](https://kinde.com/docs/developer-tools) [![Kinde Community](https://img.shields.io/badge/Kinde-Community-eee?style=flat-square)](https://thekindecommunity.slack.com)

## Overview

This generator creates an SDK in Ruby that can authenticate to Kinde using the Authorization Code grant or the Authorization Code with PKCE grant via the [OAuth 2.0 protocol](https://oauth.net/2/). It can also access the [Kinde Management API](https://kinde.com/api/docs/#kinde-management-api) using the client credentials grant.

Also, see the SDKs section in Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/main/.github/CONTRIBUTING.md).

## Usage

### Requirements

You will need the following tools to be able to generate the SDK.

#### NPM
This generator requires the [Node Package Manager (NPM)](https://nodejs.org/en/download) to be installed and added to your path.

#### Ruby
The generator also requires [Ruby](https://www.ruby-lang.org/en/documentation/installation/) to be installed, in addition please ensure that you have the [Rubocop](https://rubocop.org/) gem installed
and available in your `PATH`.  

#### OpenJDK
This generator makes use of the OpenAPI Generator CLI via the NPM package [@openapitools/openapi-generator-cli](https://www.npmjs.com/package/@openapitools/openapi-generator-cli), which
requires that you have [OpenJDK](https://openjdk.org/install/) installed and the `JAVA_HOME` variable
added to your path.

### Initial set up

1. Clone the repository to your machine:

   ```bash
   git clone https://github.com/kinde-oss/kinde-ruby-generator.git
   ```

2. Go into the project:

   ```bash
   cd kinde-ruby-generator
   ```

3. Install the OpenAPI Generator tool:

   https://openapi-generator.tech/docs/installation

### SDK generation

Run the following command to generate the SDK:

```bash
./generate.sh <path-to-kinde-api-spec>.yaml <path-to-generated-result>
```

The `<path-to-kinde-api-spec>.yaml` and `path-to-generated-result` are optional arguments whose default values are `kinde-mgmt-api-specs.yaml` and `./kinde_api` respectively. `kinde-mgmt-api-specs.yaml` will be automatically be downloaded from https://kinde.com/api/kinde-mgmt-api-specs.yaml.

The easiest way to use the generator is to just:
- Copy `generate.sh` and `files` folder into `kinde_sdk` gem filepath root
- Run `./generate.sh` with no arguments.
- After all you'll need to remove `generate.sh` and `files`, then add all the new files if any with `git add .` and make a new commit into `kinde_sdk` repo.

#### Mounting into kinde_sdk gem

Be sure that [SDK path](https://github.com/kinde-oss/kinde-ruby-sdk/blob/main/kinde_sdk.gemspec#L3) in gemspec of `kinde_sdk` gem is the same as `path-to-generated-result`. If it is different from what it already is (default value is `./kinde-sdk`), the auto deletion from the generation script will not work and you will need to delete it manually first. After the generation step just copy the output folder with the generated result into `kinde_sdk` root path and run `rubocop -A` from `kinde_sdk` directory. The only thing you'll probably want to do manually is just some `kinde-sdk/README.md` edits - you don't need to keep the auto-generated *installation* part at all.

**Note:** The API specifications should always point to Kinde's hosted version: https://kinde.com/api/kinde-mgmt-api-specs.yaml. This is set via the ` -i` option in the [OpenAPI Generator CLI](https://openapi-generator.tech/docs/usage/), for example:

```bash
openapi-generator-cli generate -i https://kinde.com/api/kinde-mgmt-api-specs.yaml
```

The SDK gets outputted to: `<path-to-generated-result>`, which you can enter via:

```bash
cd <path-to-generated-result>
```

## SDK documentation

[Ruby SDK](https://kinde.com/docs/developer-tools/ruby-sdk)


## Development

The instructions provided in the "Usage" section above are sufficient to get you started.

## Contributing

Please refer to Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/489e2ca9c3307c2b2e098a885e22f2239116394a/CONTRIBUTING.md).

## License

By contributing to Kinde, you agree that your contributions will be licensed under its MIT License.
