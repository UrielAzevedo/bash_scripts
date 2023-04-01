#! /bin/sh


volume=$(amixer sget Master | grep Left)
volume=${volume%%]*}
volume=${volume##*[}

echo ${volume}
