# 04 - GUI

## Hotlinks

- https://github.com/jfrazelle/dockerfiles

## Xhost

If you have a problem with your display or you don't see any application. Try to setup xhost.

```bash
xhost +
```

## Resources

- https://github.com/jfrazelle/dockerfiles
- http://wiki.ros.org/docker/Tutorials/GUI
- http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
- https://blog.jessfraz.com/post/docker-containers-on-the-desktop/
- http://linoxide.com/how-tos/20-docker-containers-desktop-user/
- https://oliverveits.wordpress.com/2016/04/28/running-gui-apps-with-docker-for-remote-access/

## Sublime ([Dockerfile](https://github.com/jfrazelle/dockerfiles/blob/master/sublime-text-3/Dockerfile))

``` bash
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.local/share/recently-used.xbel:$HOME/.local/share/recently-used.xbel \
    -e DISPLAY=$DISPLAY \
    -e NEWUSER=$USER \
    -e LANG=en_US.UTF-8 \
    jess/sublime-text-3
```

## Chrome ([Dockerfile](https://github.com/jfrazelle/dockerfiles/blob/master/chrome/stable/Dockerfile))

``` bash
docker run --rm -it \
    --net host \
    --cpuset-cpus 0 \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    jess/chrome
```

## Skype ([Dockerfile](https://github.com/jfrazelle/dockerfiles/blob/master/skype/Dockerfile))

``` bash
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    tianon/skype
```
