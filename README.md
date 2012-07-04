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

## Planet Fedora feed

Here's the source feed containing all the entries:

<http://graphitefriction.com/feed.atom>

The feed for Planet Fedora is first filtered based on the tag `fedora` using feedrinse:

<http://www.feedrinse.com/services/rinse/?rinsedurl=7bf3eff3b2f7ca66cd59ed4887b2913d>

It's then plugged into feedburner to track visits and served up to Planet Fedora:

<http://feeds.feedburner.com/graphitefriction-fedora>
