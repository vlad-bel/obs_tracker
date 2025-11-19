# obs_tracker

## Описание
Прототип приложения, которое 
- подключается к Obs стриму,
- делает скриншоты,позволяет рисовать тактическую графику для игроков,
- показывает реплай до/после нескольких секунд от сделанного скриншота .

<img src="assets/preview.gif" alt="Demo" width="320" />

## Установка

### Obs studio
1) Установите obs studio на ваш компьютер
2) В tools -> "websocket server settings" включите "Enable Websocket server"
3) Введите порт, задайте пароль
4) В obs -> preferences -> output -> recording установите recording format: mp4
5) В том же меню включите ReplyBuffer, задайте время реплая
6) Задайте время реплая, например 60 секунд
7) В obs -> preferences -> stream подключитесь к стриминговой платформе, например Twitch
8) Запустите стрим, активируйте reply buffer в меню controls

### Приложение
1) Приложение должно быть в той же локальной сети, что и хост obs studio
2) Скачайте последнюю актуальную версию кода, ветка main
3) В obs_tacker/assets/config/app_config.json задайте 
    - obsWebSocketUrl - урл и порт вебсокета. 
      - IOS Simulator/Destop/Web: ws://127.0.0.1:4455
      - Android Emulator : ws://10.0.2.2:4455
      - Реальное устройство в одной сети с пк: ws://<локальный IP ПК>:4455
    - obsWebSocketPassowrd - пароль из obs studio
    - replyBufferDuration - длина повтора, должна быть такой же как в Obs studio
    - preWindow - длительность записи до скриншота
    - postWindow - длительность записи после скриншота
   
4) Запустите проект:
   - flutter pub get
   - flutter pub run build_runner build 
   - flutter run

### TODO
- Реализовать сохранение данных между стримами, сейчас
если предыдущий стрим закрывается, данные из него стираются




