.Model Small
.Stack
.Code
MAIN proc
    MOV CL,4
    ROL BX,CL   ;quay BX di 4 bit
    MOV CL,4
    ROR BH,CL   ;trao 4 bit thap va cao cua BH
    MOV AH,4CH  ;tro ve DOS
    INT 21H
MAIN endp
    END MAIN