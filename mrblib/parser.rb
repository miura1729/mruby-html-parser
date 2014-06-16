module HtmlParser
  class Parser
    def initialize(stream = nil)
      @fiber = nil
      @stream = stream
    end

    def skip_space
      while (ch = @stream.getchar) == " " or ch == "\n" or ch == "\t"
      end

      ch
    end

    def parse_doctype
      doctype = ""
      while (ch = @stream.getchar) != '>'
        doctype << ch
      end
      Tags::TagDoctype.new(doctype)
    end

    def parse_normal_tag(st_ed)
      tagstr = ""
      while (ch = @stream.getchar) != '>'
        tagstr << ch
      end

      attrs = tagstr.split
      tagname = attrs[0].downcase
      Tags::TagTab[tagname].new(attrs, st_ed)
    end

    def parse_tag
      ch = @stream.getchar
      case ch
      when '!'
        parse_doctype

      when '/'
        parse_normal_tag(:endtag)

      else
        @stream.ungetchar(ch)
        parse_normal_tag(:normal)
      end
    end

    def parse_top
      ch = skip_space
      if ch == '<' then
        return parse_tag
      end

      let = ""
      while !@stream.eof
        case ch
        when '<'
          @stream.ungetchar(ch)
          return let

        when '&'
          let += parse_sletter

        else
          let += ch
        end
        ch = @stream.getchar
      end
    end

    def parse(stream = nil)
      if stream then
        @stream = stream
      end
      parse_top
    end
  end
end
