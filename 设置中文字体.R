install.packages("showtext")

library(showtext)

# 指定字体文件路径
font_path <- "/usr/share/fonts/truetype/wqy/wqy-zenhei.ttc"

# 路径查找
# terminal中查找
# fc-list :lang=zh-cn | grep 'SimSun'
# fc-list :lang=zh-cn | grep 'SimHei'
# fc-list :lang=zh-cn | grep 'Microsoft YaHei'
# fc-list :lang=zh-cn | grep 'WenQuanYi Zen Hei'
# 其中之一

# 加载字体
font_add("WenQuanYi Zen Hei", regular = font_path)

# 设置默认字体为中文字体
showtext_auto()
showtext_opts(defaultfont = "WenQuanYi Zen Hei")

