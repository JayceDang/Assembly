.Model Small
.Stack 100
.Code
MAIN Proc
    MOV CL, 4
    ROL BX, CL  ;quay BX di 4bit
    MOV CL, 4
    ROR BH, CL  ;trao 4 bit thap va cao cua BH
    MOV AH, 4CH ;tro ve DOS
MAIN Endp
    END MAIN