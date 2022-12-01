# 提取匹配到的字符串
echo '[123]' | sed -E 's/\[(.*)\]/\1/'

# 注意括号要加转义符才有效
echo hello123 | sed "s/\([a-z]*\).*/\1/"  # => hello

# 使用其他分隔符
echo '/a/b' | sed -E 's|/a/b|/a/c|'

# 删除匹配行以及它的下一行
sed -i '/PATTERN/,+1d' <file>

# BSD sed 注意。-i 参数必须这么写才能替换文件，-i 和 '' 之间必须有空格
sed -i '' <pattern> <file>

# 只输出第 3 ~ 5 行的内容
sed -n '3,5p' <file>

# 插入文本，注意 a\ 是固定格式，且 \ 后面需要有一个换行符

sed 'ADDRESS a\
	Line which you want to append' filename

# a\ 代表 append, i\ 代表 insert
sed '/PATTERN/ i\
	Line which you want to insert' filename

# 也可以写成单行。$ 表示在末尾插入
sed '$ i\'$'\n''Line which you want to insert'$'\n' filename

# 插入 a 文件内容到 b 文件的指定位置
sedi "/PATTERN/ r /a" "/b"

# 从管道中替换
echo 'hello' | sedi "/PATTERN/ r /dev/stdin" "/b"

# 替换文本
sed 'ADDRESS c\
	new line' filename

# vim: set ft=sh
