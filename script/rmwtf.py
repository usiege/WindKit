import os
import shutil

def clean_directory(directory):
    # 确保目录存在
    if not os.path.exists(directory):
        print(f"目录不存在: {directory}")
        return
    
    # 遍历目录中的所有文件和子目录
    for root, dirs, files in os.walk(directory):
        # 删除所有文件
        for file in files:
            file_path = os.path.join(root, file)
            try:
                os.remove(file_path)
                print(f"已删除文件: {file_path}")
            except Exception as e:
                print(f"删除文件失败 {file_path}: {str(e)}")

def main():
    # 基础路径
    base_path = r"G:\Applications\World of Warcraft\_classic_\WTF"
    
    # 要清理的目录列表
    directories_to_clean = [
        os.path.join(base_path, "Account", "JIANIN45", "SavedVariables"),
        os.path.join(base_path, "Account", "JIANIN45", "巨龙追猎者")
    ]
    
    # 清理每个目录
    for directory in directories_to_clean:
        print(f"\n开始清理目录: {directory}")
        clean_directory(directory)
        print(f"完成清理目录: {directory}")

if __name__ == "__main__":
    # 请求用户确认
    print("警告：此脚本将删除以下目录中的所有文件：")
    print("1. G:\\Applications\\World of Warcraft\\_classic_\\WTF\\Account\\JIANIN45\\SavedVariables")
    print("2. G:\\Applications\\World of Warcraft\\_classic_\\WTF\\Account\\JIANIN45\\巨龙追猎者")
    print("\n请确保这些目录中的文件已经备份。")
    confirm = input("是否继续？(y/n): ")
    
    if confirm.lower() == 'y':
        main()
        print("\n清理完成！")
    else:
        print("操作已取消。")