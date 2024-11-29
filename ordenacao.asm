.model small
.data
    array db "043112$"
    barraene db 0AH, 0DH, "$" 
.code
    printStr macro str
        lea dx, str
        mov ah, 09h
        int 21h 
    endm
         
    mov ax, @data
    mov ds, ax
    
    mov si, 0
    
    printStr array
    printStr barraene
    
    ordenador:
        mov ch, array[si]
        cmp ch, "$"      
        je mandaVerifica
        
        mov cl, array[si + 1]
        cmp cl, "$"
        je mandaVerifica
        
        cmp ch, cl
        ja makeSwap
        
        inc si
        jmp ordenador
        
    mandaOrdenador:
        mov si, 0
        jmp ordenador
        
    mandaVerifica:
        mov si, 0
        jmp verifica
                         
    verifica:                       
        mov ch, array[si]
        cmp ch, "$"
        je fim
        
        mov cl, array[si + 1]
        cmp cl, "$"
        je fim
        
        mov cl, array[si + 1]
        cmp ch, cl
        jg mandaOrdenador
        
        inc si
        jmp verifica
        
        
    makeSwap:     
        mov bh, array[si]
        mov bl, array[si + 1]
        
        mov array[si], bl
        mov array[si + 1], bh
        
        printStr array
        printStr barraene
        
        inc si
        jmp ordenador
            
    
    fim:
        printStr array 
        mov ah, 4ch
        int 21h
