![alpine-glibc](https://csphere.cn/assets/755c1c51-c60b-4e2c-823d-9a70bcb56f7f)

## 如何使用该镜像

    $ docker pull microimages/alpine-glibc:3.3

## 快速开始

    $ docker run -it microimages/alpine-glibc:3.3 sh

## 基于`microimages/alpine-glibc`镜像,构建其他镜像

Dockefile内容：

```Dockerfile
from microimages/alpine-glibc:3.3
run apk add --update nginx
...其他命令
```

执行构建命令:

    $ docker build -t microimages/nginx .

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`
