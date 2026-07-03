# Code from http://movb.de/jekyll-details-support.html

module Jekyll
  module Tags
    class DetailsTag < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        @caption = markup
      end

      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        caption = converter.convert(@caption).gsub(/<\/?p[^>]*>/, '').chomp
        body = converter.convert(super(context))
        "<details><summary>#{caption}</summary>#{body}</details>"
      end

    end

    class ExampleTag < Liquid::Block
      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        body = converter.convert(super(context))
        "<div class=\"block-example\">#{body}</div>"
      end
    end

    class TheoremTag < Liquid::Block
      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        nodelist = @body.instance_variable_get(:@nodelist) || []
        body = nodelist.map do |node|
          if node.is_a?(String)
            converter.convert(node)
          else
            node.render(context)
          end
        end.join
        "<div class=\"block-theorem\">#{body}</div>"
      end
    end

    class ProofTag < Liquid::Block
      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        body = converter.convert(super(context))
        "<details class=\"theorem-proof\"><summary>Proof</summary><div class=\"theorem-proof-body\">#{body}</div></details>"
      end
    end
  end
end

Liquid::Template.register_tag('details', Jekyll::Tags::DetailsTag)
Liquid::Template.register_tag('example', Jekyll::Tags::ExampleTag)
Liquid::Template.register_tag('theorem', Jekyll::Tags::TheoremTag)
Liquid::Template.register_tag('proof', Jekyll::Tags::ProofTag)