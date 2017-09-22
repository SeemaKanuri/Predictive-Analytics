x <- c('tm','pdftools','qdapTools','SnowballC','wordcloud','Matrix','stringr')
lapply(x, require, character.only = TRUE)

filepath <- 'C:/Users/parth/Desktop/DTM/ClassDemonstration/txt'
setwd(filepath)
dir(filepath)
corpus_txt <- Corpus(DirSource(filepath))
corpus_txt

filepath <- 'C:/Users/parth/Desktop/DTM/ClassDemonstration/pdf'
setwd(filepath)
dir(filepath)
Files <- list.files(pattern = 'pdf$')
Files
text <- lapply(Files,pdf_text)
text <- lapply(text,str_replace_all,'[\n]'," ")
text <- lapply(text,str_replace_all,'[\r]'," ")
text
corpus_txt2 <- Corpus(VectorSource(text))
corpus_txt2


####### Analysr HBO file #############
filepath <- 'C:/Users/parth/Desktop/DTM/ClassDemonstration'
setwd(filepath)
file <- 'HBO_NOW.txt'
text <- file(file, open='r')
text.decomposition = readLines(text)
text.decomposition[1]
corpus_txt <- Corpus(VectorSource(text.decomposition))
corpus_txt

corpus_HBO <- tm_map(corpus_txt,PlainTextDocument)
corpus_HBO <- tm_map(corpus_txt,tolower)
corpus_HBO <- tm_map(corpus_txt,removeNumbers)
corpus_HBO <- tm_map(corpus_txt,removePunctuation)

stopwords("english")
mystopWords <- c('hbo','now','app')

corpus_HBO_CLEAN <- tm_map(corpus_HBO,removeWords,c(stopwords('english'),mystopWords))
corpus.tdm <- TermDocumentMatrix(corpus_HBO_CLEAN)
write.csv(as.matrix(corpus.tdm),file = file.path('tdm.csv'))

freq <- rowSums(as.matrix(corpus.tdm))
freq <- sort(freq,decreasing = TRUE)
head(freq)

words <- names(freq)
wordcloud(words[1:40],freq[1:40],scale = c(2,.8),colors = brewer.pal(8,'Dark2'))
