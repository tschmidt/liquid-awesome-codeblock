# Liquid Tag Plugin: awesome_codeblock

This plugin was extracted from the [author gem](tschmidt/author) that I wrote. It allows
you to add much nicer code blocks to your projects that use the Liquid Templating Language
from Shopify.

This plugin uses CodeRay to highlight the code. If you use something different, it's 
fairly trivial to change it. Instructions on how to do that are shown below.

## Dependencies

To use this plugin the way I have written it, you will need to include a few things in
your project:

- Liquid, version ~> 2.6
- CodeRay, version ~> 1.1

I use CodeRay for the code highlighting library. You can easily substitute your own. I'll
walk you through how to do that below.

## Installation

Add this to your gem file:

``` ruby
gem 'liquid', '~> 2.6'
gem 'coderay', '~> 1.1'
```

Run `bundle install`.

### If you're using  Jekyll

Download this project and place `lib/awesome_codeblock.rb` in your `_plugins` folder.

### Others?

Send me a request and I'll update the README. Or, better yet, [you could contribute](#contributing)!

## Usage

The most basic usage is just calling the code block. This will not do much more than
the standard codeblock wrapper.

    {% awesome_codeblock %}
      code goes here
    {% endawesome_codeblock %}

You can choose to have a title added to the code block. This is great if you want to
display the filename or filepath for the code snippet.

    {% awesome_codeblock title:"path/to/file.rb" %}
      code goes here
    {% endawesome_codeblock %}

You can set the language of the code block. The default is `:text` but you can specify
any of the code formats that CodeRay supports.

    {% awesome_codeblock lang:ruby %}
      code goes here
    {% endawesome_codeblock %}

You can choose to add line numbers as well. Refer to the documentation for
CodeRay::Encoder::HTML for values that can be passed in.

    {% awesome_codeblock show_line_numbers:true %}
      code goes here
    {% endawesome_codeblock %}

You can choose to highlight specific lines within your code block as well. Just supply
a comma separated list of line numbers.

    {% awesome_codeblock highlight:"2,3,4,7" %}
      code goes here
      ...
    {% endawesome_codeblock %}

If you want your line numbers to start at a specific number, you can do that too!

    {% awesome_codeblock start_at:25 %}
      code goes here
      ...
    {% endawesome_codeblock %}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
