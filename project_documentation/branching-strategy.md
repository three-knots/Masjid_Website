# Branching Strategy

We're using ***trunk-based development***. In short, the strategy is to use a single branch with feature branches being merged directly in (as opposed to something like Git Flow, which has a lot of branching conventions and overhead).

## Developer Flow

Pull down the master branch

Create a new branch for your feature. Give it a relevant and easily identifiable name.

My recommendation is to append the jira story so we can easily find the related task. 

 `{jira story}/{your-feature-name}`

An example with this naming scheme, creating the branch I used to commit this documentation. 
`git checkout -b HMS-9/branching-methodology-documentation`

### Test your feature in your local dev environment
TODO: Setting up a local docker test environment

### Create a pull request
ex: `git push origin HMS-9/branching-methodology-documentation`

### Merge pull request
Pull requests are reviewed by the team. Once approved by at least one engineer who was not part of the feature development, changes will merged into the master branch.