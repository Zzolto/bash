#!/bin/bash

# Проверка на наличие одного аргумента
if [ "$#" -ne 1 ]; then
    echo "Ошибка: Необходимо передать одно число в качестве аргумента."
    exit 1
fi

number=$1

if ! [[ "$number" =~ ^[0-9]+$ ]] || [ "$number" -le 0 ]; then
    echo "Ошибка: Аргумент должен быть положительным числом."
    exit 1
fi

half=$((number / 2))

mult=1
sum=0


for i in $(seq 1 $half); do
    mult=$((mult * i))
done

start_sum=$((half + 1))
if [ $((number % 2)) -ne 0 ]; then
    start_sum=$((half + 2))
fi

for i in $(seq $start_sum $number); do
    sum=$((sum + i))
done

echo "mult: $mult"
echo "sum: $sum"
