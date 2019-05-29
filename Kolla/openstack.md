# Openstack 使用说明

1. 不要创建外部网络，可以创建内部。
2. 不要上传镜像，并非任何镜像都能正常运行。
3. 创建实例时，要选择注入密钥对。
4. 连接虚拟机使用floating ip，右键实例-》绑定floating-ip。
5. 目前仅仅映射了80个ip，每个ip十个端口，包括22和30xx1～30xx9，规则如下。
    - floating ip range: `192.168.2.20`~`192.168.2.99`
    - 最后两位，20~99，前缀加上30，后缀加上0～9，即为公网端口映射。
    - rule
      - **202.120.40.8:30200 => 192.168.2.20:22**
      - **202.120.40.8:30201 ~ 30209 => 192.168.2.20:30201 ~ 30209**
6. 连接centos7实例，默认用户名为`centos`，ubuntu 16.04为`ubuntu`。
7. 注意检查自己所属`project`里的`安全组规则`，默认的规则没有打开入口流量。
8. openstack控制台：`http://202.120.40.8:1180`
9. 准备了kubespray offline安装包，放在http server。地址是`192.168.2.24（物理）`，`10.0.0.26（内网虚拟）`。

``` http
[root@node-100 ~]# curl 192.168.2.24/list
├── kube-1.13.5
│   ├── kube-1.13.5.tar  # docker images
│   ├── kubespray-v2.9.0.tar.gz # ansible scripts
│   └── releases
│       ├── cni-plugins-amd64-v0.6.0.tgz
│       ├── hyperkube
│       └── kubeadm
├── kube-1.14.1
│   ├── kube-1.14.1.tar  # docker images
│   ├── kubespray-2.10.0.tar.gz # ansible scripts
│   └── releases
│       ├── calicoctl
│       ├── cni-plugins-amd64-v0.6.0.tgz
│       ├── hyperkube
│       └── kubeadm
└── list
```

`.ssh/config` 

``` config
Host centos-ext
        HostName 202.120.40.8
        User centos
        Port 30220
  IdentityFile /Users/veiasai/.ssh/mykey_rsa

Host centos-in
        HostName 10.1.0.135
        User centos
        Port 22
  ProxyCommand ssh centos-ext -W %h:%p
  IdentityFile /Users/veiasai/.ssh/mykey_rsa
```