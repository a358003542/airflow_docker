# python project docker solution
基于python的项目都可以由此构建docker image。

## 设计

### 用户名和群组继承自当前登录的用户名和群组

通过脚本 `runinenv-docker-compose.sh` 来运行 `docker-compose` 的命令。
```bash
bash runinenv-docker-compose.sh up
```

脚本获取当前登录用户的名字 UID 和 GID 然后传递给Dockerfile

- uname
- uid
- gid


### 容器内文件夹安排
容器内用户默认主文件夹是 `/home/<uname>`

默认pycode映射到容器内的 `/home/<uname>/pycode`

默认映射数据文件夹在 `/home/<uname>/data` 只要你容器外有权限，那么容器内也将有权限，容器内的程序输出的文件容器外也有权限

你的python项目代码要输出的数据都推荐输出到 `/home/data`  在启动容器的时候如下设置则你的容器内的程序输出的数据会映射到你的主机的某个文件夹：

```bash
docker run -p 9001:9001 -it --rm -v /home/wanze/data:/home/data pycode
```

### 新增 python.env 文件
通过 `docker-compose` 加载，根据因为设置当前工作目录为 `/home/pycode` ，加载环境变量 

```
PYTHONPATH=.
```

会新增当前工作目录到 `sys.path` 里面去。一般pycharm设置src所在，其会自动这样配置，这样当前目录下的一些python module文件夹我们都是可以直接调用的。







