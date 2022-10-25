#  Лабораторна робота №3.
## Docker
## Грига Михайло Михайлович <br> ІПЗ1.1
## План:
1) Використання готових Docker Images.
2) Використання Docker Compose.
3) Створення HTML сторінки та занесення її в Docker Image. Залити даний Docker Image на Docker Hub.
4) Скачати Docker Image когось із групи і розвернути в себе контейнер з HTML сторінкою на порті 8086 ззовні.
### 1. Використання готових Docker Images.Ознайомитись із готовими Docker Images які знаходяться на Docker Hub. Використати образ wordpress та розвернути сайт із безкоштовною темою.
>Після ознайомлення із готовими Docker Images із Docker Hub, я встановив собі образ wordpress за допомогою команди:
```
    docker pull wordpress
```
> Після цього створив файл з розширенням yml для wordpress, куди вставив текст, який взяв з https://hub.docker.com/_/wordpress:

![images1](screenshot/img_lab3(1).png)

>Підняв wordpress за допомогою команди
```
    docker compose up -d
```
>Прописавши в пошуку браузера localhost:8080, я зареєструвався на wordpress знайшов і використав безкоштовну тему:

![images1](screenshot/img_lab3(2).jpg)

### 2. Використання Docker Compose. Описати теоретично що таке Docker Compose, чому саме розширення .yml а також навести переваги та недоліки його використання. Навести приклад створення та збирання образа за допомогою Docker Compose.
> Docker-compose — це надбудова над докером, програма написана на Python, яка дозволяє запускати безліч контейнерів одночасно і маршрутизувати потоки даних між ними.
Для кожного проекту Docker створює свою мережу, де контейнери можуть звертатися один до одного за іменами, які ми зазначимо у docker-compose.yml. Усі налаштування запуску кластера контейнерів знаходяться в тому ж файлі, що знаходиться в кореневій директорії проекту.

> YAML — це гнучкий, зрозумілий людині формат файлу, який ідеально підходить для зберігання дерев об’єктів. YAML розшифровується як «YAML не є мовою розмітки». Його легше читати (людям), ніж JSON, і він може містити багатші метадані. Це набагато краще, ніж XML.
### Переваги YAML:
1. Зрозумілий людині код;
2. Мінімалістичний синтаксис;
3. Заточений під роботу із даними;
4. Вбудований стиль, схожий на JSON (YAML є його надмножиною);
5. Надає більше можливостей, ніж JSON для створення складних структур даних. Це суворе надмножина JSON, і тому всі допустимі документи JSON також є допустимими документами YAML;
6. YAML лаконічніше JSON та XML;
7. Додаткові можливості (розширювані типи даних, відносні якорі та мапінг типів із збереженням порядку ключів).
### Недоліки:
1. Навіть якщо ви не зіставите одну прогалину при відступі, ваш код може перестати працювати
2. Частина документа YAML часто є дійсним документом, тому якщо документ YAML неповний, немає автоматичного способу виявити його.
3. Файли YAML важко редагувати, і ця складність швидко зростає зі збільшенням розміру файлу.
4. YAML може здатися "простим" і "очевидним" при погляді на базовий приклад, але виявляється, що це не так. Специфікація YAML складає 23449 слів; для порівняння, TOML - 3339 слів, JSON - 1969 слів, а XML - 20603 слова.

### 3. Створення HTML сторінки та занесення її в Docker Image.
### - Створити HTML сторінку із вашим ПІБ, групою та № Л.Р..
### - Створити Docker Image із цією сторінкою.
### - Реалізувати можливість запуску цієї сторінки з контейнера (потрібно sudo usermod -aG docker username сервер NGINX до прикладу). 
### - Перевірити на працездатність контейнера на основі вашого образу. 
### - Залити готовий образ на Docker Hub.
> Спочатку я створив html сторінку та заніс туди свої дані, а також Dockerfile в який прописав:
```
    FROM nginx:alpine
    COPY . /usr/share/nginx/html
```
> Після цього створив образ lab3 і розвернув його на порті 8080 за допомогою команд:
```
    docker build -t lab3 .
    docker run -d -p 80:80 lab3
```

![images1](screenshot/img_lab3(3).png)

>Далі, я створив пустий репозиторій на docker hub і запушив туди свій образ.
Для цього використав команду:
```
    docker push wair/lab3
```

![images1](screenshot/img_lab3(4).png)

https://hub.docker.com/repository/docker/wair/lab3
### 4. Скачати Docker Image когось із групи і розвернути в себе контейнер з HTML сторінкою на порті 8086 ззовні.
> Я взяв Docker Image Липчей Владислава(https://hub.docker.com/r/vladlipchey/labwork) з Docker hub і за допомогою команди docker pull зтянув його до себе.
```
    docker pull vladlipchey/labwork
```

![images1](screenshot/img_lab3(5).png)

> Після цього я запустив його на порті 8086 за допомогою команди:
```
    docker run -d -p 8086:80  vladlipchey/labwork
```

![images1](screenshot/img_lab3(6).png)

