# Troubleshooting Dokku issue (#5743 Procfile.250547.missing: no such file or directory)[https://github.com/dokku/dokku/issues/5743]

- The issue: `remote:  !     open /var/lib/dokku/data/ps/main/Procfile.250547.missing: no such file or directory`
- The cuase: (Unkown- that's what this repo is investigating)


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

### Observe github action simple successful:

Yes: https://github.com/KarmaComputing/testapp/actions/runs/4428764231/jobs/7768305331

Proof:

```
curl http://testapp.65.109.229.10.sslip.io:8000/ | grep 'added action simple'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    36  100    36    0     0    284      0 --:--:-- --:--:-- --:--:--   283
This is a test. added action simple

```

# Hunch: DO `Dockerfile`'s with `# syntax = docker/dockerfile:experimental` trip-up dokku build type detection?

Other thoughts:

- Race conditions? We often see the issue in combination with Github Action runs, are multiple runes/cancelled builds confusing dokku when a pull request github action is re-built?


## Destory app before testing `# syntax = docker/dockerfile:experimental` theory

```
# dokku apps:list
=====> My Apps
testapp
root@testdokku:~# dokku apps:destroy testapp
 !     WARNING: Potentially Destructive Action
 !     This command will destroy app testapp.
 !     To proceed, type "testapp"
> testapp
-----> Destroying testapp (including all add-ons)
-----> Cleaning up...
-----> Retiring old containers and images
```

```
git commit -am 'test theory # syntax = docker/dockerfile:experimental'
git push origin main
```

Result: Green github action dokku-deploy simple: https://github.com/KarmaComputing/testapp/actions/runs/4429023817/jobs/7768919531

## Test race condition - are multiple deploys start/stops/canceled runs causing the issue?

- added `.github/workflows/pr-preview.yml`.
- Corrected missing secrets [(ff73f4603f036af5cd0b49f44b97dff377a3cc3f](https://github.com/KarmaComputing/testapp/commit/ff73f4603f036af5cd0b49f44b97dff377a3cc3f))
- **Re-created issue**: (`remote:  !     open /var/lib/dokku/data/ps/main/Procfile.250547.missing: no such file or directory`)[https://github.com/KarmaComputing/testapp/actions/runs/4436541590/jobs/7785096767#step:7:37]

Let's turn on trace and catch more info then push again.

Turning on dokku trace:

 ```
 # dokku trace:on
 -----> Enabling trace mode
 # exit
```

two pipeliness ran, finally we have recreated the issue.

# Issue has been re-created here:

- One failure <strike>(but not the Proc error we're interested in)</strike> (at first I missed , then saw in-fact we had re-created the issue in this run), We've re-created the Procfile issue!: https://github.com/KarmaComputing/testapp/actions/runs/4436620363/jobs/7785270827#step:7:1310  "`open /var/lib/dokku/data/ps/main/Procfile.272993.missing: no such file or directory`"

Re-running the failed job.

> Note we're *intentionally* allowing two dokku pipelines to run, to test the hypothesis of a potential race condition/locking issue, though,
  it's bizzar (to me) why dokku is searching for a Procfile at all given this is a Dockerfile build type.

## Github action pipeline output with `dokku trace:on` for run https://github.com/KarmaComputing/testapp/actions/runs/4436620363/jobs/7785270827#step:7:1310

Dokku issue: https://github.com/dokku/dokku/issues/5743

about 27 mins after running the pipeline (output below) I ran: `ls -lah /var/lib/dokku/data/ps/*` (as requested)[https://github.com/dokku/dokku/issues/5743#issuecomment-1469401706]
```
ls -lah /var/lib/dokku/data/ps/*
-rw------- 1 dokku dokku    0 Mar 15 16:05 /var/lib/dokku/data/ps/retire

/var/lib/dokku/data/ps/testapp:
total 8.0K
drwxr-xr-x 2 dokku dokku 4.0K Mar 16 11:54 .
drwxr-xr-x 3 dokku dokku 4.0K Mar 15 17:12 ..
```

```
...redacted logs from https://github.com/KarmaComputing/testapp/blob/ff73f4603f036af5cd0b49f44b97dff377a3cc3f/.github/workflows/pr-preview.yml#L20-L37
...
2023-03-16T11:40:29.6371345Z ##[group]Run set -x
2023-03-16T11:40:29.6371853Z ␛[36;1mset -x␛[0m
2023-03-16T11:40:29.6372295Z ␛[36;1mecho SUBDOMAIN=`echo main` >> $GITHUB_ENV␛[0m
2023-03-16T11:40:29.6372886Z ␛[36;1mecho $GITHUB_ENV␛[0m
2023-03-16T11:40:29.6429312Z shell: /usr/bin/bash -e {0}
2023-03-16T11:40:29.6429746Z ##[endgroup]
2023-03-16T11:40:29.6521781Z ++ echo main
2023-03-16T11:40:29.6525071Z + echo SUBDOMAIN=main
2023-03-16T11:40:29.6526243Z /home/runner/work/_temp/_runner_file_commands/set_env_a367860e-d583-4f09-bdd0-15d749629795
2023-03-16T11:40:29.6528524Z + echo /home/runner/work/_temp/_runner_file_commands/set_env_a367860e-d583-4f09-bdd0-15d749629795
2023-03-16T11:40:29.6636481Z ##[group]Run set -x
2023-03-16T11:40:29.6637232Z ␛[36;1mset -x␛[0m
2023-03-16T11:40:29.6638219Z ␛[36;1meval `ssh-agent -s`␛[0m
2023-03-16T11:40:29.6639008Z ␛[36;1mssh-add - <<< "$SSH_PRIVATE_KEY"␛[0m
2023-03-16T11:40:29.6639969Z ␛[36;1mecho Creating dokku app main␛[0m
2023-03-16T11:40:29.6640802Z ␛[36;1mssh dokku@$DOKKU_HOST -C "apps:create main" | true␛[0m
2023-03-16T11:40:29.6701475Z shell: /usr/bin/bash -e {0}
2023-03-16T11:40:29.6702167Z env:
2023-03-16T11:40:29.6702725Z   SUBDOMAIN: main
2023-03-16T11:40:29.6710766Z   SSH_PRIVATE_KEY: ***
2023-03-16T11:40:29.6711481Z   DOKKU_HOST: 65.109.229.10
2023-03-16T11:40:29.6712245Z ##[endgroup]
2023-03-16T11:40:29.6792061Z ++ ssh-agent -s
2023-03-16T11:40:29.6828161Z Agent pid 1875
2023-03-16T11:40:29.6831014Z + eval 'SSH_AUTH_SOCK=/tmp/ssh-vp7QJuF7ohkN/agent.1874;' export 'SSH_AUTH_SOCK;' 'SSH_AGENT_PID=1875;' export 'SSH_AGENT_PID;' echo Agent pid '1875;'
2023-03-16T11:40:29.6832032Z ++ SSH_AUTH_SOCK=/tmp/ssh-vp7QJuF7ohkN/agent.1874
2023-03-16T11:40:29.6832612Z ++ export SSH_AUTH_SOCK
2023-03-16T11:40:29.6833165Z ++ SSH_AGENT_PID=1875
2023-03-16T11:40:29.6833672Z ++ export SSH_AGENT_PID
2023-03-16T11:40:29.6834490Z ++ echo Agent pid 1875
2023-03-16T11:40:29.6835367Z + ssh-add -
2023-03-16T11:40:29.6886099Z Identity added: (stdin) (chris@chris-inf)
2023-03-16T11:40:29.6889278Z Creating dokku app main
2023-03-16T11:40:29.6891627Z + echo Creating dokku app main
2023-03-16T11:40:29.6892884Z + true
2023-03-16T11:40:29.6896125Z + ssh dokku@65.109.229.10 -C 'apps:create main'
2023-03-16T11:40:32.9953868Z + export DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:32.9954962Z + DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:32.9955689Z + export DOKKU_DISTRO
2023-03-16T11:40:32.9990441Z ++ . /etc/os-release
2023-03-16T11:40:32.9992978Z ++ echo ubuntu
2023-03-16T11:40:33.0068923Z + DOKKU_DISTRO=ubuntu
2023-03-16T11:40:33.0069572Z + export DOCKER_BIN=docker
2023-03-16T11:40:33.0070149Z + DOCKER_BIN=docker
2023-03-16T11:40:33.0071549Z + export DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:33.0072246Z + DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:33.0073602Z + export DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:33.0074113Z + DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:33.0074752Z + export DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:33.0075194Z + DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:33.0075661Z + export PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:33.0076155Z + PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:33.0076645Z + export PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:33.0077220Z + PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:33.0078175Z + export PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:33.0078752Z + PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:33.0079372Z + export PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:33.0079951Z + PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:33.0080601Z + export PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:33.0081288Z + PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:33.0082479Z + export PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:33.0083146Z + PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:33.0083663Z + export DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:33.0084078Z + DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:33.0084843Z + export DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:33.0085289Z + DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:33.0085708Z + export DOKKU_API_VERSION=1
2023-03-16T11:40:33.0086313Z + DOKKU_API_VERSION=1
2023-03-16T11:40:33.0086771Z + export DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:33.0087250Z + DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:33.0087707Z + export DOKKU_VALID_EXIT=0
2023-03-16T11:40:33.0088452Z + DOKKU_VALID_EXIT=0
2023-03-16T11:40:33.0089121Z + export DOKKU_PID=270010
2023-03-16T11:40:33.0089706Z + DOKKU_PID=270010
2023-03-16T11:40:33.0090126Z + export DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:33.0090718Z + DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:33.0091523Z + export DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:33.0092093Z + DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:33.0092660Z + export DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:33.0093258Z + DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:33.0093826Z + export DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:33.0096339Z + DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:33.0098480Z + export 'DOKKU_GLOBAL_BUILD_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.0099743Z + DOKKU_GLOBAL_BUILD_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.0100920Z + export 'DOKKU_GLOBAL_RUN_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.0101924Z + DOKKU_GLOBAL_RUN_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.0102691Z + source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:33.0103223Z ++ set -eo pipefail
2023-03-16T11:40:33.0103643Z ++ [[ -n 1 ]]
2023-03-16T11:40:33.0104019Z ++ set -x
2023-03-16T11:40:33.0194704Z + parse_args apps:create main
2023-03-16T11:40:33.0209337Z + declare 'desc=top-level cli arg parser'
2023-03-16T11:40:33.0210029Z + local next_index=1
2023-03-16T11:40:33.0210600Z + local skip=false
2023-03-16T11:40:33.1611888Z + args=('apps:create' 'main')
2023-03-16T11:40:33.1612315Z + local args
2023-03-16T11:40:33.1612707Z + local flags
2023-03-16T11:40:33.1613103Z + for arg in "$@"
2023-03-16T11:40:33.1613489Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1614039Z + case "$arg" in
2023-03-16T11:40:33.1614797Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1615430Z + [[ apps:create == \-\-\a\p\p ]]
2023-03-16T11:40:33.1616123Z + [[ apps:create =~ ^--.* ]]
2023-03-16T11:40:33.1616570Z + next_index=2
2023-03-16T11:40:33.1617153Z + for arg in "$@"
2023-03-16T11:40:33.1617771Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1618360Z + case "$arg" in
2023-03-16T11:40:33.1618765Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1619401Z + [[ main == \-\-\a\p\p ]]
2023-03-16T11:40:33.1619862Z + [[ main =~ ^--.* ]]
2023-03-16T11:40:33.1620251Z + next_index=3
2023-03-16T11:40:33.1620687Z + [[ -z '' ]]
2023-03-16T11:40:33.1621492Z ++ sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
2023-03-16T11:40:33.1621957Z ++ echo -e ''
2023-03-16T11:40:33.1622360Z + export DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:33.1622778Z + DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:33.1623147Z + return 0
2023-03-16T11:40:33.1623517Z + args=("$@")
2023-03-16T11:40:33.1623895Z + skip_arg=false
2023-03-16T11:40:33.1624526Z + [[ apps:create =~ ^--.* ]]
2023-03-16T11:40:33.1624911Z + has_tty
2023-03-16T11:40:33.1625415Z + declare 'desc=return 0 if we have a tty'
2023-03-16T11:40:33.1625903Z + [[ '' == \t\r\u\e ]]
2023-03-16T11:40:33.1626453Z ++ LC_ALL=C
2023-03-16T11:40:33.1626846Z ++ /usr/bin/tty
2023-03-16T11:40:33.1627627Z ++ true
2023-03-16T11:40:33.1628171Z + [[ not a tty == \n\o\t\ \a\ \t\t\y ]]
2023-03-16T11:40:33.1628596Z + return 1
2023-03-16T11:40:33.1629409Z + DOKKU_QUIET_OUTPUT=1
2023-03-16T11:40:33.1630025Z ++ id -un
2023-03-16T11:40:33.1630434Z + [[ dokku != \d\o\k\k\u ]]
2023-03-16T11:40:33.1630873Z + [[ apps:create =~ ^plugin:.* ]]
2023-03-16T11:40:33.1631397Z + [[ apps:create == \s\s\h\-\k\e\y\s\:\a\d\d ]]
2023-03-16T11:40:33.1631980Z + [[ apps:create == \s\s\h\-\k\e\y\s\:\r\e\m\o\v\e ]]
2023-03-16T11:40:33.1633571Z + [[ -n apps:create main ]]
2023-03-16T11:40:33.1634104Z + export -n SSH_ORIGINAL_COMMAND
2023-03-16T11:40:33.1634652Z + [[ apps:create =~ config-* ]]
2023-03-16T11:40:33.1635191Z + [[ apps:create =~ docker-options* ]]
2023-03-16T11:40:33.1635819Z + set -f
2023-03-16T11:40:33.1637015Z + /usr/bin/dokku apps:create main
2023-03-16T11:40:33.1637956Z + export DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:33.1638430Z + DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:33.1638919Z + export DOKKU_DISTRO
2023-03-16T11:40:33.1639460Z ++ . /etc/os-release
2023-03-16T11:40:33.1639887Z ++ echo ubuntu
2023-03-16T11:40:33.1640784Z + DOKKU_DISTRO=ubuntu
2023-03-16T11:40:33.1641188Z + export DOCKER_BIN=docker
2023-03-16T11:40:33.1641594Z + DOCKER_BIN=docker
2023-03-16T11:40:33.1642098Z + export DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:33.1642663Z + DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:33.1643143Z + export DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:33.1643595Z + DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:33.1644032Z + export DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:33.1644635Z + DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:33.1645073Z + export PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:33.1645552Z + PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:33.1646056Z + export PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:33.1646615Z + PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:33.1647142Z + export PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:33.1647825Z + PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:33.1648420Z + export PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:33.1648969Z + PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:33.1649592Z + export PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:33.1650265Z + PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:33.1650925Z + export PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:33.1651555Z + PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:33.1652056Z + export DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:33.1652705Z + DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:33.1653129Z + export DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:33.1653558Z + DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:33.1653974Z + export DOKKU_API_VERSION=1
2023-03-16T11:40:33.1654382Z + DOKKU_API_VERSION=1
2023-03-16T11:40:33.1654815Z + export DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:33.1655273Z + DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:33.1655683Z + export DOKKU_VALID_EXIT=0
2023-03-16T11:40:33.1656101Z + DOKKU_VALID_EXIT=0
2023-03-16T11:40:33.1656661Z + export DOKKU_PID=270034
2023-03-16T11:40:33.1657223Z + DOKKU_PID=270034
2023-03-16T11:40:33.1657654Z + export DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:33.1658289Z + DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:33.1658742Z + export DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:33.1659199Z + DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:33.1659688Z + export DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:33.1660219Z + DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:33.1660858Z + export DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:33.1661440Z + DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:33.1662246Z + export 'DOKKU_GLOBAL_BUILD_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.1663450Z + DOKKU_GLOBAL_BUILD_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.1664455Z + export 'DOKKU_GLOBAL_RUN_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.1665454Z + DOKKU_GLOBAL_RUN_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:33.1666226Z + source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:33.1666743Z ++ set -eo pipefail
2023-03-16T11:40:33.1667165Z ++ [[ -n 1 ]]
2023-03-16T11:40:33.1667559Z ++ set -x
2023-03-16T11:40:33.1667939Z + parse_args apps:create main
2023-03-16T11:40:33.1668575Z + declare 'desc=top-level cli arg parser'
2023-03-16T11:40:33.1669045Z + local next_index=1
2023-03-16T11:40:33.1669444Z + local skip=false
2023-03-16T11:40:33.1669890Z + args=('apps:create' 'main')
2023-03-16T11:40:33.1670302Z + local args
2023-03-16T11:40:33.1670680Z + local flags
2023-03-16T11:40:33.1671042Z + for arg in "$@"
2023-03-16T11:40:33.1671434Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1671828Z + case "$arg" in
2023-03-16T11:40:33.1672204Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1672671Z + [[ apps:create == \-\-\a\p\p ]]
2023-03-16T11:40:33.1673139Z + [[ apps:create =~ ^--.* ]]
2023-03-16T11:40:33.1673517Z + next_index=2
2023-03-16T11:40:33.1673893Z + for arg in "$@"
2023-03-16T11:40:33.1674286Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1674661Z + case "$arg" in
2023-03-16T11:40:33.1675046Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:33.1675495Z + [[ main == \-\-\a\p\p ]]
2023-03-16T11:40:33.1676090Z + [[ main =~ ^--.* ]]
2023-03-16T11:40:33.1676485Z + next_index=3
2023-03-16T11:40:33.1676915Z + [[ -z '' ]]
2023-03-16T11:40:33.1677525Z ++ sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
2023-03-16T11:40:33.1678041Z ++ echo -e ''
2023-03-16T11:40:33.1678453Z + export DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:33.1678865Z + DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:33.1679274Z + return 0
2023-03-16T11:40:33.1679834Z + args=("$@")
2023-03-16T11:40:33.1680205Z + skip_arg=false
2023-03-16T11:40:33.1680779Z + [[ apps:create =~ ^--.* ]]
2023-03-16T11:40:33.1681160Z + has_tty
2023-03-16T11:40:33.1681627Z + declare 'desc=return 0 if we have a tty'
2023-03-16T11:40:33.1682104Z + [[ '' == \t\r\u\e ]]
2023-03-16T11:40:33.1682471Z ++ LC_ALL=C
2023-03-16T11:40:33.1682843Z ++ /usr/bin/tty
2023-03-16T11:40:33.1683213Z ++ true
2023-03-16T11:40:33.1683588Z + [[ not a tty == \n\o\t\ \a\ \t\t\y ]]
2023-03-16T11:40:33.1683996Z + return 1
2023-03-16T11:40:33.1684551Z + DOKKU_QUIET_OUTPUT=1
2023-03-16T11:40:33.1684971Z ++ id -un
2023-03-16T11:40:33.1685366Z + [[ dokku != \d\o\k\k\u ]]
2023-03-16T11:40:33.1685803Z + [[ apps:create =~ ^plugin:.* ]]
2023-03-16T11:40:33.1686321Z + [[ apps:create == \s\s\h\-\k\e\y\s\:\a\d\d ]]
2023-03-16T11:40:33.1687035Z + [[ apps:create == \s\s\h\-\k\e\y\s\:\r\e\m\o\v\e ]]
2023-03-16T11:40:33.1687546Z + [[ -n '' ]]
2023-03-16T11:40:33.1688103Z + dokku_auth apps:create main
2023-03-16T11:40:33.1688614Z + declare 'desc=calls user-auth plugin trigger'
2023-03-16T11:40:33.1689089Z + export SSH_USER=dokku
2023-03-16T11:40:33.1689498Z + SSH_USER=dokku
2023-03-16T11:40:33.1689886Z + export SSH_NAME=admin
2023-03-16T11:40:33.1690440Z + SSH_NAME=admin
2023-03-16T11:40:33.1690848Z + export DOKKU_COMMAND=apps:create
2023-03-16T11:40:33.1691260Z + DOKKU_COMMAND=apps:create
2023-03-16T11:40:33.1710991Z ++ wc -l
2023-03-16T11:40:33.1712516Z ++ find /var/lib/dokku/plugins/enabled/20_events/user-auth
2023-03-16T11:40:33.1713562Z + local user_auth_count=1
2023-03-16T11:40:33.1714039Z + [[ 1 == 0 ]]
2023-03-16T11:40:33.1714494Z + [[ 1 == 1 ]]
2023-03-16T11:40:33.1715202Z + [[ -f /var/lib/dokku/plugins/enabled/20_events/user-auth ]]
2023-03-16T11:40:33.1720226Z + return 0
2023-03-16T11:40:33.1721066Z + case "$1" in
2023-03-16T11:40:33.1721527Z + execute_dokku_cmd apps:create main
2023-03-16T11:40:33.1722548Z + declare 'desc=executes dokku sub-commands'
2023-03-16T11:40:33.1723217Z + local PLUGIN_NAME=apps:create
2023-03-16T11:40:33.1724017Z + local PLUGIN_CMD=apps:create
2023-03-16T11:40:33.1724783Z + local implemented=0
2023-03-16T11:40:33.1725694Z + local script
2023-03-16T11:40:33.1726385Z + argv=('apps:create' 'main')
2023-03-16T11:40:33.1726828Z + local argv
2023-03-16T11:40:33.1727283Z + case "$PLUGIN_NAME" in
2023-03-16T11:40:33.1727875Z ++ readlink -f /var/lib/dokku/plugins/enabled/apps
2023-03-16T11:40:33.1728924Z + [[ /var/lib/dokku/core-plugins/available/apps == *core-plugins* ]]
2023-03-16T11:40:33.1729658Z + [[ apps:create == \a\p\p\s\:\c\r\e\a\t\e ]]
2023-03-16T11:40:33.1730358Z + shift 1
2023-03-16T11:40:33.1730817Z + [[ -n '' ]]
2023-03-16T11:40:33.1731665Z + set -- apps:create main
2023-03-16T11:40:33.1732816Z + [[ -x /var/lib/dokku/plugins/enabled/apps:create/subcommands/default ]]
2023-03-16T11:40:33.1733836Z + [[ -x /var/lib/dokku/plugins/enabled/apps:create/subcommands/apps:create ]]
2023-03-16T11:40:33.1735055Z + [[ -x /var/lib/dokku/plugins/enabled/apps/subcommands/create ]]
2023-03-16T11:40:33.1735827Z + [[ -n create ]]
2023-03-16T11:40:33.1736531Z + /var/lib/dokku/plugins/enabled/apps/subcommands/create apps:create main
2023-03-16T11:40:33.1737463Z  !     Name is already taken
2023-03-16T11:40:33.1773250Z ##[group]Run set -x
2023-03-16T11:40:33.1773724Z ␛[36;1mset -x␛[0m
2023-03-16T11:40:33.1774112Z ␛[36;1mmkdir -p ~/.ssh␛[0m
2023-03-16T11:40:33.1774514Z ␛[36;1meval `ssh-agent -s`␛[0m
2023-03-16T11:40:33.1774920Z ␛[36;1mssh-add - <<< "$SSH_PRIVATE_KEY"␛[0m
2023-03-16T11:40:33.1775683Z ␛[36;1mssh-keyscan $DOKKU_HOST >> ~/.ssh/known_hosts␛[0m
2023-03-16T11:40:33.1776185Z ␛[36;1mgit remote add dokku dokku@$DOKKU_HOST:main␛[0m
2023-03-16T11:40:33.1776640Z ␛[36;1mgit push -f dokku main␛[0m
2023-03-16T11:40:33.1777214Z ␛[36;1m␛[0m
2023-03-16T11:40:33.1777736Z ␛[36;1mecho Visit your app here: http://main.65.109.229.10.sslip.io:80␛[0m
2023-03-16T11:40:33.1835522Z shell: /usr/bin/bash -e {0}
2023-03-16T11:40:33.1835945Z env:
2023-03-16T11:40:33.1836317Z   SUBDOMAIN: main
2023-03-16T11:40:33.1844443Z   SSH_PRIVATE_KEY: ***
2023-03-16T11:40:33.1844878Z   DOKKU_HOST: 65.109.229.10
2023-03-16T11:40:33.1845261Z ##[endgroup]
2023-03-16T11:40:33.1927545Z + mkdir -p /home/runner/.ssh
2023-03-16T11:40:33.1947415Z ++ ssh-agent -s
2023-03-16T11:40:33.1982001Z + eval 'SSH_AUTH_SOCK=/tmp/ssh-tj1nLFpbVzYS/agent.1881;' export 'SSH_AUTH_SOCK;' 'SSH_AGENT_PID=1882;' export 'SSH_AGENT_PID;' echo Agent pid '1882;'
2023-03-16T11:40:33.1982709Z Agent pid 1882
2023-03-16T11:40:33.1983648Z ++ SSH_AUTH_SOCK=/tmp/ssh-tj1nLFpbVzYS/agent.1881
2023-03-16T11:40:33.1984611Z ++ export SSH_AUTH_SOCK
2023-03-16T11:40:33.1985265Z ++ SSH_AGENT_PID=1882
2023-03-16T11:40:33.1986089Z ++ export SSH_AGENT_PID
2023-03-16T11:40:33.1986708Z ++ echo Agent pid 1882
2023-03-16T11:40:33.1987726Z + ssh-add -
2023-03-16T11:40:33.2030119Z Identity added: (stdin) (chris@chris-inf)
2023-03-16T11:40:33.2036352Z + ssh-keyscan 65.109.229.10
2023-03-16T11:40:33.6921415Z # 65.109.229.10:22 SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1
2023-03-16T11:40:33.8681330Z # 65.109.229.10:22 SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1
2023-03-16T11:40:34.4580913Z # 65.109.229.10:22 SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1
2023-03-16T11:40:35.0347725Z # 65.109.229.10:22 SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1
2023-03-16T11:40:35.6145906Z # 65.109.229.10:22 SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1
2023-03-16T11:40:35.7943520Z + git remote add dokku dokku@65.109.229.10:main
2023-03-16T11:40:35.7975374Z + git push -f dokku main
2023-03-16T11:40:38.1090599Z + export DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:38.1091420Z + DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:38.1091839Z + export DOKKU_DISTRO
2023-03-16T11:40:38.1106150Z ++ . /etc/os-release
2023-03-16T11:40:38.1110180Z ++ echo ubuntu
2023-03-16T11:40:38.1144920Z + DOKKU_DISTRO=ubuntu
2023-03-16T11:40:38.1145440Z + export DOCKER_BIN=docker
2023-03-16T11:40:38.1145893Z + DOCKER_BIN=docker
2023-03-16T11:40:38.1146536Z + export DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:38.1147715Z + DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:38.1148871Z + export DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:38.1149359Z + DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:38.1149814Z + export DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:38.1150270Z + DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:38.1151133Z + export PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:38.1151956Z + PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:38.1152549Z + export PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:38.1153223Z + PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:38.1153851Z + export PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:38.1154480Z + PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:38.1155297Z + export PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:38.1155824Z + PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:38.1156628Z + export PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:38.1157614Z + PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:38.1158549Z + export PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:38.1159201Z + PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:38.1160034Z + export DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:38.1160452Z + DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:38.1160841Z + export DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:38.1161256Z + DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:38.1161715Z + export DOKKU_API_VERSION=1
2023-03-16T11:40:38.1162275Z + DOKKU_API_VERSION=1
2023-03-16T11:40:38.1163675Z + export DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:38.1164443Z + DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:38.1164904Z + export DOKKU_VALID_EXIT=0
2023-03-16T11:40:38.1165671Z + DOKKU_VALID_EXIT=0
2023-03-16T11:40:38.1166453Z + export DOKKU_PID=272788
2023-03-16T11:40:38.1167114Z + DOKKU_PID=272788
2023-03-16T11:40:38.1167730Z + export DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:38.1168232Z + DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:38.1168914Z + export DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:38.1169743Z + DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:38.1170399Z + export DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:38.1170929Z + DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:38.1171412Z + export DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:38.1171870Z + DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:38.1172907Z + export 'DOKKU_GLOBAL_BUILD_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.1174459Z + DOKKU_GLOBAL_BUILD_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.1175690Z + export 'DOKKU_GLOBAL_RUN_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.1177199Z + DOKKU_GLOBAL_RUN_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.1178086Z + source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.1178869Z ++ set -eo pipefail
2023-03-16T11:40:38.1179488Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.1179927Z ++ set -x
2023-03-16T11:40:38.1180735Z + parse_args git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.1182288Z + declare 'desc=top-level cli arg parser'
2023-03-16T11:40:38.1183122Z + local next_index=1
2023-03-16T11:40:38.2852208Z + local skip=false
2023-03-16T11:40:38.2853580Z + args=('git-receive-pack' ''\''main'\''')
2023-03-16T11:40:38.2854883Z + local args
2023-03-16T11:40:38.2855824Z + local flags
2023-03-16T11:40:38.2856480Z + for arg in "$@"
2023-03-16T11:40:38.2857376Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2857784Z + case "$arg" in
2023-03-16T11:40:38.2858255Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2859879Z + [[ git-receive-pack == \-\-\a\p\p ]]
2023-03-16T11:40:38.2860431Z + [[ git-receive-pack =~ ^--.* ]]
2023-03-16T11:40:38.2863851Z + next_index=2
2023-03-16T11:40:38.2864876Z + for arg in "$@"
2023-03-16T11:40:38.2875945Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2876536Z + case "$arg" in
2023-03-16T11:40:38.2877063Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2877960Z + [[ 'main' == \-\-\a\p\p ]]
2023-03-16T11:40:38.2878566Z + [[ 'main' =~ ^--.* ]]
2023-03-16T11:40:38.2879068Z + next_index=3
2023-03-16T11:40:38.2879779Z + [[ -z '' ]]
2023-03-16T11:40:38.2881070Z ++ sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
2023-03-16T11:40:38.2881966Z ++ echo -e ''
2023-03-16T11:40:38.2882683Z + export DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:38.2883220Z + DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:38.2884096Z + return 0
2023-03-16T11:40:38.2884635Z + args=("$@")
2023-03-16T11:40:38.2885427Z + skip_arg=false
2023-03-16T11:40:38.2886326Z + [[ git-receive-pack =~ ^--.* ]]
2023-03-16T11:40:38.2887065Z + has_tty
2023-03-16T11:40:38.2887675Z + declare 'desc=return 0 if we have a tty'
2023-03-16T11:40:38.2888563Z + [[ '' == \t\r\u\e ]]
2023-03-16T11:40:38.2889156Z ++ LC_ALL=C
2023-03-16T11:40:38.2890139Z ++ /usr/bin/tty
2023-03-16T11:40:38.2890521Z ++ true
2023-03-16T11:40:38.2891379Z + [[ not a tty == \n\o\t\ \a\ \t\t\y ]]
2023-03-16T11:40:38.2892228Z + return 1
2023-03-16T11:40:38.2892735Z + DOKKU_QUIET_OUTPUT=1
2023-03-16T11:40:38.2893305Z ++ id -un
2023-03-16T11:40:38.2893797Z + [[ dokku != \d\o\k\k\u ]]
2023-03-16T11:40:38.2894376Z + [[ git-receive-pack =~ ^plugin:.* ]]
2023-03-16T11:40:38.2895873Z + [[ git-receive-pack == \s\s\h\-\k\e\y\s\:\a\d\d ]]
2023-03-16T11:40:38.2896690Z + [[ git-receive-pack == \s\s\h\-\k\e\y\s\:\r\e\m\o\v\e ]]
2023-03-16T11:40:38.2897375Z + [[ -n git-receive-pack 'main' ]]
2023-03-16T11:40:38.2897979Z + export -n SSH_ORIGINAL_COMMAND
2023-03-16T11:40:38.2898612Z + [[ git-receive-pack =~ config-* ]]
2023-03-16T11:40:38.2899384Z + [[ git-receive-pack =~ docker-options* ]]
2023-03-16T11:40:38.2899974Z + set -f
2023-03-16T11:40:38.2900581Z + /usr/bin/dokku git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.2901180Z + export DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:38.2901712Z + DOKKU_HOST_ROOT=/home/dokku
2023-03-16T11:40:38.2903466Z + export DOKKU_DISTRO
2023-03-16T11:40:38.2904084Z ++ . /etc/os-release
2023-03-16T11:40:38.2905693Z ++ echo ubuntu
2023-03-16T11:40:38.2906319Z + DOKKU_DISTRO=ubuntu
2023-03-16T11:40:38.2918583Z + export DOCKER_BIN=docker
2023-03-16T11:40:38.2919373Z + DOCKER_BIN=docker
2023-03-16T11:40:38.2919997Z + export DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:38.2920581Z + DOKKU_IMAGE=gliderlabs/herokuish:latest-20
2023-03-16T11:40:38.2921241Z + export DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:38.2925898Z + DOKKU_CNB_BUILDER=heroku/buildpacks
2023-03-16T11:40:38.2926679Z + export DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:38.2927219Z + DOKKU_LIB_ROOT=/var/lib/dokku
2023-03-16T11:40:38.2927783Z + export PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:38.2928385Z + PLUGIN_PATH=/var/lib/dokku/plugins
2023-03-16T11:40:38.2929252Z + export PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:38.2929902Z + PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available
2023-03-16T11:40:38.2930568Z + export PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:38.2931213Z + PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled
2023-03-16T11:40:38.2931967Z + export PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:38.2932664Z + PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins
2023-03-16T11:40:38.2933441Z + export PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:38.2934264Z + PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available
2023-03-16T11:40:38.2935064Z + export PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:38.2935836Z + PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled
2023-03-16T11:40:38.2936802Z + export DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:38.2937738Z + DOKKU_SYSTEM_GROUP=dokku
2023-03-16T11:40:38.2938277Z + export DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:38.2938925Z + DOKKU_SYSTEM_USER=dokku
2023-03-16T11:40:38.2939452Z + export DOKKU_API_VERSION=1
2023-03-16T11:40:38.2939989Z + DOKKU_API_VERSION=1
2023-03-16T11:40:38.2940507Z + export DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:38.2941070Z + DOKKU_NOT_IMPLEMENTED_EXIT=10
2023-03-16T11:40:38.2941579Z + export DOKKU_VALID_EXIT=0
2023-03-16T11:40:38.2942979Z + DOKKU_VALID_EXIT=0
2023-03-16T11:40:38.2943495Z + export DOKKU_PID=272797
2023-03-16T11:40:38.2944011Z + DOKKU_PID=272797
2023-03-16T11:40:38.2944545Z + export DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:38.2945097Z + DOKKU_LOGS_DIR=/var/log/dokku
2023-03-16T11:40:38.2945698Z + export DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:38.2946689Z + DOKKU_LOGS_HOST_DIR=/var/log/dokku
2023-03-16T11:40:38.2947780Z + export DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:38.2948542Z + DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log
2023-03-16T11:40:38.2949253Z + export DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:38.2949883Z + DOKKU_CONTAINER_LABEL=dokku
2023-03-16T11:40:38.2951245Z + export 'DOKKU_GLOBAL_BUILD_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.2953131Z + DOKKU_GLOBAL_BUILD_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.2955182Z + export 'DOKKU_GLOBAL_RUN_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.2956874Z + DOKKU_GLOBAL_RUN_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'
2023-03-16T11:40:38.2960408Z + source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.2961377Z ++ set -eo pipefail
2023-03-16T11:40:38.2962009Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.2962630Z ++ set -x
2023-03-16T11:40:38.2963640Z + parse_args git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.2964866Z + declare 'desc=top-level cli arg parser'
2023-03-16T11:40:38.2965405Z + local next_index=1
2023-03-16T11:40:38.2965915Z + local skip=false
2023-03-16T11:40:38.2967092Z + args=('git-receive-pack' ''\''main'\''')
2023-03-16T11:40:38.2968023Z + local args
2023-03-16T11:40:38.2968477Z + local flags
2023-03-16T11:40:38.2969995Z + for arg in "$@"
2023-03-16T11:40:38.2972147Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2973412Z + case "$arg" in
2023-03-16T11:40:38.2973856Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2974561Z + [[ git-receive-pack == \-\-\a\p\p ]]
2023-03-16T11:40:38.2976104Z + [[ git-receive-pack =~ ^--.* ]]
2023-03-16T11:40:38.2976640Z + next_index=2
2023-03-16T11:40:38.2977128Z + for arg in "$@"
2023-03-16T11:40:38.2977653Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2978306Z + case "$arg" in
2023-03-16T11:40:38.2979129Z + [[ false == \t\r\u\e ]]
2023-03-16T11:40:38.2979963Z + [[ 'main' == \-\-\a\p\p ]]
2023-03-16T11:40:38.2980557Z + [[ 'main' =~ ^--.* ]]
2023-03-16T11:40:38.2981230Z + next_index=3
2023-03-16T11:40:38.2981728Z + [[ -z '' ]]
2023-03-16T11:40:38.2982357Z ++ sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
2023-03-16T11:40:38.2982981Z ++ echo -e ''
2023-03-16T11:40:38.2983741Z + export DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:38.2984574Z + DOKKU_GLOBAL_FLAGS=
2023-03-16T11:40:38.2985129Z + return 0
2023-03-16T11:40:38.2986053Z + args=("$@")
2023-03-16T11:40:38.2986551Z + skip_arg=false
2023-03-16T11:40:38.2987493Z + [[ git-receive-pack =~ ^--.* ]]
2023-03-16T11:40:38.2988392Z + has_tty
2023-03-16T11:40:38.2989507Z + declare 'desc=return 0 if we have a tty'
2023-03-16T11:40:38.2990331Z + [[ '' == \t\r\u\e ]]
2023-03-16T11:40:38.2991027Z ++ LC_ALL=C
2023-03-16T11:40:38.2992059Z ++ /usr/bin/tty
2023-03-16T11:40:38.2993536Z ++ true
2023-03-16T11:40:38.2995007Z + [[ not a tty == \n\o\t\ \a\ \t\t\y ]]
2023-03-16T11:40:38.2995794Z + return 1
2023-03-16T11:40:38.2996581Z + DOKKU_QUIET_OUTPUT=1
2023-03-16T11:40:38.3000773Z ++ id -un
2023-03-16T11:40:38.3001610Z + [[ dokku != \d\o\k\k\u ]]
2023-03-16T11:40:38.3002492Z + [[ git-receive-pack =~ ^plugin:.* ]]
2023-03-16T11:40:38.3003757Z + [[ git-receive-pack == \s\s\h\-\k\e\y\s\:\a\d\d ]]
2023-03-16T11:40:38.3004569Z + [[ git-receive-pack == \s\s\h\-\k\e\y\s\:\r\e\m\o\v\e ]]
2023-03-16T11:40:38.3005281Z + [[ -n '' ]]
2023-03-16T11:40:38.3005965Z + dokku_auth git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3007129Z + declare 'desc=calls user-auth plugin trigger'
2023-03-16T11:40:38.3007759Z + export SSH_USER=dokku
2023-03-16T11:40:38.3008497Z + SSH_USER=dokku
2023-03-16T11:40:38.3009161Z + export SSH_NAME=admin
2023-03-16T11:40:38.3009996Z + SSH_NAME=admin
2023-03-16T11:40:38.3010656Z + export DOKKU_COMMAND=git-receive-pack
2023-03-16T11:40:38.3011295Z + DOKKU_COMMAND=git-receive-pack
2023-03-16T11:40:38.3012443Z ++ wc -l
2023-03-16T11:40:38.3013152Z ++ find /var/lib/dokku/plugins/enabled/20_events/user-auth
2023-03-16T11:40:38.3018818Z + local user_auth_count=1
2023-03-16T11:40:38.3019444Z + [[ 1 == 0 ]]
2023-03-16T11:40:38.3019917Z + [[ 1 == 1 ]]
2023-03-16T11:40:38.3020706Z + [[ -f /var/lib/dokku/plugins/enabled/20_events/user-auth ]]
2023-03-16T11:40:38.3021381Z + return 0
2023-03-16T11:40:38.3021855Z + case "$1" in
2023-03-16T11:40:38.3022831Z + execute_dokku_cmd git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3023667Z + declare 'desc=executes dokku sub-commands'
2023-03-16T11:40:38.3024410Z + local PLUGIN_NAME=git-receive-pack
2023-03-16T11:40:38.3025120Z + local PLUGIN_CMD=git-receive-pack
2023-03-16T11:40:38.3025724Z + local implemented=0
2023-03-16T11:40:38.3026265Z + local script
2023-03-16T11:40:38.3026960Z + argv=('git-receive-pack' ''\''main'\''')
2023-03-16T11:40:38.3027573Z + local argv
2023-03-16T11:40:38.3028101Z + case "$PLUGIN_NAME" in
2023-03-16T11:40:38.3028832Z ++ readlink -f /var/lib/dokku/plugins/enabled/git-receive-pack
2023-03-16T11:40:38.3029735Z + [[ /var/lib/dokku/plugins/enabled/git-receive-pack == *core-plugins* ]]
2023-03-16T11:40:38.3030718Z + [[ -x /var/lib/dokku/plugins/enabled/git-receive-pack/subcommands/default ]]
2023-03-16T11:40:38.3031744Z + [[ -x /var/lib/dokku/plugins/enabled/git-receive-pack/subcommands/git-receive-pack ]]
2023-03-16T11:40:38.3032760Z + [[ -x /var/lib/dokku/plugins/enabled/git-receive-pack/subcommands/git-receive-pack ]]
2023-03-16T11:40:38.3034582Z + [[ 0 -eq 0 ]]
2023-03-16T11:40:38.3035367Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3035962Z + set +e
2023-03-16T11:40:38.3036679Z + /var/lib/dokku/plugins/enabled/00_dokku-standard/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3037592Z + exit_code=10
2023-03-16T11:40:38.3043173Z + set -e
2023-03-16T11:40:38.3043843Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3044478Z + continue
2023-03-16T11:40:38.3045452Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3046061Z + set +e
2023-03-16T11:40:38.3046763Z + /var/lib/dokku/plugins/enabled/20_events/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3047516Z + exit_code=10
2023-03-16T11:40:38.3048068Z + set -e
2023-03-16T11:40:38.3048843Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3049342Z + continue
2023-03-16T11:40:38.3049923Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3050513Z + set +e
2023-03-16T11:40:38.3051294Z + /var/lib/dokku/plugins/enabled/app-json/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3051994Z + exit_code=10
2023-03-16T11:40:38.3052479Z + set -e
2023-03-16T11:40:38.3053049Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3053557Z + continue
2023-03-16T11:40:38.3054270Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3055794Z + set +e
2023-03-16T11:40:38.3056914Z + /var/lib/dokku/plugins/enabled/apps/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3057880Z + exit_code=10
2023-03-16T11:40:38.3058656Z + set -e
2023-03-16T11:40:38.3059513Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3060178Z + continue
2023-03-16T11:40:38.3061044Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3062196Z + set +e
2023-03-16T11:40:38.3063129Z + /var/lib/dokku/plugins/enabled/builder/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3064105Z + exit_code=10
2023-03-16T11:40:38.3064857Z + set -e
2023-03-16T11:40:38.3065686Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3066437Z + continue
2023-03-16T11:40:38.3067222Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3068045Z + set +e
2023-03-16T11:40:38.3069241Z + /var/lib/dokku/plugins/enabled/builder-dockerfile/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3071314Z + source /var/lib/dokku/plugins/available/builder-dockerfile/help-functions
2023-03-16T11:40:38.3087002Z ++ set -eo pipefail
2023-03-16T11:40:38.3087965Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3101932Z ++ set -x
2023-03-16T11:40:38.3134904Z + case "$1" in
2023-03-16T11:40:38.3136148Z + exit 10
2023-03-16T11:40:38.3136681Z + exit_code=10
2023-03-16T11:40:38.3137368Z + set -e
2023-03-16T11:40:38.3137945Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3138482Z + continue
2023-03-16T11:40:38.3139218Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3139802Z + set +e
2023-03-16T11:40:38.3140532Z + /var/lib/dokku/plugins/enabled/builder-lambda/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3141850Z + source /var/lib/dokku/plugins/available/builder-lambda/help-functions
2023-03-16T11:40:38.3142649Z ++ set -eo pipefail
2023-03-16T11:40:38.3143234Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3143778Z ++ set -x
2023-03-16T11:40:38.3144291Z + case "$1" in
2023-03-16T11:40:38.3144718Z + exit 10
2023-03-16T11:40:38.3145207Z + exit_code=10
2023-03-16T11:40:38.3145676Z + set -e
2023-03-16T11:40:38.3146218Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3146744Z + continue
2023-03-16T11:40:38.3147311Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3147892Z + set +e
2023-03-16T11:40:38.3148676Z + /var/lib/dokku/plugins/enabled/builder-null/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3149393Z + exit_code=10
2023-03-16T11:40:38.3149949Z + set -e
2023-03-16T11:40:38.3150511Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3151004Z + continue
2023-03-16T11:40:38.3151580Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3152157Z + set +e
2023-03-16T11:40:38.3152909Z + /var/lib/dokku/plugins/enabled/builder-pack/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3153816Z + source /var/lib/dokku/plugins/available/builder-pack/help-functions
2023-03-16T11:40:38.3154545Z ++ set -eo pipefail
2023-03-16T11:40:38.3155286Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3155854Z ++ set -x
2023-03-16T11:40:38.3156353Z + case "$1" in
2023-03-16T11:40:38.3156860Z + exit 10
2023-03-16T11:40:38.3157518Z + exit_code=10
2023-03-16T11:40:38.3158073Z + set -e
2023-03-16T11:40:38.3158726Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3159291Z + continue
2023-03-16T11:40:38.3159849Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3160398Z + set +e
2023-03-16T11:40:38.3161700Z + /var/lib/dokku/plugins/enabled/buildpacks/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3162490Z + exit_code=10
2023-03-16T11:40:38.3163009Z + set -e
2023-03-16T11:40:38.3163565Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3164068Z + continue
2023-03-16T11:40:38.3164626Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3165178Z + set +e
2023-03-16T11:40:38.3165928Z + /var/lib/dokku/plugins/enabled/caddy-vhosts/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3166632Z + exit_code=10
2023-03-16T11:40:38.3167160Z + set -e
2023-03-16T11:40:38.3167688Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3168186Z + continue
2023-03-16T11:40:38.3168729Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3169266Z + set +e
2023-03-16T11:40:38.3169983Z + /var/lib/dokku/plugins/enabled/certs/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3170649Z + exit_code=10
2023-03-16T11:40:38.3171347Z + set -e
2023-03-16T11:40:38.3172805Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3173390Z + continue
2023-03-16T11:40:38.3174370Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3175250Z + set +e
2023-03-16T11:40:38.3175978Z + /var/lib/dokku/plugins/enabled/checks/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3176651Z + exit_code=10
2023-03-16T11:40:38.3177338Z + set -e
2023-03-16T11:40:38.3177875Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3178349Z + continue
2023-03-16T11:40:38.3178974Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3179600Z + set +e
2023-03-16T11:40:38.3180276Z + /var/lib/dokku/plugins/enabled/config/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3181031Z + exit_code=10
2023-03-16T11:40:38.3181562Z + set -e
2023-03-16T11:40:38.3182089Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3182558Z + continue
2023-03-16T11:40:38.3183035Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3183932Z + set +e
2023-03-16T11:40:38.3184653Z + /var/lib/dokku/plugins/enabled/cron/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3185294Z + exit_code=10
2023-03-16T11:40:38.3185813Z + set -e
2023-03-16T11:40:38.3186345Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3186811Z + continue
2023-03-16T11:40:38.3187515Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3188281Z + set +e
2023-03-16T11:40:38.3189139Z + /var/lib/dokku/plugins/enabled/docker-options/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3189838Z + exit_code=10
2023-03-16T11:40:38.3190389Z + set -e
2023-03-16T11:40:38.3191082Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3191582Z + continue
2023-03-16T11:40:38.3192093Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3192635Z + set +e
2023-03-16T11:40:38.3193350Z + /var/lib/dokku/plugins/enabled/domains/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3193999Z + exit_code=10
2023-03-16T11:40:38.3194488Z + set -e
2023-03-16T11:40:38.3195018Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3195504Z + continue
2023-03-16T11:40:38.3196013Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3196564Z + set +e
2023-03-16T11:40:38.3197259Z + /var/lib/dokku/plugins/enabled/enter/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3198399Z + exit_code=10
2023-03-16T11:40:38.3198898Z + set -e
2023-03-16T11:40:38.3199422Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:38.3199913Z + continue
2023-03-16T11:40:38.3200433Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:38.3200947Z + set +e
2023-03-16T11:40:38.3201614Z + /var/lib/dokku/plugins/enabled/git/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3202302Z + source /var/lib/dokku/plugins/available/git/functions
2023-03-16T11:40:38.3203021Z ++ source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.3203653Z +++ set -eo pipefail
2023-03-16T11:40:38.3204184Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3204683Z +++ set -x
2023-03-16T11:40:38.3205520Z ++ source /var/lib/dokku/core-plugins/available/common/property-functions
2023-03-16T11:40:38.3206222Z +++ set -eo pipefail
2023-03-16T11:40:38.3206780Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3207447Z +++ set -x
2023-03-16T11:40:38.3208307Z ++ source /var/lib/dokku/plugins/available/config/functions
2023-03-16T11:40:38.3209049Z +++ set -eo pipefail
2023-03-16T11:40:38.3209618Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3210115Z +++ set -x
2023-03-16T11:40:38.3210736Z +++ source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.3211393Z ++++ set -eo pipefail
2023-03-16T11:40:38.3211922Z ++++ [[ -n 1 ]]
2023-03-16T11:40:38.3212420Z ++++ set -x
2023-03-16T11:40:38.3213038Z ++ source /var/lib/dokku/plugins/available/git/internal-functions
2023-03-16T11:40:38.3213785Z +++ source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.3214425Z ++++ set -eo pipefail
2023-03-16T11:40:38.3214956Z ++++ [[ -n 1 ]]
2023-03-16T11:40:38.3215749Z ++++ set -x
2023-03-16T11:40:38.3216437Z +++ source /var/lib/dokku/core-plugins/available/common/property-functions
2023-03-16T11:40:38.3217511Z ++++ set -eo pipefail
2023-03-16T11:40:38.3218642Z ++++ [[ -n 1 ]]
2023-03-16T11:40:38.3219380Z ++++ set -x
2023-03-16T11:40:38.3220294Z +++ set -eo pipefail
2023-03-16T11:40:38.3221182Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3221674Z +++ set -x
2023-03-16T11:40:38.3222218Z ++ set -eo pipefail
2023-03-16T11:40:38.3223060Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3223551Z ++ set -x
2023-03-16T11:40:38.3224619Z + source /var/lib/dokku/plugins/available/git/internal-functions
2023-03-16T11:40:38.3225618Z ++ source /var/lib/dokku/core-plugins/available/common/functions
2023-03-16T11:40:38.3226523Z +++ set -eo pipefail
2023-03-16T11:40:38.3227107Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3228006Z +++ set -x
2023-03-16T11:40:38.3228915Z ++ source /var/lib/dokku/core-plugins/available/common/property-functions
2023-03-16T11:40:38.3229587Z +++ set -eo pipefail
2023-03-16T11:40:38.3230098Z +++ [[ -n 1 ]]
2023-03-16T11:40:38.3230591Z +++ set -x
2023-03-16T11:40:38.3231117Z ++ set -eo pipefail
2023-03-16T11:40:38.3231643Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3232305Z ++ set -x
2023-03-16T11:40:38.3232955Z + source /var/lib/dokku/plugins/available/git/help-functions
2023-03-16T11:40:38.3233609Z ++ set -eo pipefail
2023-03-16T11:40:38.3234272Z ++ [[ -n 1 ]]
2023-03-16T11:40:38.3235308Z ++ set -x
2023-03-16T11:40:38.3235959Z + case "$1" in
2023-03-16T11:40:38.3236673Z + cmd-git-glob git-receive-pack ''\''main'\'''
2023-03-16T11:40:38.3237730Z + declare 'desc=catch-all for any other git-* commands'
2023-03-16T11:40:38.3238567Z + declare 'cmd=git-*'
2023-03-16T11:40:38.3239128Z ++ sed 's/^\///g'
2023-03-16T11:40:38.3239680Z ++ sed 's/\\'\''/'\''/g'
2023-03-16T11:40:38.3240233Z ++ perl -pe 's/(?<!\\)'\''//g'
2023-03-16T11:40:38.3240799Z ++ echo ''\''main'\'''
2023-03-16T11:40:38.3241310Z + local APP=main
2023-03-16T11:40:38.3241826Z + local APP_PATH=/home/dokku/main
2023-03-16T11:40:38.3242403Z + plugn trigger app-exists main
2023-03-16T11:40:38.3879717Z + [[ git-receive-pack == \g\i\t\-\r\e\c\e\i\v\e\-\p\a\c\k ]]
2023-03-16T11:40:38.3880517Z + [[ ! -d /home/dokku/main/refs ]]
2023-03-16T11:40:38.3881231Z + [[ git-receive-pack == \g\i\t\-\r\e\c\e\i\v\e\-\p\a\c\k ]]
2023-03-16T11:40:38.3883434Z + local 'args=git-receive-pack '\''/home/dokku/main'\'''
2023-03-16T11:40:38.3896026Z + git-shell -c 'git-receive-pack '\''/home/dokku/main'\'''
2023-03-16T11:40:38.6742099Z remote: + export DOKKU_HOST_ROOT=/home/dokku        
2023-03-16T11:40:38.6742815Z remote: + DOKKU_HOST_ROOT=/home/dokku        
2023-03-16T11:40:38.6743365Z remote: + export DOKKU_DISTRO        
2023-03-16T11:40:38.6757112Z remote: ++ . /etc/os-release        
2023-03-16T11:40:38.6778042Z remote: ++ echo ubuntu        
2023-03-16T11:40:38.6778898Z remote: + DOKKU_DISTRO=ubuntu        
2023-03-16T11:40:38.6779341Z remote: + export DOCKER_BIN=docker        
2023-03-16T11:40:38.6779806Z remote: + DOCKER_BIN=docker        
2023-03-16T11:40:38.6780606Z remote: + export DOKKU_IMAGE=gliderlabs/herokuish:latest-20        
2023-03-16T11:40:38.6781384Z remote: + DOKKU_IMAGE=gliderlabs/herokuish:latest-20        
2023-03-16T11:40:38.6782021Z remote: + export DOKKU_CNB_BUILDER=heroku/buildpacks        
2023-03-16T11:40:38.6782677Z remote: + DOKKU_CNB_BUILDER=heroku/buildpacks        
2023-03-16T11:40:38.6783286Z remote: + export DOKKU_LIB_ROOT=/var/lib/dokku        
2023-03-16T11:40:38.6784016Z remote: + DOKKU_LIB_ROOT=/var/lib/dokku        
2023-03-16T11:40:38.6784618Z remote: + export PLUGIN_PATH=/var/lib/dokku/plugins        
2023-03-16T11:40:38.6785237Z remote: + PLUGIN_PATH=/var/lib/dokku/plugins        
2023-03-16T11:40:38.6786485Z remote: + export PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available        
2023-03-16T11:40:38.6787546Z remote: + PLUGIN_AVAILABLE_PATH=/var/lib/dokku/plugins/available        
2023-03-16T11:40:38.6864632Z remote: + export PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled        
2023-03-16T11:40:38.6865908Z remote: + PLUGIN_ENABLED_PATH=/var/lib/dokku/plugins/enabled        
2023-03-16T11:40:38.6867120Z remote: + export PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins        
2023-03-16T11:40:38.6869521Z remote: + PLUGIN_CORE_PATH=/var/lib/dokku/core-plugins        
2023-03-16T11:40:38.6870633Z remote: + export PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available        
2023-03-16T11:40:38.6872594Z remote: + PLUGIN_CORE_AVAILABLE_PATH=/var/lib/dokku/core-plugins/available        
2023-03-16T11:40:38.6873488Z remote: + export PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled        
2023-03-16T11:40:38.6874273Z remote: + PLUGIN_CORE_ENABLED_PATH=/var/lib/dokku/core-plugins/enabled        
2023-03-16T11:40:38.6875204Z remote: + export DOKKU_SYSTEM_GROUP=dokku        
2023-03-16T11:40:38.6875696Z remote: + DOKKU_SYSTEM_GROUP=dokku        
2023-03-16T11:40:38.6876366Z remote: + export DOKKU_SYSTEM_USER=dokku        
2023-03-16T11:40:38.6876869Z remote: + DOKKU_SYSTEM_USER=dokku        
2023-03-16T11:40:38.6877482Z remote: + export DOKKU_API_VERSION=1        
2023-03-16T11:40:38.6878143Z remote: + DOKKU_API_VERSION=1        
2023-03-16T11:40:38.6878763Z remote: + export DOKKU_NOT_IMPLEMENTED_EXIT=10        
2023-03-16T11:40:38.6879257Z remote: + DOKKU_NOT_IMPLEMENTED_EXIT=10        
2023-03-16T11:40:38.6879732Z remote: + export DOKKU_VALID_EXIT=0        
2023-03-16T11:40:38.6880193Z remote: + DOKKU_VALID_EXIT=0        
2023-03-16T11:40:38.6880613Z remote: + export DOKKU_PID=272993        
2023-03-16T11:40:38.6881256Z remote: + DOKKU_PID=272993        
2023-03-16T11:40:38.6881754Z remote: + export DOKKU_LOGS_DIR=/var/log/dokku        
2023-03-16T11:40:38.6882236Z remote: + DOKKU_LOGS_DIR=/var/log/dokku        
2023-03-16T11:40:38.6882740Z remote: + export DOKKU_LOGS_HOST_DIR=/var/log/dokku        
2023-03-16T11:40:38.6883250Z remote: + DOKKU_LOGS_HOST_DIR=/var/log/dokku        
2023-03-16T11:40:38.6883784Z remote: + export DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log        
2023-03-16T11:40:38.6884338Z remote: + DOKKU_EVENTS_LOGFILE=/var/log/dokku/events.log        
2023-03-16T11:40:38.6884871Z remote: + export DOKKU_CONTAINER_LABEL=dokku        
2023-03-16T11:40:38.6885367Z remote: + DOKKU_CONTAINER_LABEL=dokku        
2023-03-16T11:40:38.6886261Z remote: + export 'DOKKU_GLOBAL_BUILD_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'        
2023-03-16T11:40:38.6887334Z remote: + DOKKU_GLOBAL_BUILD_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'        
2023-03-16T11:40:38.6888390Z remote: + export 'DOKKU_GLOBAL_RUN_ARGS=--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'        
2023-03-16T11:40:38.6889464Z remote: + DOKKU_GLOBAL_RUN_ARGS='--label=org.label-schema.schema-version=1.0 --label=org.label-schema.vendor=dokku --label=dokku'        
2023-03-16T11:40:38.6890352Z remote: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:38.6890956Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.6891429Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.6891875Z remote: ++ set -x        
2023-03-16T11:40:38.6902248Z remote: + parse_args git-hook main        
2023-03-16T11:40:38.6903387Z remote: + declare 'desc=top-level cli arg parser'        
2023-03-16T11:40:38.6905941Z remote: + local next_index=1        
2023-03-16T11:40:38.6909116Z remote: + local skip=false        
2023-03-16T11:40:38.6910356Z remote: + args=('git-hook' 'main')        
2023-03-16T11:40:38.6911968Z remote: + local args        
2023-03-16T11:40:38.6912773Z remote: + local flags        
2023-03-16T11:40:38.6913296Z remote: + for arg in "$@"        
2023-03-16T11:40:38.6913803Z remote: + [[ false == \t\r\u\e ]]        
2023-03-16T11:40:38.6914353Z remote: + case "$arg" in        
2023-03-16T11:40:38.6915315Z remote: + [[ false == \t\r\u\e ]]        
2023-03-16T11:40:38.6916283Z remote: + [[ git-hook == \-\-\a\p\p ]]        
2023-03-16T11:40:38.6917074Z remote: + [[ git-hook =~ ^--.* ]]        
2023-03-16T11:40:38.6917891Z remote: + next_index=2        
2023-03-16T11:40:38.6918486Z remote: + for arg in "$@"        
2023-03-16T11:40:38.6919287Z remote: + [[ false == \t\r\u\e ]]        
2023-03-16T11:40:38.6920588Z remote: + case "$arg" in        
2023-03-16T11:40:38.6921391Z remote: + [[ false == \t\r\u\e ]]        
2023-03-16T11:40:38.6921965Z remote: + [[ main == \-\-\a\p\p ]]        
2023-03-16T11:40:38.6922670Z remote: + [[ main =~ ^--.* ]]        
2023-03-16T11:40:38.6940536Z remote: + next_index=3        
2023-03-16T11:40:38.6941296Z remote: + [[ -z '' ]]        
2023-03-16T11:40:38.6969357Z remote: ++ sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'        
2023-03-16T11:40:38.7060464Z remote: ++ echo -e ''        
2023-03-16T11:40:38.7078296Z remote: + export DOKKU_GLOBAL_FLAGS=        
2023-03-16T11:40:38.7078851Z remote: + DOKKU_GLOBAL_FLAGS=        
2023-03-16T11:40:38.7079469Z remote: + return 0        
2023-03-16T11:40:38.7080403Z remote: + args=("$@")        
2023-03-16T11:40:38.7081207Z remote: + skip_arg=false        
2023-03-16T11:40:38.7081810Z remote: + [[ git-hook =~ ^--.* ]]        
2023-03-16T11:40:38.7082270Z remote: + has_tty        
2023-03-16T11:40:38.7082962Z remote: + declare 'desc=return 0 if we have a tty'        
2023-03-16T11:40:38.7084117Z remote: + [[ '' == \t\r\u\e ]]        
2023-03-16T11:40:38.7084534Z remote: ++ LC_ALL=C        
2023-03-16T11:40:38.7084924Z remote: ++ /usr/bin/tty        
2023-03-16T11:40:38.7085915Z remote: ++ true        
2023-03-16T11:40:38.8501609Z remote: + [[ not a tty == \n\o\t\ \a\ \t\t\y ]]        
2023-03-16T11:40:38.8502807Z remote: + return 1        
2023-03-16T11:40:38.8503509Z remote: + DOKKU_QUIET_OUTPUT=1        
2023-03-16T11:40:38.8504372Z remote: ++ id -un        
2023-03-16T11:40:38.8504800Z remote: + [[ dokku != \d\o\k\k\u ]]        
2023-03-16T11:40:38.8505499Z remote: + [[ git-hook =~ ^plugin:.* ]]        
2023-03-16T11:40:38.8506078Z remote: + [[ git-hook == \s\s\h\-\k\e\y\s\:\a\d\d ]]        
2023-03-16T11:40:38.8506814Z remote: + [[ git-hook == \s\s\h\-\k\e\y\s\:\r\e\m\o\v\e ]]        
2023-03-16T11:40:38.8507356Z remote: + [[ -n '' ]]        
2023-03-16T11:40:38.8508228Z remote: + dokku_auth git-hook main        
2023-03-16T11:40:38.8508990Z remote: + declare 'desc=calls user-auth plugin trigger'        
2023-03-16T11:40:38.8509484Z remote: + export SSH_USER=dokku        
2023-03-16T11:40:38.8509934Z remote: + SSH_USER=dokku        
2023-03-16T11:40:38.8510378Z remote: + export SSH_NAME=admin        
2023-03-16T11:40:38.8510798Z remote: + SSH_NAME=admin        
2023-03-16T11:40:38.8511627Z remote: + export DOKKU_COMMAND=git-hook        
2023-03-16T11:40:38.8512336Z remote: + DOKKU_COMMAND=git-hook        
2023-03-16T11:40:38.8512807Z remote: ++ wc -l        
2023-03-16T11:40:38.8513400Z remote: ++ find /var/lib/dokku/plugins/enabled/20_events/user-auth        
2023-03-16T11:40:38.8513959Z remote: + local user_auth_count=1        
2023-03-16T11:40:38.8514551Z remote: + [[ 1 == 0 ]]        
2023-03-16T11:40:38.8514932Z remote: + [[ 1 == 1 ]]        
2023-03-16T11:40:38.8515846Z remote: + [[ -f /var/lib/dokku/plugins/enabled/20_events/user-auth ]]        
2023-03-16T11:40:38.8516555Z remote: + return 0        
2023-03-16T11:40:38.8517198Z remote: + case "$1" in        
2023-03-16T11:40:38.8518095Z remote: + execute_dokku_cmd git-hook main        
2023-03-16T11:40:38.8519005Z remote: + declare 'desc=executes dokku sub-commands'        
2023-03-16T11:40:38.8520118Z remote: + local PLUGIN_NAME=git-hook        
2023-03-16T11:40:38.8521185Z remote: + local PLUGIN_CMD=git-hook        
2023-03-16T11:40:38.8521854Z remote: + local implemented=0        
2023-03-16T11:40:38.8540898Z remote: + local script        
2023-03-16T11:40:38.8542155Z remote: + argv=('git-hook' 'main')        
2023-03-16T11:40:38.8542624Z remote: + local argv        
2023-03-16T11:40:38.8543074Z remote: + case "$PLUGIN_NAME" in        
2023-03-16T11:40:38.8543687Z remote: ++ readlink -f /var/lib/dokku/plugins/enabled/git-hook        
2023-03-16T11:40:38.8544596Z remote: + [[ /var/lib/dokku/plugins/enabled/git-hook == *core-plugins* ]]        
2023-03-16T11:40:38.8545538Z remote: + [[ -x /var/lib/dokku/plugins/enabled/git-hook/subcommands/default ]]        
2023-03-16T11:40:38.8547610Z remote: + [[ -x /var/lib/dokku/plugins/enabled/git-hook/subcommands/git-hook ]]        
2023-03-16T11:40:38.8548775Z remote: + [[ -x /var/lib/dokku/plugins/enabled/git-hook/subcommands/git-hook ]]        
2023-03-16T11:40:38.8549647Z remote: + [[ 0 -eq 0 ]]        
2023-03-16T11:40:38.8550631Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8551149Z remote: + set +e        
2023-03-16T11:40:38.8552815Z remote: + /var/lib/dokku/plugins/enabled/00_dokku-standard/commands git-hook main        
2023-03-16T11:40:38.8553649Z remote: + exit_code=10        
2023-03-16T11:40:38.8554149Z remote: + set -e        
2023-03-16T11:40:38.8554823Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8555308Z remote: + continue        
2023-03-16T11:40:38.8555804Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8556992Z remote: + set +e        
2023-03-16T11:40:38.8558017Z remote: + /var/lib/dokku/plugins/enabled/20_events/commands git-hook main        
2023-03-16T11:40:38.8558573Z remote: + exit_code=10        
2023-03-16T11:40:38.8559017Z remote: + set -e        
2023-03-16T11:40:38.8559483Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8560049Z remote: + continue        
2023-03-16T11:40:38.8560736Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8561250Z remote: + set +e        
2023-03-16T11:40:38.8561850Z remote: + /var/lib/dokku/plugins/enabled/app-json/commands git-hook main        
2023-03-16T11:40:38.8562541Z remote: + exit_code=10        
2023-03-16T11:40:38.8563000Z remote: + set -e        
2023-03-16T11:40:38.8563459Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8563857Z remote: + continue        
2023-03-16T11:40:38.8564325Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8564813Z remote: + set +e        
2023-03-16T11:40:38.8565406Z remote: + /var/lib/dokku/plugins/enabled/apps/commands git-hook main        
2023-03-16T11:40:38.8565939Z remote: + exit_code=10        
2023-03-16T11:40:38.8566877Z remote: + set -e        
2023-03-16T11:40:38.8567330Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8567741Z remote: + continue        
2023-03-16T11:40:38.8568197Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8568687Z remote: + set +e        
2023-03-16T11:40:38.8569266Z remote: + /var/lib/dokku/plugins/enabled/builder/commands git-hook main        
2023-03-16T11:40:38.8569931Z remote: + exit_code=10        
2023-03-16T11:40:38.8570369Z remote: + set -e        
2023-03-16T11:40:38.8570809Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8571188Z remote: + continue        
2023-03-16T11:40:38.8571815Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8572292Z remote: + set +e        
2023-03-16T11:40:38.8572916Z remote: + /var/lib/dokku/plugins/enabled/builder-dockerfile/commands git-hook main        
2023-03-16T11:40:38.8573712Z remote: + source /var/lib/dokku/plugins/available/builder-dockerfile/help-functions        
2023-03-16T11:40:38.8574680Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8575186Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8575943Z remote: ++ set -x        
2023-03-16T11:40:38.8576419Z remote: + case "$1" in        
2023-03-16T11:40:38.8576843Z remote: + exit 10        
2023-03-16T11:40:38.8577244Z remote: + exit_code=10        
2023-03-16T11:40:38.8577715Z remote: + set -e        
2023-03-16T11:40:38.8578186Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8578591Z remote: + continue        
2023-03-16T11:40:38.8579578Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8580039Z remote: + set +e        
2023-03-16T11:40:38.8580613Z remote: + /var/lib/dokku/plugins/enabled/builder-lambda/commands git-hook main        
2023-03-16T11:40:38.8581337Z remote: + source /var/lib/dokku/plugins/available/builder-lambda/help-functions        
2023-03-16T11:40:38.8582285Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8582713Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8583111Z remote: ++ set -x        
2023-03-16T11:40:38.8583487Z remote: + case "$1" in        
2023-03-16T11:40:38.8583909Z remote: + exit 10        
2023-03-16T11:40:38.8584269Z remote: + exit_code=10        
2023-03-16T11:40:38.8584688Z remote: + set -e        
2023-03-16T11:40:38.8585110Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8585469Z remote: + continue        
2023-03-16T11:40:38.8585894Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8586339Z remote: + set +e        
2023-03-16T11:40:38.8586894Z remote: + /var/lib/dokku/plugins/enabled/builder-null/commands git-hook main        
2023-03-16T11:40:38.8587376Z remote: + exit_code=10        
2023-03-16T11:40:38.8587800Z remote: + set -e        
2023-03-16T11:40:38.8588225Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8588767Z remote: + continue        
2023-03-16T11:40:38.8589218Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8589686Z remote: + set +e        
2023-03-16T11:40:38.8590463Z remote: + /var/lib/dokku/plugins/enabled/builder-pack/commands git-hook main        
2023-03-16T11:40:38.8591334Z remote: + source /var/lib/dokku/plugins/available/builder-pack/help-functions        
2023-03-16T11:40:38.8591970Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8592417Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8593009Z remote: ++ set -x        
2023-03-16T11:40:38.8593396Z remote: + case "$1" in        
2023-03-16T11:40:38.8593785Z remote: + exit 10        
2023-03-16T11:40:38.8594161Z remote: + exit_code=10        
2023-03-16T11:40:38.8594744Z remote: + set -e        
2023-03-16T11:40:38.8595165Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8595523Z remote: + continue        
2023-03-16T11:40:38.8596115Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8596581Z remote: + set +e        
2023-03-16T11:40:38.8597151Z remote: + /var/lib/dokku/plugins/enabled/buildpacks/commands git-hook main        
2023-03-16T11:40:38.8597803Z remote: + exit_code=10        
2023-03-16T11:40:38.8598415Z remote: + set -e        
2023-03-16T11:40:38.8598852Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8599272Z remote: + continue        
2023-03-16T11:40:38.8599880Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8600345Z remote: + set +e        
2023-03-16T11:40:38.8600919Z remote: + /var/lib/dokku/plugins/enabled/caddy-vhosts/commands git-hook main        
2023-03-16T11:40:38.8601451Z remote: + exit_code=10        
2023-03-16T11:40:38.8602048Z remote: + set -e        
2023-03-16T11:40:38.8602457Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8603194Z remote: + continue        
2023-03-16T11:40:38.8603831Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8604300Z remote: + set +e        
2023-03-16T11:40:38.8604890Z remote: + /var/lib/dokku/plugins/enabled/certs/commands git-hook main        
2023-03-16T11:40:38.8605437Z remote: + exit_code=10        
2023-03-16T11:40:38.8606054Z remote: + set -e        
2023-03-16T11:40:38.8606866Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8607294Z remote: + continue        
2023-03-16T11:40:38.8607780Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8608429Z remote: + set +e        
2023-03-16T11:40:38.8609059Z remote: + /var/lib/dokku/plugins/enabled/checks/commands git-hook main        
2023-03-16T11:40:38.8609683Z remote: + exit_code=10        
2023-03-16T11:40:38.8610633Z remote: + set -e        
2023-03-16T11:40:38.8611094Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8611656Z remote: + continue        
2023-03-16T11:40:38.8612235Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8612682Z remote: + set +e        
2023-03-16T11:40:38.8613224Z remote: + /var/lib/dokku/plugins/enabled/config/commands git-hook main        
2023-03-16T11:40:38.8614676Z remote: + exit_code=10        
2023-03-16T11:40:38.8615140Z remote: + set -e        
2023-03-16T11:40:38.8615799Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8616236Z remote: + continue        
2023-03-16T11:40:38.8616873Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8617673Z remote: + set +e        
2023-03-16T11:40:38.8618750Z remote: + /var/lib/dokku/plugins/enabled/cron/commands git-hook main        
2023-03-16T11:40:38.8619270Z remote: + exit_code=10        
2023-03-16T11:40:38.8619868Z remote: + set -e        
2023-03-16T11:40:38.8620318Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8620705Z remote: + continue        
2023-03-16T11:40:38.8621163Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8621951Z remote: + set +e        
2023-03-16T11:40:38.8622527Z remote: + /var/lib/dokku/plugins/enabled/docker-options/commands git-hook main        
2023-03-16T11:40:38.8623380Z remote: + exit_code=10        
2023-03-16T11:40:38.8624687Z remote: + set -e        
2023-03-16T11:40:38.8625250Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8625726Z remote: + continue        
2023-03-16T11:40:38.8626294Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8627319Z remote: + set +e        
2023-03-16T11:40:38.8628077Z remote: + /var/lib/dokku/plugins/enabled/domains/commands git-hook main        
2023-03-16T11:40:38.8641245Z remote: + exit_code=10        
2023-03-16T11:40:38.8641899Z remote: + set -e        
2023-03-16T11:40:38.8642505Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8643881Z remote: + continue        
2023-03-16T11:40:38.8644635Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8645156Z remote: + set +e        
2023-03-16T11:40:38.8645768Z remote: + /var/lib/dokku/plugins/enabled/enter/commands git-hook main        
2023-03-16T11:40:38.8667102Z remote: + exit_code=10        
2023-03-16T11:40:38.8670593Z remote: + set -e        
2023-03-16T11:40:38.8671101Z remote: + [[ 10 -eq 10 ]]        
2023-03-16T11:40:38.8671507Z remote: + continue        
2023-03-16T11:40:38.8671991Z remote: + for script in $PLUGIN_ENABLED_PATH/*/commands        
2023-03-16T11:40:38.8672493Z remote: + set +e        
2023-03-16T11:40:38.8673056Z remote: + /var/lib/dokku/plugins/enabled/git/commands git-hook main        
2023-03-16T11:40:38.8705551Z remote: + source /var/lib/dokku/plugins/available/git/functions        
2023-03-16T11:40:38.8706628Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:38.8707377Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8707966Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8709007Z remote: +++ set -x        
2023-03-16T11:40:38.8782597Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:38.8783485Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8784006Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8784505Z remote: +++ set -x        
2023-03-16T11:40:38.8785022Z remote: ++ source /var/lib/dokku/plugins/available/config/functions        
2023-03-16T11:40:38.8785673Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8786191Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8786678Z remote: +++ set -x        
2023-03-16T11:40:38.8787305Z remote: +++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:38.8787963Z remote: ++++ set -eo pipefail        
2023-03-16T11:40:38.8788474Z remote: ++++ [[ -n 1 ]]        
2023-03-16T11:40:38.8788942Z remote: ++++ set -x        
2023-03-16T11:40:38.8806677Z remote: ++ source /var/lib/dokku/plugins/available/git/internal-functions        
2023-03-16T11:40:38.8807596Z remote: +++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:38.8808260Z remote: ++++ set -eo pipefail        
2023-03-16T11:40:38.8810282Z remote: ++++ [[ -n 1 ]]        
2023-03-16T11:40:38.8811445Z remote: ++++ set -x        
2023-03-16T11:40:38.8853349Z remote: +++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:38.8854300Z remote: ++++ set -eo pipefail        
2023-03-16T11:40:38.8856291Z remote: ++++ [[ -n 1 ]]        
2023-03-16T11:40:38.8856853Z remote: ++++ set -x        
2023-03-16T11:40:38.8857800Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8858777Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8859477Z remote: +++ set -x        
2023-03-16T11:40:38.8888178Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8888796Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8889445Z remote: ++ set -x        
2023-03-16T11:40:38.8898746Z remote: + source /var/lib/dokku/plugins/available/git/internal-functions        
2023-03-16T11:40:38.8899829Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:38.8901991Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8902626Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8903127Z remote: +++ set -x        
2023-03-16T11:40:38.8925930Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:38.8927035Z remote: +++ set -eo pipefail        
2023-03-16T11:40:38.8929218Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:38.8930567Z remote: +++ set -x        
2023-03-16T11:40:38.8933249Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8933822Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8934277Z remote: ++ set -x        
2023-03-16T11:40:38.8961535Z remote: + source /var/lib/dokku/plugins/available/git/help-functions        
2023-03-16T11:40:38.8962441Z remote: ++ set -eo pipefail        
2023-03-16T11:40:38.8962930Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:38.8963398Z remote: ++ set -x        
2023-03-16T11:40:38.8964017Z remote: + case "$1" in        
2023-03-16T11:40:38.8964693Z remote: + cmd-git-hook git-hook main        
2023-03-16T11:40:38.8965772Z remote: + declare 'desc=kick off receive-app trigger from git prereceive hook'        
2023-03-16T11:40:38.8967089Z remote: + declare cmd=git-hook        
2023-03-16T11:40:38.8967805Z remote: + [[ git-hook == \g\i\t\-\h\o\o\k ]]        
2023-03-16T11:40:38.8968267Z remote: + shift 1        
2023-03-16T11:40:38.8968765Z remote: + declare APP=main        
2023-03-16T11:40:38.8970477Z remote: + local DOKKU_DEPLOY_BRANCH        
2023-03-16T11:40:38.8971168Z remote: + plugn trigger app-exists main        
2023-03-16T11:40:39.0311150Z remote: ++ fn-git-deploy-branch main        
2023-03-16T11:40:39.0312053Z remote: ++ declare 'desc=retrieve the deploy branch for a given application'        
2023-03-16T11:40:39.0312736Z remote: ++ local APP=main        
2023-03-16T11:40:39.0313271Z remote: ++ local DEFAULT_BRANCH=master        
2023-03-16T11:40:39.0314152Z remote: +++ fn-plugin-property-get git main deploy-branch ''        
2023-03-16T11:40:39.0315129Z remote: +++ declare 'desc=returns the value for a given property'        
2023-03-16T11:40:39.0315984Z remote: +++ declare PLUGIN=git APP=main KEY=deploy-branch DEFAULT=        
2023-03-16T11:40:39.0317129Z remote: +++ fn-plugin-property-get-default git main deploy-branch ''        
2023-03-16T11:40:39.0318253Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:39.0319107Z remote: +++ declare PLUGIN=git APP=main KEY=deploy-branch DEFAULT=        
2023-03-16T11:40:39.0320174Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default git main deploy-branch ''        
2023-03-16T11:40:39.0341057Z remote: ++ local DOKKU_DEPLOY_BRANCH=main        
2023-03-16T11:40:39.0343143Z remote: +++ fn-plugin-property-get git --global deploy-branch ''        
2023-03-16T11:40:39.0344597Z remote: +++ declare 'desc=returns the value for a given property'        
2023-03-16T11:40:39.0346354Z remote: +++ declare PLUGIN=git APP=--global KEY=deploy-branch DEFAULT=        
2023-03-16T11:40:39.0347763Z remote: +++ fn-plugin-property-get-default git --global deploy-branch ''        
2023-03-16T11:40:39.0349758Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:39.0350722Z remote: +++ declare PLUGIN=git APP=--global KEY=deploy-branch DEFAULT=        
2023-03-16T11:40:39.0383925Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default git --global deploy-branch ''        
2023-03-16T11:40:39.0405046Z remote: ++ local DOKKU_GLOBAL_DEPLOY_BRANCH=        
2023-03-16T11:40:39.0405960Z remote: ++ [[ -n main ]]        
2023-03-16T11:40:39.0406470Z remote: ++ echo main        
2023-03-16T11:40:39.0407162Z remote: + DOKKU_DEPLOY_BRANCH=main        
2023-03-16T11:40:39.0407801Z remote: + git check-ref-format --branch main        
2023-03-16T11:40:39.0419755Z remote: + local oldrev newrev refname        
2023-03-16T11:40:39.0420474Z remote: + read -r oldrev newrev refname        
2023-03-16T11:40:39.0421110Z remote: + [[ refs/heads/main == \r\e\f\s\/\h\e\a\d\s\/\m\a\i\n ]]        
2023-03-16T11:40:39.0421968Z remote: + git_receive_app main 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0422894Z remote: + declare 'desc=git receive-app plugin trigger'        
2023-03-16T11:40:39.0424050Z remote: + declare APP=main REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0425259Z remote: + [[ ! -d /home/dokku/main/refs ]]        
2023-03-16T11:40:39.0426246Z remote: + local exit_code=0        
2023-03-16T11:40:39.0426814Z remote: + acquire_app_deploy_lock main exclusive        
2023-03-16T11:40:39.0427604Z remote: + declare 'desc=acquire advisory lock for use in deploys'        
2023-03-16T11:40:39.0428540Z remote: + local APP=main        
2023-03-16T11:40:39.0429947Z remote: + local LOCK_TYPE=exclusive        
2023-03-16T11:40:39.0432535Z remote: + local APP_DEPLOY_LOCK_FILE=/home/dokku/main/.deploy.lock        
2023-03-16T11:40:39.0437066Z remote: + local 'LOCK_WAITING_MSG=main currently has a deploy lock in place. Waiting...'        
2023-03-16T11:40:39.0438336Z remote: + local 'LOCK_FAILED_MSG=main currently has a deploy lock in place. Exiting...'        
2023-03-16T11:40:39.0439745Z remote: + acquire_advisory_lock /home/dokku/main/.deploy.lock exclusive 'main currently has a deploy lock in place. Waiting...' 'main currently has a deploy lock in place. Exiting...'        
2023-03-16T11:40:39.0440827Z remote: + declare 'desc=acquire advisory lock'        
2023-03-16T11:40:39.0443353Z remote: + local LOCK_FILE=/home/dokku/main/.deploy.lock LOCK_TYPE=exclusive 'LOCK_WAITING_MSG=main currently has a deploy lock in place. Waiting...' 'LOCK_FAILED_MSG=main currently has a deploy lock in place. Exiting...'        
2023-03-16T11:40:39.0444469Z remote: + local LOCK_FD=200        
2023-03-16T11:40:39.0445524Z remote: + local SHOW_MSG=true        
2023-03-16T11:40:39.0446594Z remote: + eval 'exec 200>/home/dokku/main/.deploy.lock'        
2023-03-16T11:40:39.0447736Z remote: ++ exec        
2023-03-16T11:40:39.0448440Z remote: + [[ exclusive == \w\a\i\t\i\n\g ]]        
2023-03-16T11:40:39.0449098Z remote: + flock -n 200        
2023-03-16T11:40:39.0449695Z remote: + git_build main 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0450559Z remote: + declare 'desc=setup and call git_build_app_repo'        
2023-03-16T11:40:39.0451628Z remote: + local APP=main REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0453148Z remote: + local DOKKU_DEPLOY_BRANCH ENV_VAR_NAME REF        
2023-03-16T11:40:39.0453962Z remote: + [[ -n 094267eda0be20dfbd915332bc53e5c4bcff60b8 ]]        
2023-03-16T11:40:39.0454730Z remote: ++ fn-plugin-property-get git main rev-env-var        
2023-03-16T11:40:39.0455476Z remote: ++ declare 'desc=returns the value for a given property'        
2023-03-16T11:40:39.0456253Z remote: ++ declare PLUGIN=git APP=main KEY=rev-env-var DEFAULT=        
2023-03-16T11:40:39.0457056Z remote: ++ fn-plugin-property-get-default git main rev-env-var ''        
2023-03-16T11:40:39.0458284Z remote: ++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:39.0459236Z remote: ++ declare PLUGIN=git APP=main KEY=rev-env-var DEFAULT=        
2023-03-16T11:40:39.0460128Z remote: ++ /var/lib/dokku/core-plugins/available/common/prop get-with-default git main rev-env-var ''        
2023-03-16T11:40:39.0469184Z remote: + ENV_VAR_NAME=        
2023-03-16T11:40:39.0469900Z remote: + [[ -z '' ]]        
2023-03-16T11:40:39.0470611Z remote: + fn-plugin-property-exists git main rev-env-var        
2023-03-16T11:40:39.0471442Z remote: + declare 'desc=returns whether the property store has a value for an app'        
2023-03-16T11:40:39.0472395Z remote: + declare PLUGIN=git APP=main KEY=rev-env-var        
2023-03-16T11:40:39.0473193Z remote: + /var/lib/dokku/core-plugins/available/common/prop exists git main rev-env-var        
2023-03-16T11:40:39.0500084Z remote: + ENV_VAR_NAME=GIT_REV        
2023-03-16T11:40:39.0501398Z remote: + [[ -n GIT_REV ]]        
2023-03-16T11:40:39.0508530Z remote: + DOKKU_QUIET_OUTPUT=1        
2023-03-16T11:40:39.0509891Z remote: + config_set --no-restart main GIT_REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0510743Z remote: + declare 'desc=set value of given config var'        
2023-03-16T11:40:39.0512171Z remote: + config_sub set --no-restart main GIT_REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0513231Z remote: + declare 'desc=executes a config subcommand'        
2023-03-16T11:40:39.0513821Z remote: + local name=set        
2023-03-16T11:40:39.0514481Z remote: + shift        
2023-03-16T11:40:39.0516464Z remote: + /var/lib/dokku/plugins/available/config/config_sub set --no-restart main GIT_REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.0538785Z remote:  ?     plugn trigger post-config-update [main set GIT_REV]        
2023-03-16T11:40:39.1577962Z remote: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:39.1609304Z remote: ++ set -eo pipefail        
2023-03-16T11:40:39.1609854Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:39.1610496Z remote: ++ set -x        
2023-03-16T11:40:39.1611270Z remote: + [[ ! -n '' ]]        
2023-03-16T11:40:39.1658646Z remote: + local REF=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.1660065Z remote: + [[ -z 094267eda0be20dfbd915332bc53e5c4bcff60b8 ]]        
2023-03-16T11:40:39.1660947Z remote: + git_build_app_repo main 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.1662085Z remote: + declare 'desc=builds local git app repo for app'        
2023-03-16T11:40:39.1663179Z remote: + declare APP=main REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.1663903Z remote: + local DOKKU_GLOBAL_DISABLE_AUTOCREATE        
2023-03-16T11:40:39.1664875Z remote: + verify_app_name main        
2023-03-16T11:40:39.1665641Z remote: + declare 'desc=verify app name format and app existence'        
2023-03-16T11:40:39.1666660Z remote: + declare APP=main        
2023-03-16T11:40:39.1667847Z remote: + /var/lib/dokku/core-plugins/available/common/common --quiet verify-app-name main        
2023-03-16T11:40:39.1714385Z remote: + return 0        
2023-03-16T11:40:39.1717730Z remote: ++ mktemp -d /tmp/dokku-272993-git_build_app_repo.XXXXXX        
2023-03-16T11:40:39.1752976Z remote: + local GIT_BUILD_APP_REPO_TMP_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.1754230Z remote: + trap 'rm -rf '\''/tmp/dokku-272993-git_build_app_repo.CY0JZg'\'' >/dev/null' RETURN INT TERM EXIT        
2023-03-16T11:40:39.1755542Z remote: + chmod 755 /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.1783508Z remote: + unset GIT_DIR GIT_QUARANTINE_PATH GIT_WORK_TREE        
2023-03-16T11:40:39.1786053Z remote: + plugn trigger app-exists main        
2023-03-16T11:40:39.3015701Z remote: + fn-git-setup-build-dir main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3018295Z remote: + declare APP=main GIT_WORKDIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3019764Z remote: ++ fn-plugin-property-get git main keep-git-dir ''        
2023-03-16T11:40:39.3020742Z remote: ++ declare 'desc=returns the value for a given property'        
2023-03-16T11:40:39.3021615Z remote: ++ declare PLUGIN=git APP=main KEY=keep-git-dir DEFAULT=        
2023-03-16T11:40:39.3022665Z remote: ++ fn-plugin-property-get-default git main keep-git-dir ''        
2023-03-16T11:40:39.3023658Z remote: ++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:39.3024740Z remote: ++ declare PLUGIN=git APP=main KEY=keep-git-dir DEFAULT=        
2023-03-16T11:40:39.3026227Z remote: ++ /var/lib/dokku/core-plugins/available/common/prop get-with-default git main keep-git-dir ''        
2023-03-16T11:40:39.3055749Z remote: + local DOKKU_KEEP_GIT_DIR=        
2023-03-16T11:40:39.3057085Z remote: + fn-git-use-worktree        
2023-03-16T11:40:39.3058248Z remote: + declare 'desc=detects whether to use git worktree'        
2023-03-16T11:40:39.3059377Z remote: + local GIT_VERSION MAJOR_VERSION MINOR_VERSION        
2023-03-16T11:40:39.3065589Z remote: ++ awk '{split($0,a," "); print a[3]}'        
2023-03-16T11:40:39.3094052Z remote: ++ git --version        
2023-03-16T11:40:39.3119701Z remote: + GIT_VERSION=2.34.1        
2023-03-16T11:40:39.3140969Z remote: ++ awk '{split($0,a,"."); print a[1]}'        
2023-03-16T11:40:39.3152623Z remote: ++ echo 2.34.1        
2023-03-16T11:40:39.3212302Z remote: + MAJOR_VERSION=2        
2023-03-16T11:40:39.3232892Z remote: ++ awk '{split($0,a,"."); print a[2]}'        
2023-03-16T11:40:39.3253762Z remote: ++ echo 2.34.1        
2023-03-16T11:40:39.3307592Z remote: + MINOR_VERSION=34        
2023-03-16T11:40:39.3309173Z remote: + [[ 2 -ge 3 ]]        
2023-03-16T11:40:39.3309841Z remote: + [[ 2 -eq 2 ]]        
2023-03-16T11:40:39.3310441Z remote: + [[ 34 -ge 11 ]]        
2023-03-16T11:40:39.3310933Z remote: + return 0        
2023-03-16T11:40:39.3311585Z remote: + [[ '' == \t\r\u\e ]]        
2023-03-16T11:40:39.3312513Z remote: + fn-git-setup-build-dir-worktree main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3313635Z remote: + declare APP=main GIT_WORKDIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3314384Z remote: + local APP_ROOT=/home/dokku/main        
2023-03-16T11:40:39.3314926Z remote: + unset GIT_QUARANTINE_PATH        
2023-03-16T11:40:39.3316119Z remote: + suppress_output fn-git-cmd /home/dokku/main worktree add /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3317478Z remote: + declare 'desc=suppress all output from a given command unless there is an error'        
2023-03-16T11:40:39.3318397Z remote: + local TMP_COMMAND_OUTPUT        
2023-03-16T11:40:39.3372318Z remote: ++ mktemp /tmp/dokku-272993-suppress_output.XXXXXX        
2023-03-16T11:40:39.3401818Z remote: + TMP_COMMAND_OUTPUT=/tmp/dokku-272993-suppress_output.eGVaky        
2023-03-16T11:40:39.3403229Z remote: + trap 'rm -rf '\''/tmp/dokku-272993-suppress_output.eGVaky'\'' >/dev/null' RETURN        
2023-03-16T11:40:39.3404726Z remote: + fn-git-cmd /home/dokku/main worktree add /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.3738216Z remote: + return 0        
2023-03-16T11:40:39.3739735Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.eGVaky        
2023-03-16T11:40:39.3774123Z remote: + fn-git-setup-build-dir-submodules main /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.3781188Z remote: + declare APP=main GIT_WORKDIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.3812470Z remote: ++ fn-plugin-property-get git main keep-git-dir ''        
2023-03-16T11:40:39.3847441Z remote: ++ declare 'desc=returns the value for a given property'        
2023-03-16T11:40:39.3849964Z remote: ++ declare PLUGIN=git APP=main KEY=keep-git-dir DEFAULT=        
2023-03-16T11:40:39.3851835Z remote: ++ fn-plugin-property-get-default git main keep-git-dir ''        
2023-03-16T11:40:39.3852998Z remote: ++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:39.3854624Z remote: ++ declare PLUGIN=git APP=main KEY=keep-git-dir DEFAULT=        
2023-03-16T11:40:39.3856030Z remote: ++ /var/lib/dokku/core-plugins/available/common/prop get-with-default git main keep-git-dir ''        
2023-03-16T11:40:39.4041960Z remote: + local DOKKU_KEEP_GIT_DIR=        
2023-03-16T11:40:39.4043687Z remote: + unset GIT_QUARANTINE_PATH        
2023-03-16T11:40:39.4045723Z remote: + suppress_output fn-git-cmd /tmp/dokku-272993-git_build_app_repo.CY0JZg submodule sync --recursive        
2023-03-16T11:40:39.4047206Z remote: + declare 'desc=suppress all output from a given command unless there is an error'        
2023-03-16T11:40:39.4048950Z remote: + local TMP_COMMAND_OUTPUT        
2023-03-16T11:40:39.4050579Z remote: ++ mktemp /tmp/dokku-272993-suppress_output.XXXXXX        
2023-03-16T11:40:39.4082972Z remote: + TMP_COMMAND_OUTPUT=/tmp/dokku-272993-suppress_output.TlIEQU        
2023-03-16T11:40:39.4084797Z remote: + trap 'rm -rf '\''/tmp/dokku-272993-suppress_output.TlIEQU'\'' >/dev/null' RETURN        
2023-03-16T11:40:39.4086220Z remote: + fn-git-cmd /tmp/dokku-272993-git_build_app_repo.CY0JZg submodule sync --recursive        
2023-03-16T11:40:39.4864500Z remote: + return 0        
2023-03-16T11:40:39.4865552Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.TlIEQU        
2023-03-16T11:40:39.4898178Z remote: + suppress_output fn-git-cmd /tmp/dokku-272993-git_build_app_repo.CY0JZg submodule update --init --recursive        
2023-03-16T11:40:39.4900490Z remote: + declare 'desc=suppress all output from a given command unless there is an error'        
2023-03-16T11:40:39.4901211Z remote: + local TMP_COMMAND_OUTPUT        
2023-03-16T11:40:39.4902205Z remote: ++ mktemp /tmp/dokku-272993-suppress_output.XXXXXX        
2023-03-16T11:40:39.4942684Z remote: + TMP_COMMAND_OUTPUT=/tmp/dokku-272993-suppress_output.4xp2v8        
2023-03-16T11:40:39.4943713Z remote: + trap 'rm -rf '\''/tmp/dokku-272993-suppress_output.4xp2v8'\'' >/dev/null' RETURN        
2023-03-16T11:40:39.4945138Z remote: + fn-git-cmd /tmp/dokku-272993-git_build_app_repo.CY0JZg submodule update --init --recursive        
2023-03-16T11:40:39.5993028Z remote: + return 0        
2023-03-16T11:40:39.5994032Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.4xp2v8        
2023-03-16T11:40:39.6048013Z remote: + [[ '' != \t\r\u\e ]]        
2023-03-16T11:40:39.6048828Z remote: + pushd /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.6050264Z remote: + find /tmp/dokku-272993-git_build_app_repo.CY0JZg -name .git -prune -exec rm -rf '{}' ';'        
2023-03-16T11:40:39.6150558Z remote: + popd        
2023-03-16T11:40:39.6152103Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.4xp2v8        
2023-03-16T11:40:39.6175052Z remote: + suppress_output fn-git-cmd /home/dokku/main worktree prune        
2023-03-16T11:40:39.6176151Z remote: + declare 'desc=suppress all output from a given command unless there is an error'        
2023-03-16T11:40:39.6177265Z remote: + local TMP_COMMAND_OUTPUT        
2023-03-16T11:40:39.6193166Z remote: ++ mktemp /tmp/dokku-272993-suppress_output.XXXXXX        
2023-03-16T11:40:39.6243207Z remote: + TMP_COMMAND_OUTPUT=/tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:39.6244204Z remote: + trap 'rm -rf '\''/tmp/dokku-272993-suppress_output.1WqlVP'\'' >/dev/null' RETURN        
2023-03-16T11:40:39.6245543Z remote: + fn-git-cmd /home/dokku/main worktree prune        
2023-03-16T11:40:39.6281647Z remote: + return 0        
2023-03-16T11:40:39.6282440Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:39.6335447Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:39.6360491Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:39.6385655Z remote: + pushd /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:39.6386843Z remote: + local DOKKU_APP_DISABLE_ANSI_PREFIX_REMOVAL DOKKU_GLOBAL_DISABLE_ANSI_PREFIX_REMOVAL DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6425001Z remote: ++ config_get main DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6426662Z remote: ++ declare 'desc=get value of given config var'        
2023-03-16T11:40:39.6428907Z remote: ++ config_sub get main DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6430392Z remote: ++ declare 'desc=executes a config subcommand'        
2023-03-16T11:40:39.6430991Z remote: ++ local name=get        
2023-03-16T11:40:39.6443957Z remote: ++ shift        
2023-03-16T11:40:39.6445181Z remote: ++ /var/lib/dokku/plugins/available/config/config_sub get main DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6551055Z remote: ++ true        
2023-03-16T11:40:39.6551702Z remote: + DOKKU_APP_DISABLE_ANSI_PREFIX_REMOVAL=        
2023-03-16T11:40:39.6572343Z remote: ++ config_get --global DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6573643Z remote: ++ declare 'desc=get value of given config var'        
2023-03-16T11:40:39.6574599Z remote: ++ config_sub get --global DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6575505Z remote: ++ declare 'desc=executes a config subcommand'        
2023-03-16T11:40:39.6598589Z remote: ++ local name=get        
2023-03-16T11:40:39.6599269Z remote: ++ shift        
2023-03-16T11:40:39.6600828Z remote: ++ /var/lib/dokku/plugins/available/config/config_sub get --global DOKKU_DISABLE_ANSI_PREFIX_REMOVAL        
2023-03-16T11:40:39.6687758Z remote: ++ true        
2023-03-16T11:40:39.6688448Z remote: + DOKKU_GLOBAL_DISABLE_ANSI_PREFIX_REMOVAL=        
2023-03-16T11:40:39.6689099Z remote: + DOKKU_DISABLE_ANSI_PREFIX_REMOVAL=        
2023-03-16T11:40:39.6690149Z remote: + [[ '' == \t\r\u\e ]]        
2023-03-16T11:40:39.6700243Z remote: + sed -u 's/^/␛[1G/'        
2023-03-16T11:40:39.6732779Z remote: + git_trigger_build main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.6743310Z remote: + declare 'desc=triggers the actual build process for a given app within a directory at a particular revision'        
2023-03-16T11:40:39.6751433Z remote: + declare APP=main TMP_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg REV=094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.6753189Z remote: + local BUILDER        
2023-03-16T11:40:39.6754338Z remote: + plugn trigger core-post-extract main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:39.9700491Z remote: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:39.9701378Z remote: ++ set -eo pipefail        
2023-03-16T11:40:39.9702362Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:39.9703767Z remote: ++ set -x        
2023-03-16T11:40:39.9840695Z remote: + [[ ! -n '' ]]        
2023-03-16T11:40:40.0185142Z remote:  ?     plugn trigger git-get-property [main source-image]        
2023-03-16T11:40:40.3144049Z remote:  ?     plugn trigger git-get-property stderr: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:40.3145832Z remote:  ?     plugn trigger git-get-property stderr: ++ set -eo pipefail        
2023-03-16T11:40:40.3146854Z remote:  ?     plugn trigger git-get-property stderr: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.3148400Z remote:  ?     plugn trigger git-get-property stderr: ++ set -x        
2023-03-16T11:40:40.3149517Z remote:  ?     plugn trigger git-get-property stderr: + [[ ! -n '' ]]        
2023-03-16T11:40:40.3150800Z remote:  ?     plugn trigger git-get-property stderr: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:40.3152734Z remote:  ?     plugn trigger git-get-property stderr: +++ set -eo pipefail        
2023-03-16T11:40:40.3153663Z remote:  ?     plugn trigger git-get-property stderr: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.3154723Z remote:  ?     plugn trigger git-get-property stderr: +++ set -x        
2023-03-16T11:40:40.3155820Z remote:  ?     plugn trigger git-get-property stderr: ++ set -eo pipefail        
2023-03-16T11:40:40.3156832Z remote:  ?     plugn trigger git-get-property stderr: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.3157936Z remote:  ?     plugn trigger git-get-property stderr: ++ set -x        
2023-03-16T11:40:40.3160137Z remote:  ?     plugn trigger git-get-property stderr: + [[ -n 1 ]]        
2023-03-16T11:40:40.3161116Z remote:  ?     plugn trigger git-get-property stderr: + set -x        
2023-03-16T11:40:40.3167555Z remote:  ?     plugn trigger git-get-property stderr: + trigger-git-git-get-property main source-image        
2023-03-16T11:40:40.3168675Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=return the value for an app'\''s git property'        
2023-03-16T11:40:40.3169520Z remote:  ?     plugn trigger git-get-property stderr: + declare trigger=git-get-property        
2023-03-16T11:40:40.3174282Z remote:  ?     plugn trigger git-get-property stderr: + declare APP=main KEY=source-image        
2023-03-16T11:40:40.3175521Z remote:  ?     plugn trigger git-get-property stderr: + [[ source-image == \s\o\u\r\c\e\-\i\m\a\g\e ]]        
2023-03-16T11:40:40.3176498Z remote:  ?     plugn trigger git-get-property stderr: + fn-git-source-image main        
2023-03-16T11:40:40.3178127Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=retrieve the source-image for a given application'        
2023-03-16T11:40:40.3178954Z remote:  ?     plugn trigger git-get-property stderr: + declare APP=main        
2023-03-16T11:40:40.3179830Z remote:  ?     plugn trigger git-get-property stderr: + fn-plugin-property-get git main source-image ''        
2023-03-16T11:40:40.3180916Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=returns the value for a given property'        
2023-03-16T11:40:40.3182081Z remote:  ?     plugn trigger git-get-property stderr: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:40.3182963Z remote:  ?     plugn trigger git-get-property stderr: + fn-plugin-property-get-default git main source-image ''        
2023-03-16T11:40:40.3184096Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.3185314Z remote:  ?     plugn trigger git-get-property stderr: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:40.3186378Z remote:  ?     plugn trigger git-get-property stderr: + /var/lib/dokku/core-plugins/available/common/prop get-with-default git main source-image ''        
2023-03-16T11:40:40.3187199Z remote:  ?     plugn trigger git-get-property stderr: + return        
2023-03-16T11:40:40.3188009Z remote:  ?     plugn trigger git-get-property stderr:         
2023-03-16T11:40:40.3188756Z remote:  ?     plugn trigger git-get-property stdout:         
2023-03-16T11:40:40.3189375Z remote:  ?     plugn trigger builder-get-property [main build-dir]        
2023-03-16T11:40:40.6205689Z remote:  ?     plugn trigger builder-get-property stderr:         
2023-03-16T11:40:40.6206489Z remote:  ?     plugn trigger builder-get-property stdout:         
2023-03-16T11:40:40.6207652Z remote:  ?     plugn trigger builder-get-property stdout:         
2023-03-16T11:40:40.6859557Z remote: + source /var/lib/dokku/plugins/available/builder-dockerfile/internal-functions        
2023-03-16T11:40:40.6902464Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:40.6903720Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.6905080Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.6906892Z remote: +++ set -x        
2023-03-16T11:40:40.6931163Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:40.6932306Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.6932988Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.6933565Z remote: +++ set -x        
2023-03-16T11:40:40.6934867Z remote: ++ set -eo pipefail        
2023-03-16T11:40:40.6935779Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.6936926Z remote: ++ set -x        
2023-03-16T11:40:40.6941325Z remote: + set -eo pipefail        
2023-03-16T11:40:40.6955040Z remote: + [[ -n 1 ]]        
2023-03-16T11:40:40.6958241Z remote: + set -x        
2023-03-16T11:40:40.6959656Z remote: + trigger-builder-dockerfile-core-post-extract main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:40.6961313Z remote: + declare 'desc=builder-dockerfile post-extract plugin trigger'        
2023-03-16T11:40:40.7008441Z remote: + declare trigger=post-extract        
2023-03-16T11:40:40.7011919Z remote: + declare APP=main SOURCECODE_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:40.7013905Z remote: ++ fn-builder-dockerfile-computed-dockerfile-path main        
2023-03-16T11:40:40.7014981Z remote: ++ declare APP=main        
2023-03-16T11:40:40.7015940Z remote: +++ fn-builder-dockerfile-dockerfile-path main        
2023-03-16T11:40:40.7016679Z remote: +++ declare APP=main        
2023-03-16T11:40:40.7017544Z remote: +++ fn-plugin-property-get-default builder-dockerfile main dockerfile-path ''        
2023-03-16T11:40:40.7018530Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.7022354Z remote: +++ declare PLUGIN=builder-dockerfile APP=main KEY=dockerfile-path DEFAULT=        
2023-03-16T11:40:40.7023953Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-dockerfile main dockerfile-path ''        
2023-03-16T11:40:40.7160462Z remote: ++ file=        
2023-03-16T11:40:40.7161081Z remote: ++ [[ '' == '' ]]        
2023-03-16T11:40:40.7187146Z remote: +++ fn-builder-dockerfile-global-dockerfile-path main        
2023-03-16T11:40:40.7191130Z remote: +++ declare APP=main        
2023-03-16T11:40:40.7191976Z remote: +++ fn-plugin-property-get-default builder-dockerfile --global dockerfile-path Dockerfile        
2023-03-16T11:40:40.7192899Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.7194057Z remote: +++ declare PLUGIN=builder-dockerfile APP=--global KEY=dockerfile-path DEFAULT=Dockerfile        
2023-03-16T11:40:40.7195403Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-dockerfile --global dockerfile-path Dockerfile        
2023-03-16T11:40:40.7258505Z remote: ++ file=Dockerfile        
2023-03-16T11:40:40.7262362Z remote: ++ echo Dockerfile        
2023-03-16T11:40:40.7262818Z remote: + local NEW_DOCKERFILE=Dockerfile        
2023-03-16T11:40:40.7263400Z remote: + pushd ''        
2023-03-16T11:40:40.7263867Z remote: + [[ -z Dockerfile ]]        
2023-03-16T11:40:40.7264330Z remote: + [[ Dockerfile == \D\o\c\k\e\r\f\i\l\e ]]        
2023-03-16T11:40:40.7264773Z remote: + return        
2023-03-16T11:40:40.7574533Z remote: + source /var/lib/dokku/plugins/available/builder-lambda/internal-functions        
2023-03-16T11:40:40.7588350Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:40.7589944Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.7590472Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.7591495Z remote: +++ set -x        
2023-03-16T11:40:40.7666072Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:40.7667563Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.7668879Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.7669567Z remote: +++ set -x        
2023-03-16T11:40:40.7671246Z remote: ++ set -eo pipefail        
2023-03-16T11:40:40.7700077Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.7701081Z remote: ++ set -x        
2023-03-16T11:40:40.7709974Z remote: + set -eo pipefail        
2023-03-16T11:40:40.7710519Z remote: + [[ -n 1 ]]        
2023-03-16T11:40:40.7711015Z remote: + set -x        
2023-03-16T11:40:40.7734349Z remote: + trigger-builder-lambda-core-post-extract main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:40.7735714Z remote: + declare 'desc=builder-lambda post-extract plugin trigger'        
2023-03-16T11:40:40.7737124Z remote: + declare trigger=post-extract        
2023-03-16T11:40:40.7737981Z remote: + declare APP=main SOURCECODE_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:40.7739407Z remote: ++ fn-builder-lambda-computed-lambdayml-path main        
2023-03-16T11:40:40.7742529Z remote: ++ declare APP=main        
2023-03-16T11:40:40.7788329Z remote: +++ fn-builder-lambda-lambdayml-path main        
2023-03-16T11:40:40.7789765Z remote: +++ declare APP=main        
2023-03-16T11:40:40.7790470Z remote: +++ fn-plugin-property-get-default builder-lambda main lambdayml-path ''        
2023-03-16T11:40:40.7791861Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.7792702Z remote: +++ declare PLUGIN=builder-lambda APP=main KEY=lambdayml-path DEFAULT=        
2023-03-16T11:40:40.7793593Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-lambda main lambdayml-path ''        
2023-03-16T11:40:40.7873878Z remote: ++ file=        
2023-03-16T11:40:40.7877238Z remote: ++ [[ '' == '' ]]        
2023-03-16T11:40:40.7909901Z remote: +++ fn-builder-lambda-global-lambdayml-path main        
2023-03-16T11:40:40.7910487Z remote: +++ declare APP=main        
2023-03-16T11:40:40.7911178Z remote: +++ fn-plugin-property-get-default builder-lambda --global lambdayml-path lambda.yml        
2023-03-16T11:40:40.7912044Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.7912861Z remote: +++ declare PLUGIN=builder-lambda APP=--global KEY=lambdayml-path DEFAULT=lambda.yml        
2023-03-16T11:40:40.7914388Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-lambda --global lambdayml-path lambda.yml        
2023-03-16T11:40:40.7998946Z remote: ++ file=lambda.yml        
2023-03-16T11:40:40.8000491Z remote: ++ echo lambda.yml        
2023-03-16T11:40:40.8001653Z remote: + local NEW_LAMBDA_YML=lambda.yml        
2023-03-16T11:40:40.8002607Z remote: + pushd ''        
2023-03-16T11:40:40.8004742Z remote: + [[ -z lambda.yml ]]        
2023-03-16T11:40:40.8005235Z remote: + [[ ! -f lambda.yml ]]        
2023-03-16T11:40:40.8005727Z remote: + rm -f lambda.yml        
2023-03-16T11:40:40.8038122Z remote: + return        
2023-03-16T11:40:40.8460913Z remote: + source /var/lib/dokku/plugins/available/builder-pack/internal-functions        
2023-03-16T11:40:40.8463131Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:40.8464147Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.8465140Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.8466088Z remote: +++ set -x        
2023-03-16T11:40:40.8487938Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:40.8503310Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.8542108Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.8544969Z remote: +++ set -x        
2023-03-16T11:40:40.8545479Z remote: ++ set -eo pipefail        
2023-03-16T11:40:40.8545972Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.8548915Z remote: ++ set -x        
2023-03-16T11:40:40.8551450Z remote: + set -eo pipefail        
2023-03-16T11:40:40.8554911Z remote: + [[ -n 1 ]]        
2023-03-16T11:40:40.8555495Z remote: + set -x        
2023-03-16T11:40:40.8556809Z remote: + trigger-builder-pack-core-post-extract main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:40.8558111Z remote: + declare 'desc=builder-pack post-extract plugin trigger'        
2023-03-16T11:40:40.8558798Z remote: + declare trigger=post-extract        
2023-03-16T11:40:40.8559537Z remote: + declare APP=main SOURCECODE_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:40.8564842Z remote: ++ fn-builder-pack-computed-projecttoml-path main        
2023-03-16T11:40:40.8565468Z remote: ++ declare APP=main        
2023-03-16T11:40:40.8616469Z remote: +++ fn-builder-pack-projecttoml-path main        
2023-03-16T11:40:40.8617519Z remote: +++ declare APP=main        
2023-03-16T11:40:40.8619996Z remote: +++ fn-plugin-property-get-default builder-pack main projecttoml-path ''        
2023-03-16T11:40:40.8621159Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.8623002Z remote: +++ declare PLUGIN=builder-pack APP=main KEY=projecttoml-path DEFAULT=        
2023-03-16T11:40:40.8624529Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-pack main projecttoml-path ''        
2023-03-16T11:40:40.8742340Z remote: ++ file=        
2023-03-16T11:40:40.8743905Z remote: ++ [[ '' == '' ]]        
2023-03-16T11:40:40.8772929Z remote: +++ fn-builder-pack-global-projecttoml-path main        
2023-03-16T11:40:40.8774600Z remote: +++ declare APP=main        
2023-03-16T11:40:40.8777559Z remote: +++ fn-plugin-property-get-default builder-pack --global projecttoml-path project.toml        
2023-03-16T11:40:40.8778762Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.8779740Z remote: +++ declare PLUGIN=builder-pack APP=--global KEY=projecttoml-path DEFAULT=project.toml        
2023-03-16T11:40:40.8781016Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default builder-pack --global projecttoml-path project.toml        
2023-03-16T11:40:40.8837757Z remote: ++ file=project.toml        
2023-03-16T11:40:40.8838598Z remote: ++ echo project.toml        
2023-03-16T11:40:40.8839596Z remote: + local NEW_PROJECT_TOML=project.toml        
2023-03-16T11:40:40.8840506Z remote: + pushd ''        
2023-03-16T11:40:40.8842698Z remote: + [[ -z project.toml ]]        
2023-03-16T11:40:40.8843445Z remote: + [[ ! -f project.toml ]]        
2023-03-16T11:40:40.8844166Z remote: + rm -f project.toml        
2023-03-16T11:40:40.8867247Z remote: + return        
2023-03-16T11:40:40.9096915Z remote: + source /var/lib/dokku/plugins/available/nginx-vhosts/internal-functions        
2023-03-16T11:40:40.9098158Z remote: ++ set -eo pipefail        
2023-03-16T11:40:40.9101476Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:40.9102618Z remote: ++ set -x        
2023-03-16T11:40:40.9103597Z remote: ++ source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:40.9105779Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.9106636Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.9108088Z remote: +++ set -x        
2023-03-16T11:40:40.9138791Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:40.9150678Z remote: +++ set -eo pipefail        
2023-03-16T11:40:40.9151540Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:40.9152158Z remote: +++ set -x        
2023-03-16T11:40:40.9170113Z remote: + set -eo pipefail        
2023-03-16T11:40:40.9171866Z remote: + [[ -n 1 ]]        
2023-03-16T11:40:40.9172540Z remote: + set -x        
2023-03-16T11:40:40.9174784Z remote: + trigger-nginx-vhosts-core-post-extract main /tmp/dokku-272993-git_build_app_repo.CY0JZg 094267eda0be20dfbd915332bc53e5c4bcff60b8        
2023-03-16T11:40:40.9232826Z remote: + declare 'desc=nginx-vhosts post-extract plugin trigger'        
2023-03-16T11:40:40.9234935Z remote: + declare trigger=post-extract        
2023-03-16T11:40:40.9236484Z remote: + declare APP=main SOURCECODE_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:40.9237875Z remote: ++ fn-nginx-computed-nginx-conf-sigil-path main        
2023-03-16T11:40:40.9238582Z remote: ++ declare APP=main        
2023-03-16T11:40:40.9246799Z remote: +++ fn-nginx-nginx-conf-sigil-path main        
2023-03-16T11:40:40.9247790Z remote: +++ declare APP=main        
2023-03-16T11:40:40.9250456Z remote: +++ fn-plugin-property-get-default nginx main nginx-conf-sigil-path ''        
2023-03-16T11:40:40.9251609Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.9252734Z remote: +++ declare PLUGIN=nginx APP=main KEY=nginx-conf-sigil-path DEFAULT=        
2023-03-16T11:40:40.9253760Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default nginx main nginx-conf-sigil-path ''        
2023-03-16T11:40:40.9328955Z remote: ++ local conf_sigil_path=        
2023-03-16T11:40:40.9330387Z remote: ++ [[ '' == '' ]]        
2023-03-16T11:40:40.9355165Z remote: +++ fn-nginx-global-nginx-conf-sigil-path        
2023-03-16T11:40:40.9356222Z remote: +++ declare APP=        
2023-03-16T11:40:40.9358977Z remote: +++ fn-plugin-property-get-default nginx --global nginx-conf-sigil-path nginx.conf.sigil        
2023-03-16T11:40:40.9360325Z remote: +++ declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:40.9361505Z remote: +++ declare PLUGIN=nginx APP=--global KEY=nginx-conf-sigil-path DEFAULT=nginx.conf.sigil        
2023-03-16T11:40:40.9362628Z remote: +++ /var/lib/dokku/core-plugins/available/common/prop get-with-default nginx --global nginx-conf-sigil-path nginx.conf.sigil        
2023-03-16T11:40:40.9478843Z remote: ++ conf_sigil_path=nginx.conf.sigil        
2023-03-16T11:40:40.9479563Z remote: ++ echo nginx.conf.sigil        
2023-03-16T11:40:40.9480369Z remote: + local CONF_SIGIL_PATH=nginx.conf.sigil        
2023-03-16T11:40:40.9481307Z remote: + local app_source_image        
2023-03-16T11:40:40.9511137Z remote: ++ plugn trigger git-get-property main source-image        
2023-03-16T11:40:41.2288491Z remote: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:41.2344827Z remote: ++ set -eo pipefail        
2023-03-16T11:40:41.2351347Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:41.2353639Z remote: ++ set -x        
2023-03-16T11:40:41.2437784Z remote: + [[ ! -n '' ]]        
2023-03-16T11:40:41.2768388Z remote: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:41.2769406Z remote: +++ set -eo pipefail        
2023-03-16T11:40:41.2771136Z remote: +++ [[ -n 1 ]]        
2023-03-16T11:40:41.2771746Z remote: +++ set -x        
2023-03-16T11:40:41.2772334Z remote: ++ set -eo pipefail        
2023-03-16T11:40:41.2772938Z remote: ++ [[ -n 1 ]]        
2023-03-16T11:40:41.2773965Z remote: ++ set -x        
2023-03-16T11:40:41.2795816Z remote: + [[ -n 1 ]]        
2023-03-16T11:40:41.2825082Z remote: + set -x        
2023-03-16T11:40:41.2827033Z remote: + trigger-git-git-get-property main source-image        
2023-03-16T11:40:41.2829916Z remote: + declare 'desc=return the value for an app'\''s git property'        
2023-03-16T11:40:41.2832292Z remote: + declare trigger=git-get-property        
2023-03-16T11:40:41.2834740Z remote: + declare APP=main KEY=source-image        
2023-03-16T11:40:41.2836256Z remote: + [[ source-image == \s\o\u\r\c\e\-\i\m\a\g\e ]]        
2023-03-16T11:40:41.2837157Z remote: + fn-git-source-image main        
2023-03-16T11:40:41.2838382Z remote: + declare 'desc=retrieve the source-image for a given application'        
2023-03-16T11:40:41.2839172Z remote: + declare APP=main        
2023-03-16T11:40:41.2840109Z remote: + fn-plugin-property-get git main source-image ''        
2023-03-16T11:40:41.2841757Z remote: + declare 'desc=returns the value for a given property'        
2023-03-16T11:40:41.2842912Z remote: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:41.2844272Z remote: + fn-plugin-property-get-default git main source-image ''        
2023-03-16T11:40:41.2845659Z remote: + declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:41.2846585Z remote: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:41.2848342Z remote: + /var/lib/dokku/core-plugins/available/common/prop get-with-default git main source-image ''        
2023-03-16T11:40:41.2975780Z remote: + return        
2023-03-16T11:40:41.3096519Z remote: + app_source_image=        
2023-03-16T11:40:41.3097262Z remote: + [[ -n '' ]]        
2023-03-16T11:40:41.3098690Z remote: + fn-nginx-vhosts-copy-from-directory main /tmp/dokku-272993-git_build_app_repo.CY0JZg nginx.conf.sigil        
2023-03-16T11:40:41.3099945Z remote: + declare APP=main SOURCECODE_WORK_DIR=/tmp/dokku-272993-git_build_app_repo.CY0JZg CONF_SIGIL_PATH=nginx.conf.sigil        
2023-03-16T11:40:41.3100834Z remote: + pushd /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:41.3101582Z remote: + mkdir -p /var/lib/dokku/data/nginx-vhosts/app-main        
2023-03-16T11:40:41.3156632Z remote: + [[ -z nginx.conf.sigil ]]        
2023-03-16T11:40:41.3158206Z remote: + [[ ! -f nginx.conf.sigil ]]        
2023-03-16T11:40:41.3159554Z remote: + touch /var/lib/dokku/data/nginx-vhosts/app-main/nginx.conf.sigil.272993.missing        
2023-03-16T11:40:41.3203886Z remote: + return        
2023-03-16T11:40:41.3531498Z remote:  ?     plugn trigger git-get-property [main source-image]        
2023-03-16T11:40:41.6534999Z remote:  ?     plugn trigger git-get-property stderr: + source /var/lib/dokku/core-plugins/available/common/functions        
2023-03-16T11:40:41.6536197Z remote:  ?     plugn trigger git-get-property stderr: ++ set -eo pipefail        
2023-03-16T11:40:41.6537575Z remote:  ?     plugn trigger git-get-property stderr: ++ [[ -n 1 ]]        
2023-03-16T11:40:41.6538383Z remote:  ?     plugn trigger git-get-property stderr: ++ set -x        
2023-03-16T11:40:41.6540757Z remote:  ?     plugn trigger git-get-property stderr: + [[ ! -n '' ]]        
2023-03-16T11:40:41.6543326Z remote:  ?     plugn trigger git-get-property stderr: ++ source /var/lib/dokku/core-plugins/available/common/property-functions        
2023-03-16T11:40:41.6544833Z remote:  ?     plugn trigger git-get-property stderr: +++ set -eo pipefail        
2023-03-16T11:40:41.6546267Z remote:  ?     plugn trigger git-get-property stderr: +++ [[ -n 1 ]]        
2023-03-16T11:40:41.6547224Z remote:  ?     plugn trigger git-get-property stderr: +++ set -x        
2023-03-16T11:40:41.6548065Z remote:  ?     plugn trigger git-get-property stderr: ++ set -eo pipefail        
2023-03-16T11:40:41.6548901Z remote:  ?     plugn trigger git-get-property stderr: ++ [[ -n 1 ]]        
2023-03-16T11:40:41.6549696Z remote:  ?     plugn trigger git-get-property stderr: ++ set -x        
2023-03-16T11:40:41.6550484Z remote:  ?     plugn trigger git-get-property stderr: + [[ -n 1 ]]        
2023-03-16T11:40:41.6551395Z remote:  ?     plugn trigger git-get-property stderr: + set -x        
2023-03-16T11:40:41.6552341Z remote:  ?     plugn trigger git-get-property stderr: + trigger-git-git-get-property main source-image        
2023-03-16T11:40:41.6553640Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=return the value for an app'\''s git property'        
2023-03-16T11:40:41.6555123Z remote:  ?     plugn trigger git-get-property stderr: + declare trigger=git-get-property        
2023-03-16T11:40:41.6556061Z remote:  ?     plugn trigger git-get-property stderr: + declare APP=main KEY=source-image        
2023-03-16T11:40:41.6557169Z remote:  ?     plugn trigger git-get-property stderr: + [[ source-image == \s\o\u\r\c\e\-\i\m\a\g\e ]]        
2023-03-16T11:40:41.6558375Z remote:  ?     plugn trigger git-get-property stderr: + fn-git-source-image main        
2023-03-16T11:40:41.6559761Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=retrieve the source-image for a given application'        
2023-03-16T11:40:41.6560632Z remote:  ?     plugn trigger git-get-property stderr: + declare APP=main        
2023-03-16T11:40:41.6561573Z remote:  ?     plugn trigger git-get-property stderr: + fn-plugin-property-get git main source-image ''        
2023-03-16T11:40:41.6562555Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=returns the value for a given property'        
2023-03-16T11:40:41.6563530Z remote:  ?     plugn trigger git-get-property stderr: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:41.6564550Z remote:  ?     plugn trigger git-get-property stderr: + fn-plugin-property-get-default git main source-image ''        
2023-03-16T11:40:41.6565608Z remote:  ?     plugn trigger git-get-property stderr: + declare 'desc=returns the value for a given property with a specified default value'        
2023-03-16T11:40:41.6566652Z remote:  ?     plugn trigger git-get-property stderr: + declare PLUGIN=git APP=main KEY=source-image DEFAULT=        
2023-03-16T11:40:41.6567913Z remote:  ?     plugn trigger git-get-property stderr: + /var/lib/dokku/core-plugins/available/common/prop get-with-default git main source-image ''        
2023-03-16T11:40:41.6568878Z remote:  ?     plugn trigger git-get-property stderr: + return        
2023-03-16T11:40:41.6569625Z remote:  ?     plugn trigger git-get-property stderr:         
2023-03-16T11:40:41.6570359Z remote:  ?     plugn trigger git-get-property stdout:         
2023-03-16T11:40:41.6571092Z remote:  !     open /var/lib/dokku/data/ps/main/Procfile.272993.missing: no such file or directory        
2023-03-16T11:40:41.6571781Z remote: + return 1        
2023-03-16T11:40:41.6572251Z remote: + return 1        
2023-03-16T11:40:41.6572884Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:41.6594669Z remote: + return 1        
2023-03-16T11:40:41.6595522Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:41.6653371Z remote: + exit_code=1        
2023-03-16T11:40:41.6654351Z remote: + release_app_deploy_lock main        
2023-03-16T11:40:41.6655487Z remote: + declare 'desc=release advisory lock used in deploys'        
2023-03-16T11:40:41.6656614Z remote: + local APP=main        
2023-03-16T11:40:41.6658242Z remote: + local APP_DEPLOY_LOCK_FILE=/home/dokku/main/.deploy.lock        
2023-03-16T11:40:41.6659341Z remote: + release_advisory_lock /home/dokku/main/.deploy.lock        
2023-03-16T11:40:41.6660139Z remote: + declare 'desc=release advisory lock'        
2023-03-16T11:40:41.6660774Z remote: + local LOCK_FILE=/home/dokku/main/.deploy.lock        
2023-03-16T11:40:41.6661519Z remote: + local LOCK_FD=200        
2023-03-16T11:40:41.6662087Z remote: + flock -u 200        
2023-03-16T11:40:41.6688769Z remote: + rm -f /home/dokku/main/.deploy.lock        
2023-03-16T11:40:41.6736020Z remote: + return 1        
2023-03-16T11:40:41.6737315Z remote: ++ rm -rf /tmp/dokku-272993-suppress_output.1WqlVP        
2023-03-16T11:40:41.6805693Z remote: + rm -rf /tmp/dokku-272993-git_build_app_repo.CY0JZg        
2023-03-16T11:40:41.6853066Z remote: + exit_code=1        
2023-03-16T11:40:41.6854344Z remote: + set -e        
2023-03-16T11:40:41.6855000Z remote: + [[ 1 -eq 10 ]]        
2023-03-16T11:40:41.6855732Z remote: + implemented=1        
2023-03-16T11:40:41.6856484Z remote: + [[ 1 -ne 0 ]]        
2023-03-16T11:40:41.6856980Z remote: + exit 1        
2023-03-16T11:40:41.6976933Z + exit_code=0
2023-03-16T11:40:41.6977793Z + set -e
2023-03-16T11:40:41.6978350Z + [[ 0 -eq 10 ]]
2023-03-16T11:40:41.6978804Z + implemented=1
2023-03-16T11:40:41.6979357Z + [[ 0 -ne 0 ]]
2023-03-16T11:40:41.6979898Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.6980436Z + set +e
2023-03-16T11:40:41.6981278Z + /var/lib/dokku/plugins/enabled/haproxy-vhosts/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7062633Z + exit_code=10
2023-03-16T11:40:41.7063731Z + set -e
2023-03-16T11:40:41.7064225Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7064901Z + continue
2023-03-16T11:40:41.7065767Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7067102Z + set +e
2023-03-16T11:40:41.7068163Z + /var/lib/dokku/plugins/enabled/logs/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7147728Z + exit_code=10
2023-03-16T11:40:41.7148352Z + set -e
2023-03-16T11:40:41.7148932Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7149420Z + continue
2023-03-16T11:40:41.7150053Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7150764Z + set +e
2023-03-16T11:40:41.7151464Z + /var/lib/dokku/plugins/enabled/network/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7283333Z + exit_code=10
2023-03-16T11:40:41.7284201Z + set -e
2023-03-16T11:40:41.7284781Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7285544Z + continue
2023-03-16T11:40:41.7286098Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7286674Z + set +e
2023-03-16T11:40:41.7288023Z + /var/lib/dokku/plugins/enabled/nginx-vhosts/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7356243Z + exit_code=10
2023-03-16T11:40:41.7356808Z + set -e
2023-03-16T11:40:41.7357722Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7358394Z + continue
2023-03-16T11:40:41.7359088Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7359689Z + set +e
2023-03-16T11:40:41.7360315Z + /var/lib/dokku/plugins/enabled/plugin/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7425225Z + exit_code=10
2023-03-16T11:40:41.7426049Z + set -e
2023-03-16T11:40:41.7426700Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7427198Z + continue
2023-03-16T11:40:41.7427823Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7428443Z + set +e
2023-03-16T11:40:41.7429899Z + /var/lib/dokku/plugins/enabled/proxy/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7544296Z + exit_code=10
2023-03-16T11:40:41.7545164Z + set -e
2023-03-16T11:40:41.7545732Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7546286Z + continue
2023-03-16T11:40:41.7547460Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7548005Z + set +e
2023-03-16T11:40:41.7548966Z + /var/lib/dokku/plugins/enabled/ps/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7650812Z + exit_code=10
2023-03-16T11:40:41.7651626Z + set -e
2023-03-16T11:40:41.7652202Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7653206Z + continue
2023-03-16T11:40:41.7654739Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7655940Z + set +e
2023-03-16T11:40:41.7656713Z + /var/lib/dokku/plugins/enabled/registry/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7760189Z + exit_code=10
2023-03-16T11:40:41.7762200Z + set -e
2023-03-16T11:40:41.7762878Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7771229Z + continue
2023-03-16T11:40:41.7772011Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7772989Z + set +e
2023-03-16T11:40:41.7773778Z + /var/lib/dokku/plugins/enabled/repo/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.7911641Z + exit_code=10
2023-03-16T11:40:41.7912333Z + set -e
2023-03-16T11:40:41.7912906Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.7913390Z + continue
2023-03-16T11:40:41.7914328Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.7915221Z + set +e
2023-03-16T11:40:41.7917283Z + /var/lib/dokku/plugins/enabled/resource/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8028634Z + exit_code=10
2023-03-16T11:40:41.8029476Z + set -e
2023-03-16T11:40:41.8030034Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8030569Z + continue
2023-03-16T11:40:41.8031290Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8031833Z + set +e
2023-03-16T11:40:41.8032700Z + /var/lib/dokku/plugins/enabled/run/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8060325Z + exit_code=10
2023-03-16T11:40:41.8062343Z + set -e
2023-03-16T11:40:41.8064357Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8065413Z + continue
2023-03-16T11:40:41.8066590Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8067365Z + set +e
2023-03-16T11:40:41.8068481Z + /var/lib/dokku/plugins/enabled/scheduler/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8163590Z + exit_code=10
2023-03-16T11:40:41.8164221Z + set -e
2023-03-16T11:40:41.8164981Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8165499Z + continue
2023-03-16T11:40:41.8166032Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8167209Z + set +e
2023-03-16T11:40:41.8168174Z + /var/lib/dokku/plugins/enabled/scheduler-docker-local/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8249639Z + source /var/lib/dokku/plugins/available/scheduler-docker-local/help-functions
2023-03-16T11:40:41.8250918Z ++ set -eo pipefail
2023-03-16T11:40:41.8251524Z ++ [[ -n 1 ]]
2023-03-16T11:40:41.8252492Z ++ set -x
2023-03-16T11:40:41.8253368Z + case "$1" in
2023-03-16T11:40:41.8253996Z + exit 10
2023-03-16T11:40:41.8260184Z + exit_code=10
2023-03-16T11:40:41.8261535Z + set -e
2023-03-16T11:40:41.8262309Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8262839Z + continue
2023-03-16T11:40:41.8263829Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8266395Z + set +e
2023-03-16T11:40:41.8273365Z + /var/lib/dokku/plugins/enabled/scheduler-null/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8367224Z + exit_code=10
2023-03-16T11:40:41.8368134Z + set -e
2023-03-16T11:40:41.8369070Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8369578Z + continue
2023-03-16T11:40:41.8370324Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8370913Z + set +e
2023-03-16T11:40:41.8371578Z + /var/lib/dokku/plugins/enabled/shell/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8412781Z + exit_code=10
2023-03-16T11:40:41.8413381Z + set -e
2023-03-16T11:40:41.8413985Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8414503Z + continue
2023-03-16T11:40:41.8415240Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8415815Z + set +e
2023-03-16T11:40:41.8417023Z + /var/lib/dokku/plugins/enabled/ssh-keys/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8488787Z + exit_code=10
2023-03-16T11:40:41.8489400Z + set -e
2023-03-16T11:40:41.8489968Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8490472Z + continue
2023-03-16T11:40:41.8491181Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8491806Z + set +e
2023-03-16T11:40:41.8492854Z + /var/lib/dokku/plugins/enabled/storage/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8527110Z + exit_code=10
2023-03-16T11:40:41.8528115Z + set -e
2023-03-16T11:40:41.8528722Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8529396Z + continue
2023-03-16T11:40:41.8530045Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8530688Z + set +e
2023-03-16T11:40:41.8531954Z + /var/lib/dokku/plugins/enabled/trace/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8574389Z + exit_code=10
2023-03-16T11:40:41.8575190Z + set -e
2023-03-16T11:40:41.8575783Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8576391Z + continue
2023-03-16T11:40:41.8576949Z + for script in $PLUGIN_ENABLED_PATH/*/commands
2023-03-16T11:40:41.8577565Z + set +e
2023-03-16T11:40:41.8578769Z + /var/lib/dokku/plugins/enabled/traefik-vhosts/commands git-receive-pack ''\''main'\'''
2023-03-16T11:40:41.8634031Z + exit_code=10
2023-03-16T11:40:41.8634728Z + set -e
2023-03-16T11:40:41.8635326Z + [[ 10 -eq 10 ]]
2023-03-16T11:40:41.8635845Z + continue
2023-03-16T11:40:41.8657852Z + [[ 1 -eq 0 ]]
2023-03-16T11:40:41.8660086Z + set +f
2023-03-16T11:40:41.8663451Z + exit 0
2023-03-16T11:40:41.8664187Z To 65.109.229.10:main
2023-03-16T11:40:41.8666389Z  ! [remote rejected] main -> main (pre-receive hook declined)
2023-03-16T11:40:41.8667608Z error: failed to push some refs to '65.109.229.10:main'
2023-03-16T11:40:41.8685955Z ##[error]Process completed with exit code 1.
2023-03-16T11:40:41.8791929Z Post job cleanup.
2023-03-16T11:40:42.0367502Z [command]/usr/bin/git version
2023-03-16T11:40:42.0419385Z git version 2.39.2
2023-03-16T11:40:42.0478600Z Temporarily overriding HOME='/home/runner/work/_temp/6818be42-8471-4a8f-86d4-cc34105aced1' before making global git config changes
2023-03-16T11:40:42.0480936Z Adding repository directory to the temporary git global config as a safe directory
2023-03-16T11:40:42.0488218Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/testapp/testapp
2023-03-16T11:40:42.0534880Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2023-03-16T11:40:42.0580078Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2023-03-16T11:40:42.0938199Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2023-03-16T11:40:42.0970352Z http.https://github.com/.extraheader
2023-03-16T11:40:42.0985845Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2023-03-16T11:40:42.1031104Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2023-03-16T11:40:42.1616735Z Cleaning up orphan processes
````
