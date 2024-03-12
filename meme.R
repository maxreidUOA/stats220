library(magick)

inspo_url <- "https://i.kym-cdn.com/photos/images/newsfeed/001/542/779/172.jpg" #Link to the inspiration for my meme
#I will use the format shown but switch up the bottom picture as well as the text to create my own reaction meme (pun intended)

#creating the two text boxes of the meme
blank_box <- image_blank(width = 250, height = 250, color = "#D6EAF8")
text_box1 <- image_annotate(blank_box, 
                            text = "Me enjoying all of the\n cat related gifs in the \nstats220 lecture slides", 
                            size = 22, 
                            color = "black", 
                            gravity = "center",
                            font = "impact")%>%
  image_border("black", "1x1")

text_box2 <- image_annotate(blank_box, 
                            text = "Remembering I'm \nallergic to cats", 
                            size = 25, 
                            color = "black", 
                            gravity = "center",
                            font = "impact")%>%
  image_border("black", "1x1")

happy_image <- image_read("https://i.kym-cdn.com/photos/images/newsfeed/002/116/540/b21.jpg")
cropped_image <- image_crop(happy_image, "800x800+0+150") #The original image was rectangular so I had to crop it first to fit with the square size of the other images
happy_reaction <- image_scale(happy_reaction, "250x250!")%>%
  image_border("black", "1x1")


allergic_image <- image_read("https://pbs.twimg.com/media/ETcqyFkWsAAzjzk?format=jpg&name=small")
allergic_reaction <- image_resize(allergic_image, "250x250")%>%
  image_border("black", "1x1")

top_row <- image_append(c(text_box1, happy_reaction))
bottom_row <- image_append(c(text_box2, allergic_reaction))

final_meme <- c(top_row, bottom_row) %>%
  image_append(stack = TRUE)
final_meme

image_write(final_meme, "final_meme.png")










