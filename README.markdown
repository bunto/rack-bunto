# Rack-Bunto

> **Transform your [Bunto](https://bunto.github.io/) app
into a [Rack](https://github.com/rack/rack) application.**

- You can run it with rackup, [shotgun](https://github.com/rtomayko/shotgun),
  [unicorn](http://unicorn.bogomips.org/), and more.
- You can run Rack-Bunto with any modified Bunto.
- You can deploy Rack-Bunto to Heroku, EC2, Rackspace,
  dedicated servers, VPS, etc.


## How to use it

A `config.ru` file is required in order to run with shotgun and rackup.
You can even deploy your Bunto app to [Heroku](https://www.heroku.com/)!

Copy this into `config.ru` in your Bunto site's root directory:

``` ruby
require "rack/bunto"

run Rack::Bunto.new
```

That's it.

Heroku provides a read-only filesystem, so you need to generate pages
and git-commit them *before* you deploy your Bunto site to Heroku.

 1. `cd` to your Bunto directory
 2. add a `config.ru` file (see example above)
 3. build pages with `bunto build`
 4. add `gem "rack-bunto"` to your `Gemfile`
 5. `git init && git add .`
 6. `git commit -m "Initial commit"`
 7. `heroku create`
 8. `git push heroku master`


## Configuration

Bunto configuration options can be specified in a `_config.yml` file
or as Rack-Bunto initialization options in `config.ru`.

Example:

``` ruby
run Rack::Bunto.new(:destination => "mysite")
```

This will set a custom destination path, overriding the default (`_site`)
and settings from a config file.

See [Bunto's configuration docs](https://bunto.github.io/docs/configuration/)
for more settings.

Additional Rack-Bunto initialization options:

    :config        - use given config file (default: "_config.yml")
    :force_build   - whether to always generate the site at startup, even
                     when the destination path is not empty (default: false)
    :auto          - whether to watch for changes and rebuild (default: false)

Note that on read-only filesystems a site build will fail,
so do not set `:force_build => true` in these cases.


## 404 page

In your site's root directory you can provide a custom `404.html` file
with YAML front matter.


## Contributing

Contributions are more than just welcome.
Fork this repo and create a new branch, then submit a pull request.


## Contributors

* adaoraul (Adão Raul)
* SuriyaaKudoIsc (Suriyaa Kudo)
* Nerian (Gonzalo Rodríguez-Baltanás Díaz)
* scottwater (Scott Watermasysk)
* thedjinn (Emil Loer)
* bry4n (Bryan Goines)
* thibaudgg (Thibaud Guillaume-Gentil)
* bemurphy (Brendon Murphy)
* imajes (James Cox)
* mattr- (Matt Rogers)
* stomar (Marcus Stollsteimer)
