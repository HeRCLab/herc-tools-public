#!/bin/sh

cd "$(dirname "$0")/.."

SHELLDOC_URL='https://raw.githubusercontent.com/charlesdaniels/shelldoc/master/shelldoc'

if [ ! -x "$(which shelldoc)" ] ; then
	curl -LSs "$SHELLDOC_URL" -o ./shelldoc
	chmod +x shelldoc
	SHELLDOC_CMD="./shelldoc"
else
	SHELLDOC_CMD="$(which shelldoc)"
fi

mkdir -p ./doc/source/script

for f in bin/* ; do
	"$SHELLDOC_CMD" --titledepth 0 --input "$f" --prefix "./doc/source/script"
done

rm -f "./shelldoc"
