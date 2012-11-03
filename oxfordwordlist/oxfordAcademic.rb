require 'open-uri'
require 'nokogiri'


# Perform a google search
rootpage = 'http://oald8.oxfordlearnersdictionaries.com'
htmlpage = rootpage + '/academic/sublist01/'
doc = Nokogiri::HTML(open(htmlpage))

alltoppage = [htmlpage]
# Print out each link using a CSS selector
doc.css('div#relatedentries li a').each do |link|
  alltoppage << rootpage + link['href']
end

alllistpage = []
alltoppage.each do |toppage|
    tempdoc = Nokogiri::HTML(open(toppage))
    tempindexstring = []
    tempdoc.css('div#paging a').each do |link|
        tempindexstring << link.text
    end
    
    lastIndex = tempindexstring[-2].to_i
    pages = 2..lastIndex
    
    alllistpage << toppage
    pages.each do |pagenumber|
        tempstr = sprintf("\?page=%d", pagenumber)
        alllistpage << toppage + tempstr
    end
end

#puts alllistpage

words = []
wordslink = []
alllistpage.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css('div#entrylist1 a').each do |link|
        words << link.text
        wordslink << rootpage + link['href']
    end
    
end

File.open("academicwords.txt", "w") do |f|
    f.puts words
end
#puts "wordslink"
File.open("academicwordslink.txt", "w") do |f|
    f.puts wordslink
end
