graphitefriction.github.com
===========================

My personal website and blog, baked with Awestruct and published at <http://graphitefriction.com>.

## Preview the site locally

The following command will allow you to preview the site locally.

    awestruct -d

Visit: <http://localhost:4242>

## Deploy the site to github pages

The following command will clean build the site (`--force -g`) using the production profile (`-P production`), then deploy it to github pages (`--deploy`):

    awestruct -P production --force -g --deploy
