# vi: ft=sh
alias ysn="yarn start:new"
alias ysl="yarn start:local"
alias choco="choco.exe"
alias wslexit="wsl.exe -t $WSL_DISTRO_NAME"
alias gmb="gb --sort=-committerdate -vlr \"*/bachngo/*\""
export EDITOR="vim"

function cpprun() {
    if [[ -z "$1" ]]; then
        echo "Missing input file"
        return 255
    fi

    out_file=$(mktemp)
    echo "![ Building $1 > $out_file ]"
    g++ -O3 -Wno-unused-result -o "$out_file" "$1"
    if [[ $? != 0 ]]; then
        echo "Compilation failed"
        return $?
    fi
    echo "![ Running $out_file ]"
    "$out_file"
    rm $out_file
    echo "\n![ Removed $out_file ]"
}

function mkcpp() {
    if [[ -z "$1" ]]; then
        echo "Missing output file"
        return 255
    fi

    if [[ -f "$1" ]]; then
        echo "$1 is existed!"
        return 255
    fi

    base64 -di <<<'
        I2luY2x1ZGUgPGJpdHMvc3RkYysrLmg+CiNkZWZpbmUgRk9SKGksYSxiKSBmb3IgKGludCBpPShh
        KSxfYl89KGIpO2k8X2JfO2krKykKI2RlZmluZSBST0YoaSxhLGIpIGZvciAoaW50IGk9KGEpLF9i
        Xz0oYik7aT5fYl87aS0tKQojZGVmaW5lIElUKGksdikgZm9yICh0eXBlb2YoKHYpLmJlZ2luKCkp
        IGkgPSAodikuYmVnaW4oKTsgaSAhPSAodikuZW5kKCk7ICsraSkKI2RlZmluZSBBTEwodikgdi5i
        ZWdpbigpLCB2LmVuZCgpCiNkZWZpbmUgTVModikgbWVtc2V0KHYsMCxzaXplb2YodikpCnVzaW5n
        IG5hbWVzcGFjZSBzdGQ7CnR5cGVkZWYgbG9uZyBsb25nIExMOwp0eXBlZGVmIHVuc2lnbmVkIGxv
        bmcgbG9uZyBVTEw7CnRlbXBsYXRlPHR5cGVuYW1lIFQ+IHZlY3RvcjxUPiAmb3BlcmF0b3IgKz0g
        KHZlY3RvcjxUPiAmdiwgVCB4KSB7di5wdXNoX2JhY2soeCk7cmV0dXJuIHY7fQoKdm9pZCBzb2x2
        ZSgpIHsKfQoKaW50IG1haW4oKXsKICBpb3NfYmFzZTo6c3luY193aXRoX3N0ZGlvKDApOwogIGNp
        bi50aWUoMCk7CiAgc29sdmUoKTsKfQo=
    ' > $1
    echo "$1 created!"
}
