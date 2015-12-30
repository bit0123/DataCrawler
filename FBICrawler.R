# First you have to intall Rfacebook package
# https://cran.r-project.org/web/packages/Rfacebook/Rfacebook.pdf
library('Rfacebook');
# Where & How to collect Tokel
# visit https://developers.facebook.com/tools/explorer
# login and Get Access Token
token <- "CAACEdEose0cBAJMsJvIHYQozDHAclOlfTnyNnF8kclAKEH6JBnDp4yXtgcXqM5SdSQ8E2iRmLb2PAbWdHVR8gEvHJH7BMIYHER48N1ZCKAJxpOs3FdZBAiHYeWXFKq6759sMps4EL7im0W5kgWNOjGGA9rZBToXStTWd71xtKXGGu3kZBQcYpCyiRgPlfgQe9PElrgwE2AZDZD"
me <- getUsers("811807988843131", token, private_info = TRUE)
#likes<- getLikes(user="me", token=token)
friends<- getFriends(token, simplify = FALSE)
likes<- getLikes(user=friends$id[3], token=token)

fb_page <- getPage(page="bdnews24", token=token)
## Getting information and likes/comments about most recent post
post <- getPost(post=fb_page$id[1], n=2000, token=token)

mat<- getNetwork(token, format="adj.matrix")
library(igraph)
network <- graph.adjacency(mat, mode="undirected")

pdf("network_plot.pdf")
plot(network)
dev.off()
