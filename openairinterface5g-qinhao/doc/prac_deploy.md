# NFAPI practical deployment

## 部署框图

![deploy](https://gitee.com/flyvideo/openairinterface5g/raw/63329cf5293608c81ce47193242a255b4dfe8235/doc/deploy.png)

如图有三台主机，不同主机都位于192.168.124.0网段，通过以太网进行通信，核心网的网元都位于docker内，但是网络模式都是host模式，通过docker-compose.yaml文件开启。各部分的开启命令如下：

#### 192.168.124.4主机

***

开启UE：sudo RFSIMULATOR=192.168.124.5 ./nr-uesoftmodem -r 106 --numerlogy 1 --band 78 -C 3619200000 --rfsim --sa --nokrnmod

开启SMF：docker-compose up -d oai-smf

**注意：在docker-compose.yaml配置文件中可以看到开启smf的镜像是oai-smf:1.6，这个镜像是特殊的，需要专门拉取，如有需要请联系邮箱lbh1771346@163.com**

#### 192.168.124.5主机

***

**VNF + PNF 实际就是gnb**

开启VNF：sudo ./nr-softmodem -O ../../../targets/PROJECTS/GENERIC-LTE-EPC/CONF/rcc.band78.tm1.106PRB.nfapi.conf --nfapi 2  --sa

开启PNF：sudo ./nr-softmodem -O ../../../targets/PROJECTS/GENERIC-LTE-EPC/CONF/oaiL1.nfapi.usrpx300.conf --nfapi 1 --rfsim --rfsimulator.serveraddr server --sa

开启AMF和mysql：docker-compose up -d mysql oai-amf

#### 192.168.124.2主机

***

开启SPGWU和EXT-DN：docker-compose up -d oai-spgwu oai-ext-dn

***

如果在smf日志中观察到 Node ID Type FQDN: oai-spgwu, IPV4 Addr: 127.0.0.1很有可能是DNS解析错误，建议在/etc/hosts文件中添加spgwu所在主机地址的解析 
**192.168.124.2 oai-spgwu**



