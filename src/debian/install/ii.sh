apt-get install -y tmux wireguard-tools curl

curl -sSL https://dl.google.com/go/go${GO_VERSION}.${OS}-${ARCH}.tar.gz \
    | gunzip -d \
    | tar --directory /usr/local
go install github.com/coder/wgtunnel/cmd/tunnel@v0.1.5
mv $HOME/go/bin/tunnel /usr/local/bin/tunnel

curl -o /usr/local/bin/ttyd -L https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64
chmod +x /usr/local/bin/ttyd

curl -o /usr/local/bin/iimatey -L https://raw.githubusercontent.com/ii/matey/canon/iimatey
chmod +x /usr/local/bin/iimatey
