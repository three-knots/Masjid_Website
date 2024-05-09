## Testing Strategy

We are using docker to create a local environment for testing our website before merging changes to the main branch. There is a prebuilt docker image that we pull down and mount our local files to in order to generate a local test environment.

## Developer Flow

Download Docker for your local CLI environment.
[Docker Engine (lightweight)](https://docs.docker.com/engine/install/)
[Docker Desktop (GUI)](https://docs.docker.com/desktop/install/windows-install/)

Download the docker image we are going to be using for testing
`docker pull bretfisher/jekyll-serve`

Change to your local directory where you have your github repo files
`cd {localdirectory}/Masjid_Website`

Serve page locally using
`docker run -p 4000:4000 -v $(pwd):/site bretfisher/jekyll-serve`
