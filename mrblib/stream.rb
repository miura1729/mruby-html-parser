module HtmlParser
    class Stream
    end

    class StringStream<Stream
      def initialize(str)
        @string = str
        @pos = 0
      end

      def getchar
        ret = @string[@pos]
        @pos += 1
        ret
      end

      def ungetchar(c)
        @pos -= 1
        @string[@pos] = c
      end

      def eof
        @string.size <= @pos
      end
    end
  end
