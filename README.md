# Liquid Tag Plugin: awesome_codeblock

This plugin was extracted from the [author gem](https://github.com/tschmidt/author) that
I wrote. It allows you to add much nicer code blocks to your projects that use the
[Liquid Templating Language](https://github.com/Shopify/liquid) from 
[Shopify](http://www.shopify.com).

This plugin uses (CodeRay)[https://github.com/rubychan/coderay] to highlight the code. 
If you use something different, it's fairly trivial to change it. Instructions on how 
to do that are shown below.

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
gem 'liquid', '~> 2'
gem 'coderay', '~> 1'
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

You can choose to add line numbers as well. Really, any value here will indicate that you
want to show line numbers.

    {% awesome_codeblock show_line_numbers:true %}
      code goes here
    {% endawesome_codeblock %}

You can choose to highlight specific lines within your code block as well. Just supply
a comma separated list of line numbers. Setting this option will automatically set
`show_line_numbers` to `true`.

    {% awesome_codeblock highlight:"2,3,4,7" %}
      code goes here
      ...
    {% endawesome_codeblock %}

If you want your line numbers to start at a specific number, you can do that too!

    {% awesome_codeblock start_at:25 %}
      code goes here
      ...
    {% endawesome_codeblock %}

You can use any combination of the above options:

    {% awesome_codeblock title:"lib/awesome_codeblock.rb" lang:ruby show_line_numbers:true %}
      code goes here
    {% endawesome_codeblock %}

If you specify `start_at` and want to highlight lines, you need to pass in the lines
relative to your starting number:

    {% awesome_codeblock start_at:25 highlight:'25, 26, 27' %}
      code goes here
    {% endawesome_codeblock %}


## Extras

There is a default theme you can use. It's based on the Github code block styles. If you
would like to use it, look at `assets/stylesheets/awesome_codeblock_default.css`. Feel
free to tweak at you see fit.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
