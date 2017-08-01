# what-is-docker

<..>

## definition

<p>
An image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.</p>

<..>

#Traditional VM
<img src="/images/vm@2x.png" height="500" />

<..>

#Container
<img src="/images/container@2x.png" height="500" />

<..>

- Containers are like an apartment complex.
    - shared infrastructure
    - only renting what you need

- VMs are like houses.
    - self contained, lots of infrastructure.
    - generally more than you need

<..>

- Containers run apps natively on the host machine's kernel
- Perform better than VMs as there is no hypervisor
- Containers run in a discrete process, taking no more memory than any other process

<..>

# Availability

- Linux
- MacOS
- Windows

MacOS and Windows both use a hypervisor to run a tiny linux kernel to then run the images on.

<..>

## Image

- Ordered collection of root filesystem changes for use withing a container runtime.
- Images have no state and they never change.
- The "compiled" state of a container at a point in time.
- This is the output you are after for running something in a cloud.

<..>

## Container

- Runtime instance of an image
- 100% Isolated from the host by default

<..>

## Demo

<..>
<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm ubuntu
    </code>
</pre>

- run = start the named image
- -i = interactive
- -t = pseudo-TTY (ie, terminal)
- ubuntu = image name
    - `:latest` is assumed tag when omitted. 
    - `ubuntu:latest`
<..>

<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm centos
    </code>
</pre>
<..>

<pre>
    <code data-trim data-noescape class="bash">
        docker ps
        docker kill container
        docker images
    </code>
</pre>
<..>

### easy distribution
<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm -p 8080:80 wordpress
    </code>
</pre>

Data stored on host makes upgrading simply throwing away existing container and starting a new one
