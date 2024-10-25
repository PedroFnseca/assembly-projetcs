.model small
.data
  msg db "Hello World ASM!$"
.code
  ; Prepara o registrador ds para conseguir interagir com a memoria ram
  mov ax, @data
  mov ds, ax

  ; Prepara o DOS para executar a variavel da memoria ram
  lea dx, msg
  mov ah, 09h
  int 21h

  ; Finaliza o Programa com sucesso
  mov ah, 4ch
  int 21h
end
  
