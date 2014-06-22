module HtmlParser
  class DispConstuctor
    def initialize(stream)
      @parser = Parser.new(stream)
    end

    def search_tag(pos, tag)
      cpos = pos
      while cpos.class != tag.class
        cpos = cpos.parent
        if pos.class == Tags::TagRoot then
          return pos.parent
        end
      end

      cpos
    end

    def construct
      root = Tags::TagRoot.new({}, false)
      pos = root
      tag = @parser.parse
      stylemode = false
      while tag
        if tag.class == String then
          if stylemode then
          end
          pos.child.push tag

        elsif tag.class == Tags::TagDoctype then
          pos.child.push tag

        elsif tag.endp then
          pos = search_tag(pos, tag)
          stylemode == false

        else
          if tag.class == Tags::TagStyle then
            stylemode == true
          end
          pos.child.push tag
          tag.parent = pos
          pos = tag
        end
        tag = @parser.parse
      end

      root
    end
  end
end
