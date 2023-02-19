# Docker Fix

When running forna-server in docker, it throws an error:
```
TypeError: findCaller() takes from 1 to 2 positional arguments but 3 were given
```
To fix this error copy the file __init__.py in this folder to: path/to/python(3.x)/logging/__init__.py

For example: if you're running python 3.9 docker image, run this command:
```
cp __init__.py /usr/local/lib/python3.9/logging/__init__.py
```
