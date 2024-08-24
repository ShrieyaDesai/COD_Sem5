# Program 1: 
### Statement: Assembly Code for addition of 2 words

### Name of file:
Q1_EC134.s

### Observation - Single Cycle
- 2 numbers of word data type have been assigned to variable a
- The words are loaded into x11, x12 registers respectively 
- Addition Operation performed on x11 and x12; Result stored in x13 as per the 'sw' - store word command
 
### Register Mapping
- **x11:** 0x00012345
- **x12:** 0x00012345
- **x13:** 0x0002468a

### Data Mapping
- **0x10000008:** 0x0002468a
- **0x10000004:** 0x00012345
- **0x10000000:** 0x00012345

# Program 2: 
### Statement: Assembly Code for addition of 2 half_words

### Name of file:
Q2_EC134.s

### Observation - Single Cycle
- 2 numbers of half_word data type have been assigned to variable a
- The half_words are loaded into x11, x12 registers respectively 
- Addition Operation performed on x11 and x12; Result stored in x13 as per the 'sh' - store half_word command
 
### Register Mapping
- **x11:** 0x00000123
- **x12:** 0x00000123
- **x13:** 0x00000246

### Data Mapping
- **0x10000004:** 0x00000246
- **0x10000000:** 0x01230123


# Program 3: 
### Statement: Assembly Code for addition of 2 bytes

### Name of file:
Q3_EC134.s

### Observation - Single Cycle
- 2 numbers of byte data type have been assigned to variable a
- The half_words are loaded into x11, x12 registers respectively 
- Addition Operation performed on x11 and x12; Result stored in x13 as per the 'sb' - store byte command
 
### Register Mapping
- **x11:** 0x00000002
- **x12:** 0x00000003
- **x13:** 0x00000005

### Data Mapping
- **0x10000004:** 0x00000000
- **0x10000000:** 0x00050302


# Program 4: 
### Statement: Assembly Program and analyse the format of storing signed and unsigned words, half words and byte data types

### Name of file:
Q4_EC134.s

### Observation - Single Cycle
- 2 numbers of half_word data type and byte data type have been assigned to variable a and b
- The words are loaded into the registers as follows: x11, x12 for signed half word, byte and x14,x15 for unsigned half words,byte.
- Addition Operation performed on each of them: Presence of 0xfffff80 in x12 registers indicate that it is a negative value.
 
### Register Mapping - Half word
- **x10:** 0x10000000
- **x11:** 0xffff8000
- **x12:** 0x00000001
- **x13:** 0xffff8001
- **x14:** 0x00008000
- **x15:** 0x00000001
- **x16:** 0x00008001


### Data Mapping - Half word
- **0x10000008:** 0x00000000
- **0x10000004:** 0x80018001
- **0x10000000:** 0x00018000


### Register Mapping - Byte
- **x10:** 0x10000000
- **x11:** 0xffffff83
- **x12:** 0x00000012
- **x13:** 0xffffff95
- **x14:** 0x00000083
- **x15:** 0x00000012
- **x16:** 0x00000095


### Data Mapping - Byte
- **0x10000004:** 0x00000095
- **0x10000000:** 0x00951283


