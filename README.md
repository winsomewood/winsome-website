This `winsome-website` codebase powers [Winsome's public website](http://www.winsomewood.com)

[![preview](preview.png)](http://www.winsomewood.com)

# Features
- Item listings with basic sort & search
- Item => kit associations (a kit is a group of items)
- Contact form and Replacement Item Request form. Both forms send emails on submit
- Admin site to manage items/kits/pages via RailsAdmin

# Getting started with development

This website uses a Rails stack. These are the steps to get the website running on a new workstation.

Install **Ruby**, **SQLite3**, **Node.js**, and **Yarn** following the default instructions for your OS from https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails

After you install these, you should be able to check their versions in a command line prompt. Versions known to work:
```bash
$ ruby -v
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x64-mingw32]

$ sqlite3 -version
3.34.0 2020-12-01 16:14:00 a26b6597e3ae272231b96f9982c3bcc17ddec2f2b6eb4df06a224b91089fed5b

$ node -v
v12.13.1

$ yarn -v
1.22.5

# If you are having troubles, after the installations remember to restart
# your command line prompt to pick up the new $PATHs and find the executables

```
Install Rails & Bundler
```bash
gem install rails -v 6.1.0
gem install bundler -v 2.2.3
$ rails --version # should print 6.1.0
$ bundle --version # should print 2.2.3
```

Clone this repo onto your workstation and `cd` to the root of the repo. From the repo's root run:
```bash
bundle install # Initialize Ruby on Rails packages
rails db:migrate # initialize the database schema and seed data
yarn # initialize Javascript packages
```

Start local server and now visiting localhost:3000 in your web browser should show the Winsome website!
```bash
rails s
```

# Development

Development usually involves:
1. Run `rails s` from the root of the repo to start the Rails server (ctrl+c to stop the process)
1. Make code changes in a text editor
1. Visiting the relevant page in your web browser

Code changes in most files don't require a server restart (but some in Rails config files will).

# Workflow with Production and Staging

We have two servers to run our Production and Staging environments. Both have Git, and we use `git pull` to effectively "deploy" to those servers.

I'm hoping 95% of code branches can be completely tested on a local workstation. Once a branch is ready, try checking out that branch from Staging and confirm that the new behavior works.

When it works, submit a Pull Request! Once the Pull Request is approved, you can merge it into master as needed. Then `git pull` from Production to deploy the change live.

- Production should generally always point to `master` branch. The `master` branch is intended to always have a working build.
- Staging should generally also point to `master` when unused, but feel free to pull down any branch for testing, or even making code changes directly on the server if needed. After testing, remember to point the server back to `master` and delete extraneous files so the next person finds it in a clean state.

I'm hoping 95% of the time, testing can be done on a local workstation and finding bugs on Staging is rare. It is useful though to catch a class of bugs that show up in production mode e.g. bugs related to email sending, Postgres-specific bugs, bugs that are only obvious when network requests are being made.

**Sidenote**: Currently, item images are stored inside the repo at `/public/images`, so be careful to not accidentally delete them when cleaning up files. This repo is ignored by git - notice in `/.gitignore` the line `public/images`
```bash
# Generally these commands can be used on prod/staging to switch branches
git checkout <branch>
git clean -df # delete extra files that are visible to git
```

# Environments and their differences

On your local workstation, Rails is run by default in `development` mode. On production and staging servers though we run it with `rails s -e production` which puts it in production mode. There are some differences between these modes. In production:
- Will connect to postgresql database instead of sqlite3. Each environment has its own copy of a database e.g. prod has its own postgresql DB, staging has its own postgresql DB, your workstation has its own sqlite3 DB
- Webpack (which compile CSS and JS files) is not run on each page load. Editing CSS and JS live on the server will not cause updates due to caching. To rebuild assets and restart server, [run these steps without git pull](#deployment)
```bash
RAILS_ENV=production rails assets:precompile # precompile JS assets. This automatically happens on page load in dev but must be triggered manually in prod
rails s -b <ip_address> -p 80 -e production # start new server
```
- Logs get outputted to `/root/html/log/production.log`
- We send emails when Contact Us and Replacement Request forms are filled out. Real emails send on production and staging boxes. Notice `config.action_mailer.perform_deliveries` and `config.action_mailer.smtp_settings` are only defined in config/environments/production.rb.

**Sidenote**: Looks like emails are only sending to @winsomewood.com email addresses, so you will need one to test

# Copying images from prod to development workstation
After setting up your local workstation you will not yet have any images of items. Run this (replacing `<my_login>`) to copy the images from production. This can take a while since we have a lot of images.
```bash
# From the repo root
# Replace <my_login> with your login
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/collections/ public/images/collections/
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/categories/ public/images/categories/
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/companies/ public/images/companies/

# For these next 2, there are a looooot of images. Instead of fetching the whole folder like
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/200/ public/images/200/
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/584/ public/images/584/

# It might be better to specify a subset of items like
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/200/1* public/images/200/
scp -r <my_login>@www.winsomewood.com:/root/html/public/images/584/1* public/images/584/
```

# Rails Interactive shell

To run a Rails interactive Shell for debugging, from the root of the repo run
```
rails console
rails console -e production # on production and staging machines
```
You now have access to the runtime environment with all standard Gems ready to use. Try running commands like:
```bash
Item.first # select an item from the database
Item.where(collection: "Halifax") # select items where collection is "Halifax"
Kit.where(itemno: 94209) # select kits where itemno is 94209
```

Type `quit` to exit

- [Rails Guide to Command Line](https://guides.rubyonrails.org/command_line.html)
- [Rails Guide to ActiveRecord Querying](https://guides.rubyonrails.org/active_record_querying.html)

Note: `rails console` looks kind of weird visually when used from the Windows program "Git Shell". Try running this from Windows' default command line, or a program called Windows Terminal downloadable for free from Microsoft Store

# RailsAdmin
RailsAdmin is a UI at https://<website>/admin that allows management of the database. In development mode no login is required. On prod the user is `root` and the password is defined by `ENV['WINSOME_WEBSITE_RAILS_ADMIN_PASSWORD']`

# Deployment

Currently the website is run under the root user (we should change this eventually). Deployment steps are:

```bash
sudo su root # become root user on prod box

# first do all necessary git things like git pull or changing branches
# note that this will affect the running website!

# then replace <ip_address> with the server's IP address and run this to restart and precompile assets
kill `cat /root/html/tmp/pids/server.pid`; cd /root/html && RAILS_ENV=production rails assets:precompile && rails s -b <ip_address> -p 80 -e production -d
```

Lets look at each part of this command to see what it does
```bash
kill `cat /root/html/tmp/pids/server.pid` # kill old process. if it emits warnings, it means the old process does not exist and that's fine. nothing will get killed
cd /root/html # make sure we are in the repo root directory
RAILS_ENV=production rails assets:precompile # precompile JS assets. This automatically happens on page load in dev but must be triggered manually in prod
rails s -b <ip_address> -p 80 -e production -d # start new server as a daemon

```
See [What does `;` and `&&` mean in bash](https://unix.stackexchange.com/a/187148)

# Runbook

- Some helpful commands to be run on prod or staging
```bash
ps aux | grep puma # find currently running rails process
tail /root/html/log/production.log -n 100 # view last 100 lines of prod Rails log
tail /root/html/log/production.log -f # watch updates to prod Rails log

psql -d winsome -U root # connect to the DB
vim ~/.bashrc # view environment variables
sudo /etc/init.d/postgresql <start|stop|restart> # postgres commands
```

- If images/CSS/JS (things from public/ directory) are not loading on staging or prod, make sure RAILS_SERVE_STATIC_FILES env var is set

- In development where sqlite3 is used, to reset the development database to a clean state, simply delete db/development.sqlite3 and db/schema then rerun `rails db:migrate`. This will not work in production since postgresql is used there.

- Required when setting up a new production server but not when setting up a local dev machine:
```bash
bundle exec rails webpacker:install # run webpacker right before starting the server https://github.com/rails/webpacker

# add this to ~/.bashrc
export RAILS_SERVE_STATIC_FILES="t"

# then run
source ~/.bashrc
```

# Rollbar
Basic server-side error logging is done in Rollbar. View errors at
https://rollbar.com/minigolf2000/winsome-website/ (ask Golf for an invite if you cannot access)
