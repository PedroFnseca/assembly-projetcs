.model small
.data
  msg db "Digite um caractere: $"
.code
  mov ax, @data
  mov ds, ax

  lea dx, msg
  mov aa, 09h
  int 21h

  mov ah, 01h
  int 21h

  mov dl, al
  mov ah, 02h
  int 21h

  mov ah, 4ch
  int 21h
end
