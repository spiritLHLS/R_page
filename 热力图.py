import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 读取CSV文件并指定第一行为头部
df = pd.read_csv('newdata_Tanimoto.csv', header=0).set_index(["Unnamed: 0"])

# 重命名行索引的名称
df = df.rename_axis(index=None, columns=None)

# 创建热力图
plt.figure(figsize=(10, 8))
ax = sns.heatmap(df, cmap='coolwarm', annot=False, xticklabels=False, yticklabels=False)
cbar = ax.collections[0].colorbar
cbar.ax.tick_params(labelsize=20)

# 保存热力图为高清图片
plt.savefig('heatmap_n.png', dpi=1000)

# 显示热力图
plt.show()
