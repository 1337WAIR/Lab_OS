#  Лабораторна робота №4.
## Грига Михайло Михайлович <br> ІПЗ1.1
## Terraform
### План

![images1](screenshot/scr0.png)

### Спочатку я зареєструвався в google cloud. Після налаштувань облікового запису я створив запис для служб.

![images1](screenshot/scr1.png)

### Вибрав роль project owner.

![images1](screenshot/scr2.png)

### Після цього я створив ключ в форматі json.

![images1](screenshot/scr3.png)

### Перейшовши у вкладку з образами віртуальних машин, запустив computing engines.

![images1](screenshot/scr4.png)

### Тепер все було підготовлене до створення проекту. Для початку я створив папку куди переніс ключ, також добавив файл з розширенням .tf. В цьому файлі я прописав назву ключа, id проекту, створив 2 ресурси і підключив АРІ googlecompute i cloudresourcemanager, а також прописав порти.

![images1](screenshot/scr5.png)

### Також, я вказав тип віртуальної машини та прописав скрипт. За допомогою скрипту я встановлюю Apache Server та в індексу сторінку переніс свої данні.

![images1](screenshot/scr6.png)

### Тепер я проініціалізував проект.
```
    terraform init
```

![images1](screenshot/scr7.png)

### Запустив його.
```
    terraform apply
```

![images1](screenshot/scr8.png)
![images1](screenshot/scr9.png)

### Перейшовши по ip бачу результат.

![images1](screenshot/scr10.png)
