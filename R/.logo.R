download.file(
  "https://www.pa.go.kr/assets/images/bg-navigation.png",
  "./man/figures/bg.jpg",
  mode = "wb"
)

library(magick)

im <- image_read("./man/figures/bg.jpg")
ims <- image_scale(im, "x210")
imc <- image_crop(ims, "1000x210+1400")
image_write(imc,
            path = "./man/figures/logo_crop.png",
            format = "png",
)

library(showtext)

font_add_google('Noto Sans KR', 'notosans')
showtext_auto()

library(hexSticker)

# for windows
sticker(
  "./man/figures/logo_crop.png",
  s_width = 1,
  s_x = 1, s_y = 1,
  package = "komment",
  p_family = "notosans",
  p_size = 45, p_y = 0.99, p_x = 1,
  filename = "man/figures/logo.png",
  h_fill = "#ebebeb",
  p_color = "#ebebeb",
  h_color = "#113565",
  url = "forkonlp.github.io/komment",
  u_size = 9.5,
  u_color = "#113565",
  dpi = 500
)
