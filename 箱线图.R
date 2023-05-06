# 读入CSV文件
arr1 <- read.csv('array1.csv', header=FALSE)
arr2 <- read.csv('array2.csv', header=FALSE)
colnames(arr1) <- "Highly similar drugs"
colnames(arr2) <- "Low similar drugs"

# 合并两个array为一个M
M <- c(arr1, arr2)

# sudo apt-get update
# sudo apt-get install libgl1-mesa-dri
# ps -ef | grep Xorg
# sudo /usr/bin/Xorg :0
# echo $DISPLAY
# export DISPLAY=:0

x11(width = 6, height = 8)
layout(matrix(c(1,1,2,2), 2, 2, byrow = T), heights = c(4,1))
boxplot(M, outline=FALSE,col = rainbow(10),side = 1,las=1,ylab="") #outline=TRUE意思是显示异常值
mtext("Spearman", side = 2, line =3, font.lab=2)

dev.copy2eps()
dev.print(png, "myplot.png", width = 600, height = 800, res = 300)
