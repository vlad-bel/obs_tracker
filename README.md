# obs_tracker

## Review
A prototype of an application that:

- connects to the Obs stream,
- takes screenshots, allows you to draw tactical graphics for players,
- shows a replay before / after a few seconds from the screenshot taken.

<img src="assets/preview.gif" alt="Demo" width="320" />

## Install

### Obs studio
1) Install obs studio on your computer
2) In tools -> "websocket server settings", enable "Enable Websocket server"
3) Enter the port, enter the password
4) In obs -> preferences -> output -> recording, set the recording format: mp4
5) In the same menu, turn on ReplyBuffer, set the replay time
6) Set the replay time, for example 60 seconds
7) In obs -> preferences -> stream, connect to a streaming platform such as Twitch
8) Start the stream, activate the reply buffer in the controls menu

### App
1) The application must be on the same LAN as the obs studio host
2) Download the latest current version of the code, main branch
3) In obs_tacker/assets/config/app_config.set the json
   - obsWebSocketUrl - the url and port of the websocket.
      - IOS Simulator/Destop/Web: ws://127.0.0.1:4455
      - Android Emulator : ws://10.0.2.2:4455
      - A real device on the same network with a PC: ws://<local PC IP>:4455
   - obsWebSocketPassowrd - password from obs studio
   - replyBufferDuration - repeat length should be the same as in Obs studio
   - preWindow - duration of recording before screenshot
   - postWindow - duration of recording after screenshot
   
4) Launch project:
   - flutter pub get
   - flutter pub run build_runner build 
   - flutter run

### TODO
- Implement data saving between streams, now
  if the previous stream is closed, the data from it is erased