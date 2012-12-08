require 'rubygems'

task :default => :preview

desc "Preview the site locally in development mode"
task :preview, [:flags] do |t, args|
  cmd = "awestruct -d"
  if (args[:flags])
    cmd += " " + args[:flags]
  end
  puts cmd
end

desc "Push local commits to origin/develop"
task :push do
  system "git push origin develop"
end

desc "Generate and publish site to production (GitHub Pages) from home"
task :deploy => :push do
  system "awestruct -P production --force -g --deploy"
end

desc "Generate site from Travis CI and, if not a pull request, publish site to production (GitHub Pages)"
task :travis do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'] == 'true'
    system "awestruct -P production -g"
    next
  end

  # would be good to calculate the https URL rather than hard code it
  system "git remote set-url --push origin https://github.com/graphitefriction/graphitefriction.github.com.git"
  system "git fetch -q"
  system "git branch master origin/master"
  system "git config credential.helper 'store --file=.git/credentials'"
  File.open('.git/credentials', 'w') {|f| f.write(ENV['CREDENTIALS']) }
  system "git branch -a"
  system "awestruct -P production -g --deploy"
end
