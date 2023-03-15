# Searver creation

Server ip: `65.109.229.10`

# Install steps used

```
# for debian systems, installs Dokku via apt-get
wget https://dokku.com/install/v0.30.1/bootstrap.sh
sudo DOKKU_TAG=v0.30.1 bash bootstrap.sh
```

Setup `ssh-keys`
```
root@testdokku:~# echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDm7FUvt8KwmOihnBRIQHV3Cc9HipbweHQAWud0wa5zFCQ0zgxh7faCGyLQjnR09sJW9JiE1VdqElJGy2FBkkya4QiIubv4t2qISswbzBQOlvnYsF8OWjVOQqAX6yWIIhxW9b0vyryxIas0VwVAITO3tcVODvdd8DXn25QhJfNTbTAw2aFsJaZnDw40JdxnHwTALSc0lvvGYMY/n2iXEHLhYUd+LH3U14o8NcczuS/2TIY4sRe1OcTVKHJuQ7MClftFKJKjLoUkVWWfERGxcoEofGChTkXRjGtMge22ywhHf/Ss31kMJBR/UKZXv7jma08IHhJ43cdu4Oq+q22ZDrJqMW4Q7siqAG7rtOiViLhRIkQ3zNsCpsYNENY3Wv4uSidoCFqjiFxFnrvjlD7sJ3V04sq3JO3jnk8jJka1HwhPKseRDyJhrh6Qd5EI21fcd4z+1xAV32HcQqhuLGlEfjk5yHTXVCVFz14vYJ1n52/76uhcklDvSluXvnXlgRtNrEU= user@laptop' | dokku ssh-keys:add admin
SHA256:7ExTMxspR6KelqqedX7dX7HMQSvYREgCL4ZkCD3gM4I
```

## Create app & initialize ([git method](https://dokku.com/docs/deployment/methods/git/))

```
root@testdokku:~# dokku apps:create testapp
-----> Creating testapp...
-----> Creating new app virtual host file...
root@testdokku:~# dokku git:initialize testapp
-----> Initializing git repository for testapp
```

> Note: I was surpised I couldn't find how to add a git remote on the page [git method](https://dokku.com/docs/deployment/methods/git/), but is documented at [deploying an app](https://dokku.com/docs/deployment/application-deployment/)


Local setup:

```
git remote add dokku dokku@65.109.229.10:testapp
```

## Perform first git push

```
git push dokku main:master
```

