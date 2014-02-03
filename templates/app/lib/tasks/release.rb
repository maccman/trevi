task :release do
  `git push production master`
end

namespace :staging do
  task :release do
    branch = `git symbolic-ref --short HEAD`.chomp
    `git push -f staging #{branch}:master`
  end
end