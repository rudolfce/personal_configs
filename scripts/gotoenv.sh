gotoenv()
{
    [ ! -z $VIRTUAL_ENV ] &&
        cd ${VIRTUAL_ENV}/.. ||
        echo "No venv"
}