Push output:
```
$ git push dokku master:master
Warning: Permanently added '65.109.229.10' (ED25519) to the list of known hosts.
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (6/6), 1.47 KiB | 1.47 MiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
-----> Cleaning up...
-----> Building testapp from Dockerfile
-----> Setting config vars
       DOKKU_DOCKERFILE_PORTS:  8000
remote: #1 [internal] load build definition from Dockerfile
remote: #1 transferring dockerfile: 124B done
remote: #1 DONE 0.1s
remote: 
remote: #2 [internal] load .dockerignore
remote: #2 transferring context: 2B done
remote: #2 DONE 0.0s
remote: 
remote: #3 [internal] load metadata for docker.io/library/python:latest
remote: #3 DONE 1.6s
remote: 
remote: #4 [internal] load build context
remote: #4 transferring context: 1.86kB 0.0s done
remote: #4 DONE 0.0s
remote: 
remote: #5 [1/2] FROM docker.io/library/python@sha256:1db68f83ca0d2735aeb804708cbc2b7be573ff4c236b2bbfa220bbac81512bb8
remote: #5 resolve docker.io/library/python@sha256:1db68f83ca0d2735aeb804708cbc2b7be573ff4c236b2bbfa220bbac81512bb8 0.0s done
remote: #5 sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf 0B / 5.17MB 0.1s
remote: #5 sha256:a8405b7e74cfd825621793b3448c3786d578dc2df4a4694e7dd8c2df40f1f7c5 8.92kB / 8.92kB done
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 0B / 55.05MB 0.1s
remote: #5 sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604 0B / 10.88MB 0.1s
remote: #5 sha256:1db68f83ca0d2735aeb804708cbc2b7be573ff4c236b2bbfa220bbac81512bb8 2.14kB / 2.14kB done
remote: #5 sha256:f776eb0acc768c0227cd336e33a97f3054101cf35ee6d5d8dc51b82349429925 2.22kB / 2.22kB done
remote: #5 sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf 2.10MB / 5.17MB 0.2s
remote: #5 sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf 5.17MB / 5.17MB 0.3s done
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 11.53MB / 55.05MB 0.4s
remote: #5 sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604 8.39MB / 10.88MB 0.4s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 0B / 54.59MB 0.4s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 16.78MB / 55.05MB 0.5s
remote: #5 sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604 10.88MB / 10.88MB 0.4s done
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 0B / 196.81MB 0.5s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 22.02MB / 55.05MB 0.6s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 6.93MB / 54.59MB 0.6s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 26.21MB / 55.05MB 0.7s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 12.58MB / 54.59MB 0.7s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 33.55MB / 55.05MB 0.9s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 19.92MB / 54.59MB 0.9s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 37.75MB / 55.05MB 1.0s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 24.44MB / 54.59MB 1.0s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 15.73MB / 196.81MB 1.0s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 48.23MB / 55.05MB 1.2s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 33.55MB / 54.59MB 1.2s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 51.38MB / 55.05MB 1.3s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 37.54MB / 54.59MB 1.3s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 26.21MB / 196.81MB 1.3s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 55.05MB / 55.05MB 1.4s
remote: #5 sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 55.05MB / 55.05MB 1.4s done
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 44.04MB / 54.59MB 1.5s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 36.70MB / 196.81MB 1.5s
remote: #5 sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 0B / 6.29MB 1.5s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 51.38MB / 54.59MB 1.7s
remote: #5 sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 2.10MB / 6.29MB 1.7s
remote: #5 sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 6.29MB / 6.29MB 1.8s
remote: #5 sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 54.59MB / 54.59MB 1.8s done
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 51.38MB / 196.81MB 1.9s
remote: #5 sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 6.29MB / 6.29MB 1.9s done
remote: #5 extracting sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 0.1s
remote: #5 sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 0B / 20.05MB 1.9s
remote: #5 sha256:86f9457966ab88b64b3db60c24031e3ad58b40db377586e0aacd8d09a294ee58 0B / 234B 1.9s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 66.06MB / 196.81MB 2.1s
remote: #5 sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 3.15MB / 20.05MB 2.1s
remote: #5 sha256:86f9457966ab88b64b3db60c24031e3ad58b40db377586e0aacd8d09a294ee58 234B / 234B 2.0s done
remote: #5 sha256:896264e2a03c08702fd443b414c8d2da9fbe71f5e051bf3e2fea2ec9b2763b61 0B / 3.06MB 2.1s
remote: #5 sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 9.44MB / 20.05MB 2.2s
remote: #5 sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 14.68MB / 20.05MB 2.3s
remote: #5 sha256:896264e2a03c08702fd443b414c8d2da9fbe71f5e051bf3e2fea2ec9b2763b61 3.06MB / 3.06MB 2.3s done
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 79.69MB / 196.81MB 2.5s
remote: #5 sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 20.05MB / 20.05MB 2.4s done
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 93.32MB / 196.81MB 3.0s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 106.95MB / 196.81MB 3.3s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 118.49MB / 196.81MB 3.5s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 139.15MB / 196.81MB 3.8s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 156.24MB / 196.81MB 4.0s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 176.16MB / 196.81MB 4.3s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 192.94MB / 196.81MB 4.5s
remote: #5 sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 196.81MB / 196.81MB 4.6s done
remote: #5 extracting sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 5.2s done
remote: #5 extracting sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf
remote: #5 extracting sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf 0.4s done
remote: #5 extracting sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604
remote: #5 extracting sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604 0.5s done
remote: #5 extracting sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d
remote: #5 extracting sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 4.3s done
remote: #5 extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c
remote: #5 extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 5.0s
remote: #5 extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 10.0s
remote: #5 extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 12.4s done
remote: #5 extracting sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 0.1s
remote: #5 extracting sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a 0.6s done
remote: #5 extracting sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e
remote: #5 extracting sha256:2da42ff3382c8728675ad6da038dd6c40010bb5775c485a51ed82e46a28fca8e 1.4s done
remote: #5 extracting sha256:86f9457966ab88b64b3db60c24031e3ad58b40db377586e0aacd8d09a294ee58 done
remote: #5 extracting sha256:896264e2a03c08702fd443b414c8d2da9fbe71f5e051bf3e2fea2ec9b2763b61
remote: #5 extracting sha256:896264e2a03c08702fd443b414c8d2da9fbe71f5e051bf3e2fea2ec9b2763b61 0.5s done
remote: #5 DONE 28.4s
remote: 
remote: #6 [2/2] COPY . .
remote: #6 DONE 0.2s
remote: 
remote: #7 exporting to image
remote: #7 exporting layers 0.0s done
remote: #7 writing image sha256:75d04152091af7906531d27f2808b7fd3d91d4ec3ba6bb7c276192904db64435 done
remote: #7 naming to docker.io/dokku/testapp:latest done
remote: #7 DONE 0.0s
-----> Releasing testapp...
-----> Checking for predeploy task
       No predeploy task found, skipping
-----> Checking for release task
       No release task found, skipping
-----> Checking for first deploy postdeploy task
       No first deploy postdeploy task found, skipping
=====> Processing deployment checks
       No CHECKS file found. Simple container checks will be performed.
       For more efficient zero downtime deployments, create a CHECKS file. See https://dokku.com/docs/deployment/zero-downtime-deploys/ for examples
-----> Deploying testapp via the docker-local scheduler...
-----> Deploying web (count=1)
       Attempting pre-flight checks (web.1)
       Waiting for 10 seconds (web.1)
       Default container check successful (web.1)
=====> Triggering early nginx proxy rebuild
-----> Ensuring network configuration is in sync for testapp
-----> Configuring testapp.testdokku...(using built-in template)
-----> Creating http nginx.conf
       Reloading nginx
-----> Running post-deploy
remote:  !     Detected IPv4 domain name with nginx proxy enabled.
remote:  !     Ensure the default nginx site is removed before continuing.
-----> Ensuring network configuration is in sync for testapp
-----> Configuring testapp.testdokku...(using built-in template)
-----> Creating http nginx.conf
       Reloading nginx
-----> Renaming containers
       Renaming container testapp.web.1.upcoming-7241 (787586fe792c) to testapp.web.1
-----> Checking for postdeploy task
       No postdeploy task found, skipping
=====> Application deployed:
       http://testapp.testdokku:8000

To 65.109.229.10:testapp
 * [new branch]      master -> master
```

