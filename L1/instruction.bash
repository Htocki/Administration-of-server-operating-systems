# !/bin/bash


# Этот сценарий является лишь ИНСТРУКЦИЕЙ по выполнению, запускать его не следует.


## 1
# Переход в домашний каталог
cd ~
# Вывод содержимого активного каталога на экран
ls
# Вывод содержимого в один столбец
ls -l
# Вывод содержимого с информацией о типах файлов
ls -F
# Вывод содержимого с информацией о владельцах и правах доступа
ls -l
# Вывод содержимого с применением сортировки по суффиксам имен файлов
ls -l -X
# Вывод содержимого с применением сортировки по размерам файлов
ls -l -S
# Вывод содержимого с применением сортировки по дате и времени
ls -l -t
# Отображение списка скрытих файлов и информации о правах доступа
ls -a -l


## 2
# Создание подкаталога домашего каталого /home/<Фамилия>/lab_2
mkdir "Zadierniuk" && mkdir "Zadierniuk/lab_2"
# Проверка
ls
ls "Zadierniuk"
# Создание текстового файла с именем text1.txt
touch "text1.txt"
# Проверка
ls
cat "text1.txt"
# Добавление в созданный файл произвольного текста (с использованием команды nano)
nano "text1.txt"
# Проверка
cat "text1.txt"
# Сохранение созданного файла в вышеназванном каталоге
mv text1.txt "Zadierniuk/lab_2"
# Проверка
ls
# Переход в созданный каталог
cd "Zadierniuk/lab_2"
# Провека
ls


## 3
# Создание текстового файла с именем text2.txt
touch "text2.txt"
# Проверка
ls
# Добавление в файл text2.txt произвольного текста с использованием перенаправления
# выходного потока
echo "text2.txt ololo" > "text2.txt"
# Проверка
cat "text2.txt"
# Выполнение конкатенации файлов text1.txt и text2.txt с записью результата в файл
# text3.txt
cat "text1.txt" "text2.txt" > "text3.txt"
# Выполнение постраничного вывода получившегося файла
less "text3.txt"
# Создание дополнительных текстовых файлов с именами text[4-15].txt
touch "text4.txt"
touch "text5.txt"
touch "text6.txt"
touch "text7.txt"
touch "text8.txt"
touch "text9.txt"
touch "text10.txt"
touch "text11.txt"
touch "text12.txt"
touch "text13.txt"
touch "text14.txt"
touch "text15.txt"
# Проверка
ls


## 4
# Создание подкаталога с именем plab_2
mkdir "plab_2"
# Проверка
ls
# Cоздание в подкаталоге plab_2 файла с именем text4.txt
touch "plab_2/text4.txt"
# Проверка
ls "plab_2"
# Переименование файла text4.txt в text9.txt
mv "plab_2/text4.txt" "plab_2/text9.txt"
# Проверка
ls "plab_2"
# Выполните копирование текстовых файлов с именами text[1-8].txt из дирректории
# lab_2 в дирректорию plab_2
cp "text1.txt" "plab_2"
cp "text2.txt" "plab_2"
cp "text3.txt" "plab_2"
cp "text4.txt" "plab_2"
cp "text5.txt" "plab_2"
cp "text6.txt" "plab_2"
cp "text7.txt" "plab_2"
cp "text8.txt" "plab_2"
# Проверка
ls


## 5
# Cмена текущего каталога на каталог plab_2
cd plab_2
# Проверка
ls
# Переименование файлов:
#   text[1-3].txt в text[16-18].doc
#   text[4-6].txt в text[19-21].abc
#   text[7-9].txt в text[22-24].zed
mv "text1.txt" "text16.doc"
mv "text2.txt" "text17.doc"
mv "text3.txt" "text18.doc"
mv "text4.txt" "text19.abc"
mv "text5.txt" "text20.abc"
mv "text6.txt" "text21.abc"
mv "text7.txt" "text22.zed"
mv "text8.txt" "text23.zed"
mv "text9.txt" "text24.zed"
# Проверка
ls
# Перемещение получившегося набора файлов text[16-24].* в каталог ..
mv *.doc ".." 
mv *.abc ".."
mv *.zed ".."
# Проверка
ls
ls ..
# Возврат к предыдущему активному каталогу
cd ..


## 6
# Дозапись в файл text1.txt текущей даты и времени
date >> "text1.txt"
# Проверка
cat "text1.txt"
# Дозапись в файл text1.txt ФИО студента, сдающего текущую лабораторную работу
echo "Zadierniuk V.A." >> "text1.txt"
# Проверка
cat "text1.txt"


## 7
# Произведение сжатия и архивации всех файлов в директории ~/<Фамилия>/lab_2
# с помощью команды zip созданием файла texts.zip с уровнем сжатия 9, с заданием
# пароля
zip -9 -e texts.zip *
# Проверка
ls
# Удаление исходных файлов
rm *.txt
rm *.doc
rm *.abc
rm *.zed
# Проверка
ls
# Разархивация texts.zip
unzip texts.zip
# Проверка
ls
# Удаление каталога plab_2
rmdir "plab_2"
# Проверка
ls
# Удаление каталога lab_2
cd .. && rm -r lab_2
# Проверка
ls
