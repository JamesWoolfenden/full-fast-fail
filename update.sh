#!/usr/bin/env bash
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest
brew install tflint
pip3 install checkov -U
curl -sfL 'https://raw.githubusercontent.com/Checkmarx/kics/master/install.sh' | bash -s -- -b /usr/local/bin
