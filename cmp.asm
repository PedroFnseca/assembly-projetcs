.model smalll
.data
  msg1 "Digite o primeiro numero: $"
  msg2 "Digite o segundo numero: $"
  msg3 "O maior numero eh: $"
  barraene db 0AH, 0DH, "$"
.code
  printStr macro str
    lea dx, str
    mov ah, 09h
    int 21h
  endm

  printChr macro chr
    mov dl, chr
    mov ah, 02h
    int 21h
  endm

  read macro reg
    mov ah, 01h
    int 21h
    mov reg, al
    sub reg, "0"
  endm

  mov ax, @data
  mov ds, ax

  printStr msg1
  read ch
  printStr barraene
  
  printStr msg2
  read bh
  printStr barraene

  cpm bh, ch
  jl primeiro_maior ; Se o primeiro for maior pule para 
  ja segundo_maior ; se o primeiro for menor pule para

  primeiro_maior:
    printStr msg3
    printChr ch
    jpm fim

  segundo_maior:
    printStr msg3
    printChr bh
    jpm fim

  fim: 
    mov ah, 4ch
    int 21h
end
