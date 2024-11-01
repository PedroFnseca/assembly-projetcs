.model smalll
.data
  msg "Mensagem$"
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

  printStr barraene

  printStr msg

  read ch

  printChr ch

  mov ah, 4ch
  int 21h
end
