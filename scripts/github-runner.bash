# Install jq
# apt-get install jq -y
# Get token from 
ls -la
exit 0

curl -O https://storage.googleapis.com/artifacts.playground.napptive.dev/installer.sh && bash installer.sh

playground login --pat

RESPONSE=$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/orgs/$ORG/actions/runners/registration-token)

echo $RESPONSE

TOKEN=$(echo $RESPONSE | jq -r '.token')

sed -i "s/__TOKEN__/$TOKEN/g" param-file.yaml
sed -i "s/__ORGANIZATION__/$ORG/g" param-file.yaml

playground env use "$PLAYGROUND_ACCOUNT_NAME/$ENV"

# check if previous cmd throw error
if [ $? -ne 0 ]; then
  playground env create "$PLAYGROUND_ACCOUNT_NAME/$ENV"
  echo "ENVIRONMENT CREATED: $PLAYGROUND_ACCOUNT_NAME/$ENV"
fi

# Deploy Github runner
playground catalog deploy napptive/github-runner:2.298.2 --setParametersFromFile param-file.yaml
