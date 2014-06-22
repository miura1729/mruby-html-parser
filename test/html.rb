a = HtmlParser::StringStream.new(<<EOS)
<!DOCTYPE html>
<html>
<head>
<style>
div#id { color : #ff3300 }
</style>
</head>
<body>abc
<div id="id">
foo bar
</div>
</body>
</html>

EOS
disp = HtmlParser::DispConstuctor.new(a).construct

assert('construct doctype') do
  disp.child[0].class == HtmlParser::Tags::TagDoctype
end

assert('construct style') do
  disp.child[1].child[0].child[0].class == HtmlParser::Tags::TagStyle
end

