# Github self-hosted runner deployment on Napptive

This repository contains example of on-demand deployment of self-hosted GitHub runner on Napptive.

**Important**:

The below has to be added to your Github organization secrets.

1. PLAYGROUND_PAT = Napptive Playground Personal Access Token.
2. GH_PAT = Github personal access Token.

**Steps to use**:

1. Enable actions to your organization's repositories (if not already).
2. Go to actions tab and select Github Runner Deployer.
3. Select run workflow and provide required inputs (playground username and environment name (optional)).
4. Run workflow.