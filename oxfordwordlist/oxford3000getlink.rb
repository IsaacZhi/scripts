require 'open-uri'
require 'nokogiri'

rootpage = 'http://oald8.oxfordlearnersdictionaries.com'
#url = rootpage + '/oxford3000/ox3k_A-B/'

words = []
wordslink = []
wordsmp3link = []
urlfile = IO.foreach("wordlistpage.txt") do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css('div#entrylist1 a').each do |link|
        words << link.text
        wordslink << rootpage + link['href']
    end
    
    doc.css('div#entrylist1 img').each do |link|
        tempstr = link['onclick']
        /playSoundFromFlash\('(?<mp3url>[^']*)'.*/ =~ tempstr
        wordsmp3link << rootpage + mp3url
    end
end

File.open("words.txt", "w") do |f|
    f.puts words
end
#puts "wordslink"
File.open("wordslink.txt", "w") do |f|
    f.puts wordslink
end

#puts "wordsmp3link"
File.open("wordsmp3link.txt", "w") do |f|
    f.puts wordsmp3link
end
