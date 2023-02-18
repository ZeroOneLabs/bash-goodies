alias serve="python -m SimpleHTTPServer"

# Find process with open port
port_open_function() {
    '''
    port_open_function() -  Will return a command, PID, User... Node, etc.
                            Will return nothing if the port is not open.
    '''
    if [ ! -n "$1" ];then 
        echo "pop requires one integer argument"
        return 1
    fi
    lsof -i tcp:$1
}
alias pop=port_open_function

#Source - http://apple.stackexchange.com/a/5461
preview_man() {
    # Preview now lives in /System/Applications
    man -t "${1}" | open -f -a /System/Applications/Preview.app
}
# An extension of 'man' should start with 'man'.
alias manpdf=preview_man

#Source - http://apple.stackexchange.com/a/5514
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# IP addresses can change over time. Let's "wrap" this in a function!
get_my_ip() {
    myip="dig +short myip.opendns.com @resolver1.opendns.com"
    echo "${myip}"
}
alias myip=get_my_ip

#Source - http://apple.stackexchange.com/a/118736
#On Mac, copy the current path to the clipboard
# - Changing to pbpath because 'path' is too ambiguous.
alias pbpath='echo | pwd | pbcopy'