# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 21/12/201

# rvest package
    # install.packages("rvest") # C:\Users\Administrator\AppData\Local\Temp\Rtmp4672lV\downloaded_packages

library("rvest") # use package

# web page scraping
wikiobama <- "https://en.wikipedia.org/wiki/Barack_Obama"
obamapage <- read_html(wikiobama)

html <- html_nodes(obamapage, ".infobox.vcard") # .infobox.vcard 是网页中的节点
text <- html_text(html)

print(text)
paste(text, collapse=" ") # 把多个用空格 合并在一起

# web search keyword
wiki<-function(keyword){
    wikiurl<-"https://en.wikipedia.org/wiki/"
    theurl<-paste0(wikiurl,keyword) # 把网址和关键字连接

    wikipage<-read_html(theurl)

    infohtml<-html_nodes(wikipage, ".infobox.vcard")
    infotext<-html_text(infohtml)

    paste(infotext, collapse=" ")
    print(infotext)
}

print(wiki("Beyonce"))

# HTML page scarping with xml_structure function
google<-read_html("http://google.com")
google %>% xml_structure() # 打开网页节点
google %>% html_nodes("p") # 打开p节点
google %>% html_nodes("a") # 打开a节点

ateam <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")
html_nodes(ateam, "center") # 获取center 节点
html_nodes(ateam, "center font") # 获取center下的font节点
html_nodes(ateam, "center font b") # 获取center下的font下的b节点
ateam %>% html_nodes("center") %>% html_nodes("font") # center 下的font节点
ateam %>% html_nodes("center") %>% html_nodes("font") %>% html_nodes("b") # center下的font下的b节点

# page creation
userpage <- read_html("<h1 id='title'>kit306</h1><p class='a'><b>version</b></p>")
print(userpage)

h1<-html_node(userpage,"h1")
print(h1)

p<-html_node(userpage, "p")
print(p)
print(p[[1]])

# xml node
technology <- read_xml("http://www.abc.net.au/news/feed/50042/rss.xml")
newsitem <- technology %>% xml_nodes("item") # 打印item节点
print(newsitem[[1]] %>% xml_structure()) # 打印结构
print(newsitem %>% xml_node("description") %>% xml_text()) # description 中所有的文本

