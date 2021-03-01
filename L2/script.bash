# !/bin/bash

## 1
# Просмотр файлов /etc/shadow/, /etc/group и /etc/passwd.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " " 

echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " " 

echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 


## 2
# Регистрация пользователя test1, имеющего домашний каталог
# /home/nouser и являющегося членом групп mail и users.
# Пользователь должен иметь UID = 1777.
groupadd users
useradd -G mail,users -d /home/nouser -u 1777 -m test1

# ... Проверка UID, GID, а также списка групп.
id test1
echo " " 

# Ознакомление с соответствующей записью в /ect/passwd.
echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 

# Изменение UID пользователя test1 на 1001.
usermod -u 1001 test1

# ... Проверка UID, GID, а также списка групп.
id test1
echo " " 

# Проверка изменений соответствующей записи в /ect/passwd.
echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 

# Изучение соответствующей записи в /ect/shadow.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " "

# Установка для данного пользователя пароля.
passwd test1

# Изучение изменений в /ect/shadow.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " " 


## 3
# Создание учетной записи для пользователя test2 с настройками
# по умолчанию.
useradd test2

# ... Проверка UID, GID, а также списка групп.
id test2
echo " " 

# Проверка, создан ли домашний каталог пользователя.
ls /home/
echo " " 

# Изменение имени созданного пользователя с test2 на test3.
usermod --login test3 test2

# Изучение /etc/group.

echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " " 

# Удаление пользователя test3.
userdel -r test3

# Изучение /etc/group.

echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " "


## 4
# Установка даты устаревания пароля для пользователя test1 на 
# 31 декабря 2010 года.
# Примечание: указание неактуальной даты приводит к ошибке, поэтому
# указан 2021 год.
chage -d "2021-12-31" test1 
chage -M 366 test1

# Проверка изменений с помощью команды chage.
chage --list test1

# Блокировка учетной записи пользователя test1.
usermod -L test1

# Проверка изменений в /etc/shadow.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " "


## 5
# Создание группы пользователей xusers с GUI = 1010.
groupadd -g 1010 xusers


## 6
# Регистрация своей учетной записи в качестве участника
# группы xusers.
usermod -a -G xusers $USER

# Ознакомление с соответствующей записью в /ect/group.
echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " "


## 7
# Изменение имени группы xusers на yusers.
groupmod -n yusers xusers

# Проверка изменений в /etc/group.
echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " "


## 8
# Удаление всех созданных учетных записей и групп пользователей
gpasswd -d $USER yusers
userdel -r test1
groupdel test2
groupdel yusers