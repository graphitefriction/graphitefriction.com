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

desc "Generate and publish the site to production (GitHub Pages)"
task :deploy => :push do
  system "awestruct -P production --force -g --deploy"
end