# Set dokku domain global

```
root@testdokku:~# dokku domains:report 
=====> testapp domains information
       Domains app enabled:           true                     
       Domains app vhosts:            testapp.testdokku        
       Domains global enabled:        true                     
       Domains global vhosts:         testdokku
```

### Remove unused domains
```
root@testdokku:~# dokku domains:remove testapp testapp.testdokku
-----> Removed testapp.testdokku from testapp
-----> Creating http nginx.conf
       Reloading nginx
root@testdokku:~# dokku domains:remove testapp testdokku
-----> Removed testdokku from testapp
-----> Creating http nginx.conf
       Reloading nginx
```

## Add global domain

```
root@testdokku:~# dokku domains:add-global 65.109.229.10.sslip.io
-----> Added 65.109.229.10.sslip.io
```

## Add domain to app
```
root@testdokku:~# dokku domains:add testapp testapp.65.109.229.10.sslip.io
-----> Added testapp.65.109.229.10.sslip.io to testapp
-----> Configuring testapp.65.109.229.10.sslip.io...(using built-in template)
-----> Creating http nginx.conf
       Reloading nginx
```
```
root@testdokku:~# dokku domains:report 
=====> testapp domains information
       Domains app enabled:           true                     
       Domains app vhosts:            testapp.65.109.229.10.sslip.io
       Domains global enabled:        true                     
       Domains global vhosts:         testdokku 65.109.229.10.sslip.io
```

## Validate app OK

```
$ curl http://testapp.65.109.229.10.sslip.io:8000/ | grep 'This is a test.'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    16  100    16    0     0     47      0 --:--:-- --:--:-- --:--:--    47
This is a test.
```

