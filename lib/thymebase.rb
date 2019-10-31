class ThymeBase
  attr_reader :request, :highlights
  attr_accessor :txt

  def initialize(txt, highlights, request)
    @request = request
    @txt = txt
    @highlights = highlights
  end

  def body    
    new_txt = txt.dup
    split_text = txt.split(/ /)

    sorted_highlights = highlights.sort { |a,b| a[:start] <=> b[:start] }

    sorted_highlights.each do |hl|
      ss = split_text.slice(hl[:start]..hl[:end]).join(" ")
      new_txt.sub!(ss, "<span id='#{hl[:comment]}' data-toggle='tooltip' title='#{hl[:comment]}'>#{ss}</span>")
    end

    content = new_txt.split(/\n+/)
  end
end