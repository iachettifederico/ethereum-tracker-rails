echo "*** environment loaded from ${funcfiletrace[1]%:*} via ${funcfiletrace[0]%:*}"

alias rs="ls **/* | entr -c -r bundle exec rackup -o 0.0.0.0"
alias be="bundle exec"

export PATH=/workspace/bin:$PATH
