module HtmlParser
  module Tags
    class Tag
      attr_accessor :parent
      attr_accessor :child

      def initialize(*args)
        @parent = nil
        @child = nil
      end
    end

    class TagDoctype<Tag
      attr :content

      def initialize(str)
        @content = str
        super
      end
    end

    class TagHtml<Tag
      attr :attr

      def initialize(attr)
        @attr = attr
        super
      end
    end

    class TagBody<Tag
      attr :attr

      def initialize(attr)
        @attr = attr
        super
      end
    end

    TagTab = {
      "html" => TagHtml,
      "body" => TagBody,
    }
  end
end