## Deploy again (after `fdbb468c2afbf544215cbea688f7e5930972aef9`)

```
$ git push dokku master:master 
Warning: Permanently added '65.109.229.10' (ED25519) to the list of known hosts.
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 8 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 4.14 KiB | 2.07 MiB/s, done.
Total 6 (delta 3), reused 0 (delta 0), pack-reused 0
-----> Cleaning up...
-----> Building testapp from Dockerfile
-----> Setting config vars
       DOKKU_DOCKERFILE_PORTS:  8000
remote: #1 [internal] load .dockerignore
remote: #1 transferring context: 2B done
remote: #1 DONE 0.0s
remote: 
remote: #2 [internal] load build definition from Dockerfile
remote: #2 transferring dockerfile: 124B 0.1s done
remote: #2 DONE 0.1s
remote: 
remote: #3 [internal] load metadata for docker.io/library/python:latest
remote: #3 DONE 0.8s
remote: 
remote: #4 [1/2] FROM docker.io/library/python@sha256:1db68f83ca0d2735aeb804708cbc2b7be573ff4c236b2bbfa220bbac81512bb8
remote: #4 DONE 0.0s
remote: 
remote: #5 [internal] load build context
remote: #5 transferring context: 15.01kB done
remote: #5 DONE 0.0s
remote: 
remote: #4 [1/2] FROM docker.io/library/python@sha256:1db68f83ca0d2735aeb804708cbc2b7be573ff4c236b2bbfa220bbac81512bb8
remote: #4 CACHED
remote: 
remote: #6 [2/2] COPY . .
remote: #6 DONE 0.0s
remote: 
remote: #7 exporting to image
remote: #7 exporting layers 0.0s done
remote: #7 writing image sha256:098ce2c2a517933e6d8bc27f03575bbb9e4a0177c0fb38afd0db63639d18745f done
remote: #7 naming to docker.io/dokku/testapp:latest done
remote: #7 DONE 0.0s
-----> Releasing testapp...
-----> Checking for predeploy task
       No predeploy task found, skipping
-----> Checking for release task
       No release task found, skipping
=====> Processing deployment checks
       No CHECKS file found. Simple container checks will be performed.
       For more efficient zero downtime deployments, create a CHECKS file. See https://dokku.com/docs/deployment/zero-downtime-deploys/ for examples
-----> Deploying testapp via the docker-local scheduler...
-----> Deploying web (count=1)
       Attempting pre-flight checks (web.1)
       Waiting for 10 seconds (web.1)
       Default container check successful (web.1)
       Scheduling old container shutdown in 60 seconds (web.1)
=====> Triggering early nginx proxy rebuild
-----> Ensuring network configuration is in sync for testapp
-----> Configuring testapp.65.109.229.10.sslip.io...(using built-in template)
-----> Creating http nginx.conf
       Reloading nginx
-----> Running post-deploy
remote:  !     Detected IPv4 domain name with nginx proxy enabled.
remote:  !     Ensure the default nginx site is removed before continuing.
-----> Ensuring network configuration is in sync for testapp
-----> Configuring testapp.65.109.229.10.sslip.io...(using built-in template)
-----> Creating http nginx.conf
       Reloading nginx
-----> Renaming containers
       Found previous container(s) (787586fe792c) named testapp.web.1
       Renaming container (787586fe792c) testapp.web.1 to testapp.web.1.1678897911
       Renaming container testapp.web.1.upcoming-5661 (90fece539d9c) to testapp.web.1
-----> Checking for postdeploy task
       No postdeploy task found, skipping
-----> Shutting down old containers in 60 seconds
=====> Application deployed:
       http://testapp.65.109.229.10.sslip.io:8000

To 65.109.229.10:testapp
   619d8f9..fdbb468  master -> master
```

# Add to github (to prepare for some automation)

```
git remote add origin git@github.com:KarmaComputing/testapp.git
git branch -M main
git push -u origin main
```

> Note: Branch name changed from `master` -> `main`

## Setup dokku simple github action
```
vim .github/workflows/dokku-simple.yml
# use https://github.com/dokku/github-action/blob/master/example-workflows/simple.yml
```

