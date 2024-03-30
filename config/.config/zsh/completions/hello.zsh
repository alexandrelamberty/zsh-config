
#compdef hello

function _hello {
    local line

    _arguments -C \
        "-h[use 'loudly' or 'quietly' options]" \
        "--h[use 'loudly' or 'quietly' options]" \
        "1:my message:(quietly loudly)" \
        "2:my message:(boo foo)" \
        "*::arg:->args"

    case $line[1] in
        loudly)
            _hello_loudly
        ;;
        quietly)
            _hello_quietly
        ;;
    esac
}

function _hello_quietly {
    _arguments \
        "--silent[Dont output anything]"
}

function _hello_loudly {
    _arguments \
        "--repeat=[Repat the <message> any number of times]"
}