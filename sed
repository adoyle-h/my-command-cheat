# To replace all occurrences of "day" with "night" and write to stdout:
sed 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" within <file>:
sed -i 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

# To remove leading spaces:
sed -i -r 's/^\s+//g' <file>

# To remove empty lines and print results to stdout:
sed '/^$/d' <file>

# To replace newlines in multiple lines:
sed ':a;N;$!ba;s/\n//g' <file>

# To insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

# To add a line after a matching pattern:
sed '/happily ever after/a\The end.'

# 提取匹配到的字符串
echo '[123]' | sed -E 's/\[(.*)\]/\1/'
# 注意括号要加转义符才有效
echo hello123 | sed "s/\([a-z]*\).*/\1/"  # => hello

# 使用其他分隔符
echo '/a/b' | sed -E 's|/a/b|/a/c|'

# 删除匹配行以及它的下一行
sed -i '/pattern/,+1d' <file>

# BSD sed 注意。-i 参数必须这么写才能替换文件，-i 和 '' 之间必须有空格
sed -i '' <pattern> <file>

# 只输出第 3 ~ 5 行的内容
sed -n '3,5p' <file>
