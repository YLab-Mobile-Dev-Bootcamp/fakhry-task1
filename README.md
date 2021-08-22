# Movie App

App that show lists of top rated and populars movies from [TheMovieDB API](https://developers.themoviedb.org/3).

## Branch Structure

[master : starter project (task1)](https://github.com/YLab-Mobile-Dev-Bootcamp/fakhry-tasks/tree/master)\
[└─task2-widget-and-styling](https://github.com/YLab-Mobile-Dev-Bootcamp/fakhry-tasks/tree/task2-widget-and-styling)\
&nbsp;&nbsp;&nbsp;&nbsp;[└─task3-state-management-and-navigation](https://github.com/YLab-Mobile-Dev-Bootcamp/fakhry-tasks/tree/task3-state-mangement-and-navigation)\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[└─task4-networking](https://github.com/YLab-Mobile-Dev-Bootcamp/fakhry-tasks/tree/task4-networking)\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[└─task5-responsive-and-advance-ui](https://github.com/YLab-Mobile-Dev-Bootcamp/fakhry-tasks/tree/task5-responsive-and-advance-ui)

## Demo Task 3
<img src="https://cdn.discordapp.com/attachments/791866991995650081/875855177033347082/task3.gif" height=400> 


## Note untuk Pertemuan 3

- State = data yang dapat berubah2 atau bisa juga disebut lifecycle
- State Management = rules untuk me-mange sebuah state
- kalau di android, mungkin state management ini mirip2 sama Rx atau Flow.

### Jenis - jenis state management

1. SetState = state management paling sederhana
2. Provider = state management paling di rekomendasikan
3. Redux = state management yang sering digunakan untuk web
4. Bloc/RX = state management yang reactive dan di rekomendasikan oleh Google Developers


## BLoC State Mangement

### BLoC Pattern for Flutter

<img src="https://miro.medium.com/max/1044/1*MqYPYKdNBiID0mZ-zyE-mA.png" width=400>

### Instalasi bloc

1. Add dependencies at `pubspec.yaml`
2. Untuk VSCode user, bisa install extension `bloc` untuk mempermudah penulisan 'boilerplate' :)


### BLoC State

- State Initial
- State Success
- State Loading
- State Error


### BLoC Evenet

- Biasanya digunakan unutk declare interaksi dari usernya (onClick, onPressed, dll).


### BLoC Logic

- kelas tempat menuliskan business logic aplikasi.


## Introduction To Routing

- Routing merupakan navigasi yang umum digunakan di Flutter
- Sistemanya adalah first in first out

### Navigasi Two Route

- Sebelum dapat mengimplementasikan routing, kita perlu membuat 2 route/pages sederhana terlebih dahulu
- Untuk Nnavigasi ke rotue atau page baru, kita bisa mnenggunakan `navigator.push()`
- Untuk kembali, kita menggunakan `navigator.pop()`

### Tools untuk mempermudah routing di Flutter

 - getx 


 ## Task
 - Lanjutkan project kemarin
 - Bikin minimal 2 page dengan implementasi BLoC
 - Terdapat routing untuk pindah antar screen
