if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <word>"
    exit 1
fi

FILENAME=$1
WORD=$2

if [ ! -f "$FILENAME" ]; then
    echo "File not found!"
    exit 1
fi

COUNT=$(grep -o -i "\b$WORD\b" "$FILENAME" | wc -l)
echo "The word '$WORD' appears $COUNT times in $FILENAME."
