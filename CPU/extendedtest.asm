# Attention: Mars, Settings -> Memory Configuration -> Compact, Data at address 0
# lui ori subu addu add sub nor or and slt stlu addi
# sll srl sra sllv srlv srav
# sw sh sb
# lw lh lhu lb lbu
#                                                                                     addr
lui   $3, 0x9876        # $3=0x98760000                               # 3c039876       0
ori   $2, $0, 0x1234    # $2=0x1234                                   # 34021234       4
subu  $8, $3, $2        # $8=0x98760000-0x1234=0x9875edcc             # 00624023       8
xor   $9, $8, $3        # $9=0x9875edcc^0x98760000=0x0003edcc         # 01034826       c
addu  $10,$9, $8        # $10=0x0003edcc+0x9875edcc=0x9879db98        # 01285021       10
add   $10, $10, $2      # $10=0x9879db98+0x1234=0x9879edcc            # 01425020       14
sub   $11, $10, $3      # $11=0x9879edcc-0x98760000=0x0003edcc        # 01435822       18
nor   $12, $11, $10     # $12=~(0x0003edcc|0x9879edcc)=0x67841233     # 016a6027       1c
or    $13, $11, $10     # $13=0x0003edcc|0x9879edcc=0x987bedcc        # 016a6825       20
and   $14, $11, $10     # $14=0x0003edcc&0x9879edcc=0x0001edcc        # 016a7024       24
slt   $19, $13, $12     # $19=(0x987bedcc<0x67841233)=1               # 01ac982a       28
sltu  $20, $13, $12     # $20=(0x987bedcc<0x67841233)=0               # 01aca02b       2c
sll   $8, $8, 3         # $8=0x9875edcc<<3=0xc3af6e60                 # 000840c0       30
srl   $9, $8, 0x10      # $9=0xc3af6e60>>16=0xc3af                    # 00084c02       34
sra   $10, $8, 0x1d     # $10=0xc3af6e60>>>29=0xfffffffe              # 00085743       38
ori   $11, $0, 0x3410   # $11=0x3410                                  # 340b3410       3c
sllv  $12, $8, $11      # $12=0xc3af6e60<<16=0x6e600000               # 01686004       40
srlv  $13, $8, $11      # $13=0xc3af6e60>>16=0xc3af                   # 01686806       44
srav  $14, $8, $11      # $14=0xc3af6e60>>>16=0xffffc3af              # 01687007       48
addu  $4, $2, $3        # $4=0x1234+0x98760000=0x98761234             # 00432021       4c
addi  $29, $0, 0x0      # $29=0                                       # 201d0000       50
sw    $4, 0x00($29)     # [0]=0x98761234                              # afa40000       54
sw    $4, 0x04($29)     # [4]=0x98761234                              # afa40004       58
sw    $4, 0x08($29)     # [8]=0x98761234                              # afa40008       5c
sh    $8, 0x04($29)     # [4]=0x98766e60 $8=0xc3af6e60                # a7a80004  little endian       60
sh    $9, 0x0a($29)     # [8]=0xc3af1234 $9=0xc3af                    # a7a9000a  little endian       64
sb    $10, 0x07($29)    # [4]=0xfe766e60 $10=0xfffffffe               # a3aa0007  little endian       68
sb    $8, 0x09($29)     # [8]=0xc3af6034 $8=0xc3af6e60                # a3a80009  little endian       6c
sb    $9, 0x08($29)     # [8]=0xc3af60af $9=0xc3af                    # a3a90008  little endian       70
lw    $8, 0x00($29)     # $8=0x98761234                               # 8fa80000       74 
sw    $8, 0x0c($29)     # [0xc]=0x98761234                            # afa8000c       78
lh    $9, 0x02($29)     # $9=0xffff9876 [0]=0x98761234                # 87a90002  little endian, sign extension       7c
sw    $9, 0x10($29)     # [0x10]=0xffff9876                           # afa90010       80
lhu   $9, 0x02($29)     # $9=0x00009876 [0]=0x98761234                # 97a90002  little endian, zero extension       84
sw    $9, 0x14($29)     # [0x14]=0x00009876                           # afa90014       88
lb    $10, 0x03($29)    # $10=0xffffff98  [0]=0x98761234              # 83aa0003  little endian, sign extension       8c
sw    $10, 0x18($29)    # [0x18]=0xffffff98                           # afaa0018       90
lbu   $10, 0x03($29)    # $10=0x00000098 [0]=0x98761234               # 93aa0003  little endian, zero extension       94
sw    $10, 0x1c($29)    # [0x1c]=0x00000098                           # afaa001c       98
lbu   $10, 0x01($29)    # $10=0x00000012 [0]=0x98761234               # 93aa0001  little endian, zero extension       9c
sw    $10, 0x20($29)    # [0x20]=0x00000012                           # afaa0020       a0


# $0=0              $1=0              $2=0x00001234     $3=0x98760000
# $4=0x98761234     $5=0              $6=0              $7=0
# $8=0x98761234     $9=0x00009876     $10=0x00000012    $11=0x00003410
# $12=0x6e600000    $13=0x0000c3af    $14=0xffffc3af    $19=0x0000001
# $29=0
# [0]=0x98761234    [4]=0xfe766e60    [8]=0xc3af60af    [0xc]=0x98761234
# [0x10]=0xffff9876 [0x14]=0x00009876 [0x18]=0xffffff98 [0x1c]=0x00000098
# [0x20]=0x00000012
