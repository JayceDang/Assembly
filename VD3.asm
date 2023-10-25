.Model Small
.Stack 100
.Data
    TBao DB 'Go vao 1 so he hai(max 16 bit,' 
            DB 'CR de thoi):$'
.Code
MAIN proc
    MOV AX, @Data
    MOV DS, AX
    MOV AH, 9  ;hien thi thong bao
    LEA DX, TBao
    INT 21H
    XOR BX, BX; BX chua ket qua, luc dau la 0
    MOV AH, 1 ; ham doc 1 so tu ban phim
TIEP: INT 21H
    CMP AL, 13 ;CR?
    ;JF THOIDOC; dung, thoi doc
    AND AL, 0FH ;khong, doi ma ASCII ra so
    SHL BX, 1 ;dich trai BX 1 bit de lay cho
    OR BL, AL ;chen bit vua doc vao ket qua
    JMP TIEP  ;doc tiep 1 ky tu
THOIDOC: MOV CX, 16 ;CX chua so bit cua BX
    MOV AH, 2 ;ham hien ky tu
    HIEN: XOR DL, DL ;dua bit MSB cua BX sang CF
    ADC DL, 30H; doi gia tri do ra ASCII
    INT 21H ;hien thi 1 bit cua BX
    LOOP HIEN ;lap lai cho den het
    MOV AH, 4CH ;tro ve DOS
MAIN Endp
    END MAIN













