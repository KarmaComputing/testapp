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
