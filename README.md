# apprentissage-flask

__develop__ ![develop](https://github.com/ComteZero/apprentissage-flask/workflows/Python%20application/badge.svg?branch=develop)

__master__ ![master](https://github.com/ComteZero/apprentissage-flask/workflows/Python%20application/badge.svg?branch=master)

## development

```sh
make freeze docker
docker run --rm -p 8080:5000 apprentissage-flask
```

visit <http://localhost:8080/> to see the hello world :D

## tests

one dummy test asserting 1 == 1

## functionnal

basic CRUD on configuration ? access control ?

high-availability

## CI/CD

### environment variables available in github actions

<https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables#default-environment-variables>

### docker steps

<https://www.basefactor.com/github-actions-docker>

<https://medium.com/better-programming/github-actions-for-docker-eaf22bbcc879>

```yaml
steps:
    - name: Docker login
        run: docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}
    - name: Docker build
        run: docker build -t apprentissage-flask .
    - name: Docker tags
        run: |
        docker tag apprentissage-flask ${{ secrets.DOCKER_USERNAME }}/apprentissage-flask:${{ github.sha }}
        docker tag apprentissage-flask ${{ secrets.DOCKER_USERNAME }}/apprentissage-flask:latest-dev
    - name: Docker publish
        run: |
        docker push ${{ secrets.DOCKER_USERNAME }}/apprentissage-flask:${{ github.sha }}
        docker push ${{ secrets.DOCKER_USERNAME }}/apprentissage-flask:latest-dev
```
