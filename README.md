# spark

Cria a Imagem Docker parana/spark

This **Dockerfile** is a [trusted build](https://hub.docker.com/r/parana/spark/) of [Docker Registry](https://hub.docker.com/).

## Building on boot2docker & Docker Machine

You need to configure swap space in boot2docker / Docker Machine prior the build:

1. Log into boot2docker / Docker Machine: `boot2docker ssh` or `docker-machine ssh default` (replace `default` if needed).
2. Create a file named `bootlocal.sh` in `/var/lib/boot2docker/` with the following content:

        #!/bin/sh

        SWAPFILE=/mnt/sda1/swapfile

        dd if=/dev/zero of=$SWAPFILE bs=1024 count=2097152
        mkswap $SWAPFILE && chmod 600 $SWAPFILE && swapon $SWAPFILE

3. Make this file executable: `chmod u+x /var/lib/boot2docker/bootlocal.sh`

After restarting boot2docker / Docker Machine, it will have increased swap size.

## How to use


```
docker run -i -t -h my-spark -p 8080:8080 -p 9999:9999 --rm parana/spark bash
```

The Container Bash shell will open and you can type:

```
cd /usr/local/spark/sbin
./start-master.sh 
starting org.apache.spark.deploy.master.Master, logging to /usr/local/spark/logs/spark--org.apache.spark.deploy.master.Master-1-36d631206ca0.out
ps -ef | grep java 
ls -lAt /usr/local/spark/logs
cat /usr/local/spark/logs/* | grep "Starting Spark master at"
# Write the spark URL to remember (suppose: "spark://my-spark:7077")
cat /usr/local/spark/logs/* | grep port
# Use the URL of Master to start the Slave
./start-slave.sh spark://my-spark:7077
# Test the master’s web UI
curl http://localhost:8080
# To run an interactive Spark shell against the cluster, run the following command:
./spark-shell --master spark://my-spark:7077
```

Open on WEB Browser in host computer

```
http://localhost:8080
```

You will see something like this.

![Spark master admin View](https://raw.githubusercontent.com/joao-parana/spark/master/docs/images/spark-master-admin.png)
