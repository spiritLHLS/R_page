pdf("n_heatmap.pdf", width = 10, height = 10)

# 读取csv文件，将第一列设置为行名
data <- read.csv("newdata_Tanimoto.csv", row.names = 1)

# 将列名设置为行名
colnames(data) <- rownames(data)

# 将数据框转换为数值矩阵
data_matrix <- as.matrix(data)

# 定义自定义颜色
# 蓝 白 红
my_colors <- colorRampPalette(c("#0000FF", "#FFFFFF", "#FF0000"))

# 绘制热力图
heatmap(data_matrix, scale = "column", margins = c(10, 10), 
        col = my_colors(100))

dev.off()
