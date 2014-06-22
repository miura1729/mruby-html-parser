module HtmlParser
  module Tags
    class Tag
      attr_accessor :parent
      attr_accessor :child

      def initialize(*args)
        @parent = nil
        @child = []
      end
    end

    class TagDoctype<Tag
      attr :content

      def initialize(str)
        @content = str
        super
      end
    end

    class HtmlTag<Tag
      attr :attr
      attr :endp

      def initialize(attr, st_ed)
        @attr = attr
        @endp = (st_ed == :endtag)
        super
      end
    end

    class TagRoot<HtmlTag
    end

    class TagHtml<HtmlTag
    end

    class TagHead<HtmlTag
    end

    class TagBody<HtmlTag
    end

    class TagStyle<HtmlTag
    end

    class TagDiv<HtmlTag
    end

    class TagSpan<HtmlTag
    end

    TagTab = {
      "html" => TagHtml,
      "head" => TagHead,
      "body" => TagBody,
      "style" => TagStyle,
      "div" => TagDiv,
      "span" => TagSpan,
    }
  end
end
