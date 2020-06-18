/*
  Здесь кнопка опрашивается каждые 10 миллисекунд независимо от того, что происходит у вас в коде

  Используется библиотека GyverButton https://github.com/AlexGyver/GyverLibs
*/


#define VIBRO_PIN 9 // порт с ШИМом
#define MODE_AM 5    // количество режимов (от 0 до указанного) `
#define MODE_AM2 5    // количество режимов (от 0 до указанного) `

#include <GyverButton.h>

GButton butt1(7);  // создаём нашу "кнопку 1"
GButton butt2(6);  // создаём нашу "кнопку 2"
byte mode = 0;       // переменная режима
byte mode2 = 0;       // переменная режима
byte i = 0; // режим вибрации

void setup()
{

  // настраиваем пин №13 в режим выхода,
  // т.е. в режим источника напряжения
  pinMode(13, OUTPUT);


  // настраиваем пин со светодиодом в режим выхода,
  // как и раньше
  pinMode(VIBRO_PIN, OUTPUT);

  pinMode (7, INPUT_PULLUP); // 7 порт на вход НЕ надо резистор на 10кОм
  pinMode (6, INPUT_PULLUP); // 7 порт на вход НЕ надо резистор на 10кОм
  Serial.begin(9600); // вывод в COM



}



void loop()
{
  butt1.tick();             // обязательная функция отработки. Должна постоянно опрашиваться
  if (butt1.isHolded()) {    // правильная отработка нажатия с защитой от дребезга
    // увеличиваем переменную номера режима. Если вышла за количество режимов - обнуляем
    if (++mode >= MODE_AM) mode = 0;
  }

  butt2.tick();             // обязательная функция отработки. Должна постоянно опрашиваться
  if (butt2.isHolded()) {    // правильная отработка нажатия с защитой от дребезга
    // увеличиваем переменную номера режима. Если вышла за количество режимов - обнуляем
    if (++mode2 >= MODE_AM2) mode2 = 0;
  }


  // всё переключение в итоге сводится к оператору switch
  switch (mode) {
    case 0: task_0();
      break;
    case 1: task_1();
      break;
    case 2: task_2();
      break;
    case 3: task_3();
      break;
    case 4: task_4();
      break;
  }

  // всё переключение в итоге сводится к оператору switch
  switch (mode2) {
    case 0: task_10();
      break;
    case 1: task_11();
      break;
    case 2: task_12();
      break;
    case 3: task_13();
      break;
    case 4: task_14();
      break;
  }

  /*
    boolean button1 = !digitalRead(7); // кнопка 1 инверсия сигнала
    boolean button2 = !digitalRead(6); // кнопка 2 инверсия сигнала

    if (button1 == 1) digitalWrite(13, 1); // включить встроенный светик
    else digitalWrite(13, 0); // выключить встроенный светик

    Serial.print("Button 1: ");
    Serial.print(button1);
    Serial.print("  Button 2: ");
    Serial.println(button2);
  */


  /*
    // выдаём неполное напряжение на светодиод
    // (он же ШИМ-сигнал, он же PWM-сигнал).
    // Микроконтроллер переводит число от 0 до 255 к напряжению
    // от 0 до 5 В. Например, 85 — это 1/3 от 255,
    // т.е. 1/3 от 5 В, т.е. 1,66 В.
    analogWrite(VIBRO_PIN, 000); // убрано в 0, что бы не мешало
  */



}

// наши задачи, внутри функций понятное дело может быть всё что угодно
//1 кнопка

// вариант на 4 - 64, 128, 191, 255
// вариант на 5 - 51 102 153 204 255

void task_0() {
  Serial.println("Task 0");
  i = 51;
  analogWrite(VIBRO_PIN, i);

}

void task_1()
{
  Serial.println("Task 1");
  i = 102;
  analogWrite(VIBRO_PIN, i);
}

void task_2()
{
  Serial.println("Task 2");
  i = 153;
  analogWrite(VIBRO_PIN, i);
}

void task_3()
{
  Serial.println("Task 3");
  i = 204;
  analogWrite(VIBRO_PIN, i);
}

void task_4()
{
  Serial.println("Task 4");
  i = 255; //255
  analogWrite(VIBRO_PIN, i);
}


//2 кнопка
void task_10()
{
  Serial.print("Task 10  i=");
  Serial.println (i);
  analogWrite(VIBRO_PIN, i);
  delay(100);

  analogWrite(VIBRO_PIN, 0);
  delay(900);
}

void task_11()
{
  Serial.print("Task 11  i=");
  Serial.println (i);

  analogWrite(VIBRO_PIN, i);
  delay(900);

  analogWrite(VIBRO_PIN, 0);
  delay(100);
}

void task_12()
{
  Serial.print("Task 12  i=");
  Serial.println (i);

  analogWrite(VIBRO_PIN, i);
  delay(500);

  analogWrite(VIBRO_PIN, 0);
  delay(500);
}

void task_13()
{
  Serial.print("Task 13  i=");
  Serial.println (i);

  analogWrite(VIBRO_PIN, i);
  delay(200);

  analogWrite(VIBRO_PIN, 0);
  delay(200);
}

void task_14()
{
  Serial.print("Task 14  i=");
  Serial.println (i);

  analogWrite(VIBRO_PIN, i);
  delay(300);

  analogWrite(VIBRO_PIN, 0);
  delay(300);
}
