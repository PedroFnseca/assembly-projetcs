.model small
.data
  msg1 db "Digite a primeira nota: $"
  msg2 db "Digite a segunda nota: $"
  msg3 db "Digite a terceira nota: $"
  msg4 db "Resultado: $"
  barraene db 0AH, 0DH, "$" ; Nova linha + move cursor para inicio
.code 
  mov ax, @data
  mov ds, ax

  ; Printa a primeira mensagem
  lea dx, msg1
  mov ah, 09h
  int 21h

  ; Le o primeiro valor
  mov ah, 01h
  int 21h

  ; Armazena o primeiro valor
  mov ch, al
  sub ch, "0"

  ; Printa o \n
  lea dx, barraene
  mov ah, 09h
  int 21h

  ; Printa a segunda mensagem
  lea dxm msg2
  mov ah, 09h
  int 21h

  ; le o segundo valor
  mov ah, 01h
  int 21h

  ; Armazena o segundo valor
  mov bh, al
  sub bh, "0"

  ; Realiza a soma dos dois valores coletados
  add bh, ch

  ; Printa a terceira mensagem
  lea dxm msg3
  mov ah, 09h
  int 21h

  ; le o terceiro valor
  mov ah, 01h
  int 21h

  ; Armazena o terceiro valor
  mov bl, al
  sub bl, "0"

  ; Soma os 3 valores coletados
  add bh, bl

  ; Realiza a divisao
  mov ax, 00h
  mov al, bh
  mov cl, 03
  div cl

  ; Armazena o resultado da divisao
  bh, al
  add bh, 30h

  ; Printa o \n
  lea dx, barraene
  mov ah, 09h
  int 21h

  ; Printa a soma dos valores
  lea dx, msg3
  mov ah, 09h
  int 21h

  mov dl, bh
  mov, ah 02h
  int 21h

  mov ah, 4ch
  int 21h
end
