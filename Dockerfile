FROM ubuntu:precise

ADD . /src

# Prepare
RUN /src/script/ubuntu-bootstrap
RUN useradd camlistore -m

# Build & install
#
# The build might fail if you have less than 1G or memory
RUN cd /src && go run make.go -sqlite && cp bin/* /bin

EXPOSE 3179
CMD ["/bin/su", "-l", "-c", "/bin/camlistored", "camlistore"]
