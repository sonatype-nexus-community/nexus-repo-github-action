# Nexus Repository Publisher for GitHub Actions

Publish components from GitHub Action workflow to Nexus Repository.

## Inputs

### `serverUrl`

**Required** Nexus Repository Server URL

### `username`

**Required** Username to connect to Nexus Repo to publish components

### `password`

**Required** Password to connect to Nexus Repo to publish components

### `format`

**Required** Component format e.g. maven2

### `repository`

**Required** Name of target repository on Nexus Repo e.g. maven-releases

### `coordinates`

**Required** Component coordinates in key=value format. e.g. groupId=com.example artifactId=app version=1.0.0

### `assets`

**Required** Component assets in key=value format. e.g. extension=jar

### `filename`

**Required** File to publish

## Example Usage

Maven Build

```
name: Java with Nexus Repository

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Build with Maven
      run: mvn package --file pom.xml
    - name: Nexus Repo Publish
      uses: sonatype-nexus-community/nexus-repo-github-action@master
      with:
        serverUrl: http://163c6cdd.ngrok.io
        username: admin
        password: ${{ secrets.password }}
        format: maven2
        repository: maven-releases
        coordinates: groupId=com.example artifactId=app version=1.0.0
        assets: extension=jar
        filename: ./target/app-1.0.0.jar
```

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

* Use this contribution at the risk tolerance that you have
* Do NOT file Sonatype support tickets related to `Nexus Repo for GitHub Actions` support in regard to this project
* DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using Nexus Repo for GitHub Actions, we are glad to have you here!

## Getting help

Looking to contribute to our code but need some help? There's a few ways to get information:

* Chat with us on [Gitter](https://gitter.im/sonatype/nexus-developers)