# 读取数据
data <- read.csv("pcc_cpu_test_multi_cells_line.csv", header = TRUE)

# 计算最小二乘回归系数
fit <- lm(data[, 5] ~ data[, 4])
a <- round(coef(fit)[2], 4)
b <- round(coef(fit)[1], 18)

# 绘制散点图和回归线
plot(data[, 4], data[, 5], xlab = "Predicted Values", ylab = "Actual Values", main = "Predicted vs. Actual Values", col = "blue")
abline(fit, col = "red")

# 添加趋势线图例
legend("topleft", legend = paste("y=", a, "x", b), col = "red", lty = 1, bty = "n")

p <- summary(fit)$coefficients[, 4][2]  # 提取截距项的p值
p
