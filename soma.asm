.model small
.data
  msg1 db "Digite o primeiro numero: $"
  msg2 db "Digite o segundo numero: $"
  msg3 db "Resultado: $"
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

  ; Realiza a soma dos dois valores coletados
  add bh, ch
  sub bh, 30h ; Remove 30 numeros da tabela ascii

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
