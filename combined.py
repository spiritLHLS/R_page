# 环境安装 pip install python-docx
# 原项目目录结构适配 中科院学位论文LATEX 2𝜀 模板 CASthesis v0.2 
# 将项目所有tex文件放到当前路径下
# 本文件放到当前路径下运行
# 转换latex项目文件为word文件
# 本脚本仅提取文字部分，不包含图表公式部分内容以及引用
# from https://github.com/spiritLHLS/R_picture
# by spiritlhl

import os
import re
from docx import Document

def extract_chapter_names(file_path):
    all_latex = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        is_comment = False
        for line in lines:
            line = line.strip()
            if line.startswith('%%') or line.startswith('%'):
                continue
            else:
                try:
                    chapter_name = line.split('{')[1].split('}')[0]
                    if "chapter/" in chapter_name:
                        all_latex.append(chapter_name.replace("chapter/",""))
                except:
                    pass
    return all_latex

file_path = 'template.tex'  # 替换为主文件名字
chapter_names = extract_chapter_names(file_path)
# print(chapter_names)

def check_files_existence(chapter_names):
    real_files = []
    for name in chapter_names:
        file_name = name + '.tex'
        if os.path.isfile(file_name):
            real_files.append(file_name)
    return real_files
real_files = check_files_existence(chapter_names)
print(real_files)

def filter_latex(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    
    pattern = r'\\label{chap.*?}'
    content = re.sub(pattern, '', content, flags=re.DOTALL)
        
    pattern = r'\\begin{figure}(.*?)\\end{figure}'
    content = re.sub(pattern, '', content, flags=re.DOTALL)
    
    pattern = r'\\begin{equation}(.*?)\\end{equation}'
    content = re.sub(pattern, '', content, flags=re.DOTALL)
    
    pattern = r'\\begin{table}(.*?)\\end{table}'
    content = re.sub(pattern, '', content, flags=re.DOTALL)
    
    content = re.sub(r'\\cite\{[^\}]*\}', '', content)
    
    content = re.sub(r'~\\ref\{[^\}]*\}', '', content)
    
    content = re.sub(r'\\ref\{[^\}]*\}', '', content)
    
    content = re.sub(r'^(?:\\begin|\\end|\\label\\includegraphics).*?\n', '', content, flags=re.MULTILINE)
    
    content = re.sub(r'%.*?\n', '', content)

    content = re.sub(r'\\[a-zA-Z]+\*?', '', content)

    content = re.sub(r'[{}]', '', content)

    content = re.sub(r'\\[^{}\s]+(?:{[^{}]*})*', '', content)
    
    content = re.sub(r'\n\s*\n', '\n', content)
    
    return content.strip()

files = []
for file_path in real_files:
    filtered_text = filter_latex(file_path)
    files.append(filtered_text)

def combine_text_to_word(files, output_filename):
    doc = Document()
    for text in files:
        doc.add_paragraph(text)
    doc.save(output_filename)

output_filename = "combined.docx"
combine_text_to_word(files, output_filename)
