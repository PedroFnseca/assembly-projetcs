.model small
.data
  msg db "Digite um caractere: $"
.code
  ; Carrega a memoria ram no registrador
  mov ax, @data
  mov ds, ax

  ; Execita o print do valor da memoria ram 
  lea dx, msg
  mov ah, 09h
  int 21h

  ; Coleta o char do usuario
  mov ah, 01h
  int 21h

  ; Pega o valor que veio do input e print
  mov dl, al
  mov ah, 02h
  int 21h

  mov ah, 4ch
  int 21h
end
