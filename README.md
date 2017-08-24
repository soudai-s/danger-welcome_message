# danger-welcome_message

A [Danger](https://github.com/danger/danger) plugin for showing welcome messages in your words to members who send PR for the first time.

## Installation

    $ gem install danger-welcome_message

## Usage

    Methods and attributes from this plugin are available in
    your `Dangerfile` under the `welcome_message` namespace.

### welcome_message

Show the greeting on a pull request.

<blockquote>Show the greeting
  <pre>welcome_message.greet</pre>
</blockquote>

<blockquote>When you want to greet with your words
  <pre>welcome_message.custom_words = <<-CUSTOM_WORDS
  Hi, @#{github.pr_author}!!
  Welcome to #{github.pr_json[:base][:repo][:full_name]}! Thanks so much for joining us.
CUSTOM_WORDS

welcome_message.greet</pre>
</blockquote>

<blockquote>When you want to see the greeting irrespective of the conditions
  <pre>welcome_message.greet_test</pre>
</blockquote>

#### Attributes

`custom_words` - Custom words for greeting

#### Methods

`greet` - Greet when a new member makes a first pull request

`greet_test` - Greet every time

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
