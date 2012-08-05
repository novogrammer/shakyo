# Shakyo

写経する為のプログラムです。

## Installation

    $ gem install shakyo

## Usage

    $ shakyo ./hello.c

## Howto
      #include<stdio.h>

    ->int main(void)
      {
            printf("hello! world!\n");
            return 0;
      }
    ----------------
    ->int main(void)
    > int main(vo
    ./hello.c:3/8 (COMMAND LIST: next prev quit)

* (該当行を入力)[Enter]
  * 次の行へ移ります
* next[Enter]
  * 次の行へ移ります
* prev[Enter]
  * 前の行へ移ります
* quit[Enter]
  * 終了します
* [Up Key][Down Key]
  * 入力履歴にアクセスします
