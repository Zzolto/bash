#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Использование: $0 --file <путь_к_файлу> --search <строка_для_поиска>"
    exit 1
fi

while [ $# -gt 0 ]; do
    case $1 in
        --file) shift; FILE=$1; shift ;;
        --search) shift; SEARCH=$1; shift ;;
        *) echo "Неизвестный параметр: $1"; exit 1 ;;
    esac
done

if [ ! -f "$FILE" ]; then
    echo "Файл $FILE не найден."
    exit 1
fi

MATCH_COUNT=$(grep -o "$SEARCH" "$FILE" | wc -l)

if [ $MATCH_COUNT -eq 0 ]; then
    echo "Не найдено ни одного совпадения в файле $(realpath $FILE)"
else
    echo "Найдено совпадений: $MATCH_COUNT"
fi