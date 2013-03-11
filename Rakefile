require 'rubygems'

task :default => :preview

desc "Preview the site locally in development mode"
task :preview, [:flags] do |t, args|
  cmd = "bundle exec awestruct -d"
  if (args[:flags])
    cmd += " " + args[:flags]
  end
  system cmd
end

desc "Push local commits to origin/develop"
task :push do
  system "git push origin develop"
end

desc "Generate and publish site to production (GitHub Pages) from home"
task :deploy => :push do
  system "bundle exec awestruct -P production --force -g --deploy"
end

desc "Generate site from Travis CI and, if not a pull request, publish site to production (GitHub Pages)"
task :travis do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'] == '1'
    system "bundle exec awestruct -P production -g"
    next
  end

  # would be good to calculate the https URL rather than hard code it
  # TODO use the Git library for these commands rather than system
  system "git remote set-url --push origin https://github.com/graphitefriction/graphitefriction.github.com.git"
  system "git fetch --all -q"
  system "git show-ref"
  system "git config credential.helper 'store --file=.git/credentials'"
  # CREDENTIALS assigned by a Travis CI Secure Environment Variable
  # see http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables for details
  File.open('.git/credentials', 'w') {|f| f.write(ENV['CREDENTIALS']) }
  set_pub_dates 'develop'
  system "git branch master origin/master"
  system "bundle exec awestruct -P production -g --deploy"
  File.delete '.git/credentials'
end

desc "Assign publish dates to new blog entries"
task :setpub do
  set_pub_dates 'develop'
end

def set_pub_dates(branch)
  require 'tzinfo'
  require 'git'
  local_tz = IO.readlines('_config/site.yml').find {|l| l.start_with?('local_tz: ') }.chomp.sub('local_tz: ', '')
  local_tz = TZInfo::Timezone.get(local_tz)

  repo = nil

  Dir['blog/*.adoc'].select {|e| !e.start_with? 'blog/_'}.each do |e|
    lines = IO.readlines e
    header = lines.inject([]) {|collector, l|
      break collector if l.chomp.empty?
      collector << l 
      collector
    }
  
    do_commit = false
    if !header.detect {|l| l.start_with?(':revdate: ') || l.start_with?(':awestruct-draft:') }
      revdate = Time.now.utc.getlocal(local_tz.current_period.utc_total_offset)
      lines[2] = "#{revdate.strftime('%Y-%m-%d')}\n"
      lines.insert(3, ":revdate: #{revdate}\n")
      File.open(e, 'w') {|f|
        f.write(lines.join)
      }
      if !repo
        repo = Git.open('.')
        b = repo.branch(branch)
        b.remote = 'origin/develop'
        b.create
        b.checkout
      end
      repo.add(e)
      repo.commit "Set publish date of post #{e}"
      do_commit = true
    end
  
    if do_commit
      repo.push('origin', branch)
    end
  end
end
