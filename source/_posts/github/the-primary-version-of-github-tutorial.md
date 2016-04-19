title: github 使用教程初级版
date: 2015-09-30 10:59:46
categories: github
keywords: github,git,ssh
tags: [github,git,ssh]
---

[github](https://github.com/) 是一个基于 git 的代码托管平台，付费用户可以建私人仓库，免费用户只能使用公共仓库。对于一般人来说公共仓库就已经足够了，而且也没多少代码来管理。下面简单介绍如何使用 [github](https://github.com/)，供初学者参考。
<!--more-->

## 注册账号

在使用 [github](https://github.com/) 之前你得先有个账号，[点此注册](https://github.com/join)。

## 建立仓库

点击右上角加号，选择 *New repository*，如图所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/09/1.png)

然后填写仓库名称，选上 *Initialize this repository with a README*，这个意思是在建立仓库时自动生成 *README.md* 文件，最后 *Create repository*，如图所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/09/2.png)

这样仓库算是建立好了。

## 安装客户端 msysgit

[github](https://github.com/) 是服务端，要想在自己电脑上使用 git 还需要一个 git 客户端。在这里我们选用 [msysgit](https://git-for-windows.github.io/)，这个只是提供了 git 的核心功能，而且是基于命令行的。如果想要图形界面的话只要在 [msysgit](https://git-for-windows.github.io/) 的基础上安装 [TortoiseGit](http://tortoisegit.org/) 即可。

装完 [msysgit](https://git-for-windows.github.io/) 后右键鼠标会多出一些选项来，然后我们在本地新建个文件夹（比如叫 github），右键选择 *Git Init Here*，这样 [github](https://github.com/) 文件夹内会多出来一个 .git 文件夹，这就表示本地 git 创建成功。右键 *Git Bash* 进入 git 命令行就可以把刚刚新建的仓库克隆到本地，当然我们还需要配置下 *ssh key*。

## 配置 git

首先在本地创建 *ssh key*：

``` bash
$ ssh-keygen -t rsa -C "your_email@youremail.com"
```

后面的 your_email@youremail.com 改为自己的邮箱，之后会要求确认路径和输入密码，这里使用默认的一路回车就行。成功的话会在 ~/ 下生成 .ssh 文件夹，打开 *id_rsa.pub*，复制里面的 *key*，回到 [github](https://github.com/)，进入 *settings*，左侧选择 *SSH keys*，点击 *Add SSH Key*，title 随便填，粘贴 *key*。为了验证是否成功，在 *git bash* 下输入：

``` bash
$ ssh -T git@github.com
```

如果是第一次的会提示是否 *continue*，输入 *yes* 就会看到：*You've successfully authenticated, but GitHub does not provide shell access*，这就表示已成功连上 [github](https://github.com/)。

接下来我们要做的就是把 [github](https://github.com/) 上面建立的仓库克隆到本地，在此之前还需要设置 *username* 和 *email*，因为 [github](https://github.com/) 每次 `commit` 都会记录他们。

``` bash
$ git config --global user.name "your name"
$ git config --global user.email "your_email@youremail.com"
```

克隆到本地（比如克隆 css 的项目）：

``` bash
$ git clone git@github.com:zhuyujia/css.git
```

需要注意的是：[github](https://github.com/) 提供了 3 种 url 路径（HTTPS，SSH，Subversion），一般如果账号处于登录状态，那么我们可以用 SSH，就像上面的代码，如果没有登录的话，只能用 HTTPS 的 url 了，如图所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/09/3.png)

克隆成功，如下所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/09/4.png)

## 修改，提交，上传

我们可以修改克隆到本地的项目，修改完成后先要 `add` 修改的文件（. 表示全部），然后填写 `commit`，最后在 `push` 到 [github](https://github.com/)。

``` bash
$ git add .
$ git commit -m 'update'
$ git push
```

当然我们也可以通过 *Git Gui* 图形界面来提交和上传。

## 参考资料

[github 简单使用教程](http://wuyuans.com/2012/05/github-simple-tutorial/)

[关于初学者上传文件到 github 的方法](http://www.cnblogs.com/findingsea/archive/2012/08/27/2654549.html)