main () {
  # $1 will hold the name, if any.  Default to "you"
  NAME="${1:-"you"}"
  echo "One for $NAME, one for me."
}

main "$@"
