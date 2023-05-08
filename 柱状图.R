# 读取文件
data <- read.csv("pcc_cpu_test_multi_target.csv", header = TRUE)

subdata <- subset(data, data[, 3] == "'Vinblastine sulfate', 'Melphalan'")

pdf("n_coefficient.pdf", width = 10, height = 10)

# 提取第四列数据并绘制柱状图
barplot(subdata[, 4], xlab = "Drugs", ylab = "Pearson correlation coefficient",
        main = "Spearman Correlation Coefficient for Drug Combination", col = "skyblue")
dev.off()
