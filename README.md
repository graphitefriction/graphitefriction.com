graphitefriction.github.com
===========================

My personal website and blog, baked with Awestruct and published at <http://graphitefriction.com>.

## Preview the site locally

The following command will allow you to preview the site locally.

    awestruct -d

Visit: <http://localhost:4242>

If you are building the site on Linux and Awestruct fails to locate a JavaScript runtime, you can either:

1. install a node.js package or
2. set the following environment variable in your shell profile scripts (e.g., ~/.bash\_profile):

    export EXECJS_RUNTIME=SpiderMonkey

## Add and commit files

Add new files (such as a new blog entry or image):

    git add blog/YYYY-MM-DD-blog-title.textile

or all new files present in a directory (it only affects new files, skips files already committed)

    git add blog/

Commit all files marked to be committed, including new files that were just added:

    git commit -m 'your message here'

Commit all files that have changed, even if not marked to be committed:

    git commit -a -m 'your message here'

Make sure there are no files that are "untracked" or "modified":

    git status

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
