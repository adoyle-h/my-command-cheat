## nc (netcat)
# C/S 模式的网络工具，通常用于查看端口，但还能做其他事情。

# 查看远端地址是否开启端口
# -v 详细信息
# -z 用来扫描端口时，不发送任何数据
# -u 默认是 TCP，加这个参数使用 UDP
nc -vz <host> <port>

# 扫描端口 1~65535
nc -vz <host> 1-65535 | grep succeeded

# 尝试发出 QUIT 来嗅探监听此端口的服务信息
echo QUIT | nc host.example.com 20-30
# SSH-1.99-OpenSSH_3.6.1p2
# Protocol mismatch.
# 220 host.example.com IMS SMTP Receiver Version 0.84 Ready

# 简易服务器，监听端口，并将结果输出到文件
nc -l <port> > output

# 建立 TCP 链接，然后你就可以发送数据了
nc <host> <port>

# 传输文件
## 发送
nc -l <port> < <file>
## 接收
nc <ip> <port> > <file>

# To open a TCP connection to port 42 of host.example.com, using port 31337 as the source port, with a timeout of 5 seconds:
nc -p 31337 -w 5 host.example.com 42

# To open a UDP connection to port 53 of host.example.com:
nc -u host.example.com 53

# To open a TCP connection to port 42 of host.example.com using 10.1.2.3 as the IP for the local end of the connection:
nc -s 10.1.2.3 host.example.com 42

# To create and listen on a UNIX-domain stream socket:
nc -lU /var/tmp/dsocket

# To connect to port 42 of host.example.com via an HTTP proxy at 10.2.3.4, port 8080. This example could also be used by ssh(1); see the ProxyCommand directive in ssh_config(5) for more information.
nc -x10.2.3.4:8080 -Xconnect host.example.com 42

# The same example again, this time enabling proxy authentication with username "ruser" if the proxy requires it:
nc -x10.2.3.4:8080 -Xconnect -Pruser host.example.com 42

# To choose the source IP for the testing using the -s option
nc -zv -s source_IP target_IP Port
