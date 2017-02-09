# Non-Official W3C Link Checker Docker image

The W3C Link Checker image. Official Github repo [`w3c/link-checker`](https://github.com/w3c/link-checker) 
Hosted version of W3C Link Checker - https://validator.w3.org/checklink

Latest release check out [`stupchiy/checklink`](https://hub.docker.com/r/stupchiy/checklink/)

## Pull

```
$ docker pull stupchiy/checklink 
```

or

```
$ docker run stupchiy/checklink 
```

## Build

```
$ docker build -t checklink .
```

## Run

```
$ docker run -it --rm checklink
```

Or write into HTML report:

```
$ docker run -it --rm checklink -H report.html
```
