# 读取数据
data <- read.csv("pcc_cpu_test_multi.csv", header = FALSE)
pdf("n_density.pdf", width = 10, height = 10)

# 绘制密度图
plot(density(data$V2), main = "Density Plot of Drug Pair Neighbor Numbers", xlab = "Neighbor Number", ylab = "Density")
dev.off()
