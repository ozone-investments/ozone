PACKAGE_NAME = "Ozone"
VERSION = "1.0.0"
TRAVELING_RUBY_VERSION = "20150210-2.1.5"

desc "Package your app"
task :package => ['package:linux:x86', 'package:linux:x86_64', 'package:osx', 'package:win32']

namespace :package do
  namespace :linux do
    desc "Package your app for Linux x86"
    task :x86 => "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz" do
      create_package("linux-x86")
    end

    desc "Package your app for Linux x86_64"
    task :x86_64 => "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz" do
      create_package("linux-x86_64")
    end
  end

  desc "Package your app for OS X"
  task :osx => "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx.tar.gz" do
    create_package("osx")
  end

  desc "Package your app for Windows x86"
  task :win32 => ["packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-win32.tar.gz"] do
    create_package("win32", :windows)
  end

  desc "Install gems to local directory"
    task :bundle_install do
      if RUBY_VERSION !~ /^2\.1\./
        abort "You can only 'bundle install' using Ruby 2.1, because that's what Traveling Ruby uses."
      end
      sh "rm -rf packaging/tmp"
      sh "mkdir -p packaging/tmp"
      sh "cp Gemfile* packaging/tmp/"
      Bundler.with_clean_env do
        sh "cd packaging/tmp && env BUNDLE_IGNORE_CONFIG=1 bundle install --path ../vendor --without development"
      end
      sh "rm -rf packaging/tmp"
      sh "rm -f packaging/vendor/*/*/cache/*"
    end
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz" do
  download_runtime("linux-x86")
end
