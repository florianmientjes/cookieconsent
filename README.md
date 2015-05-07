# Cookieconsent

The cookieconsent gem adds a few helpers to help you add user consent implementation to your website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cookieconsent'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cookieconsent

## Usage

The cookie_consent_bar helper will add the bar to your html

```ruby
	= cookie_consent_bar
```

Pass a block into the cookie_consent helper with content whichs is only loaded if cookie consent is given

```ruby
	= cookie_consent do
      # Tracking code, facebook likebox, etc.
```

CookieConsent has a default locale file, you can override these:

```
  cookieconsent:
    no-consent: 'To see this content you need to allow cookies on this website.'
    no-consent-link: 'Allow cookies'
    bar:
      no-consent: 'To use the full capabilities of this site you have to allow cookies.'
      no-consent-link: 'Allow cookies'
      no-consent-link-deny: 'Deny'
 ```

By default CookieConsent is unstyled, example styling with scss:

```

.cookieconsent{
  border:1px dashed grey;
  text-align:center;
  padding:20px;
  font-size:14px;
  .cookieconsent-link{
  	@extend .btn;
    margin-top:20px;
  }
}


.cookieconsentbar{
  background:rgba(#000, 0.8);
  text-align:center;
  color:#fff;
  padding:10px;
  font-size:14px;
  position:fixed;
  bottom:0;
  right:0;
  left:0;
  .cookieconsent-link-allow{
  	@extend .btn;
    margin:0 20px;
  }
  .cookieconsent-link-deny{
    color:#fff;
  }
}

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cookieconsent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
