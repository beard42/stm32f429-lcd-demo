# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
	../STemWinLibrary522_4x9i/OS/GUI_X.c 

# Each subdirectory must supply rules for building sources it contributes
STemWinLibrary522_4x9i/OS/%.o: ../STemWinLibrary522_4x9i/OS/%.c
	@echo 'Building file: $<'
	arm-none-eabi-gcc -DSTM32F429_439xx -D__VFP_FP__ -DUSE_STDPERIPH_DRIVER -DUSE_STM32F429I_DISCO \
		-I ../base \
		-I ../User_HandsOn \
		-I ../STemWinLibrary522_4x9i/inc \
		-I ../STemWinLibrary522_4x9i/Config \
		-I ../lib \
		-I ../STM32F4xx_StdPeriph_Driver/inc \
		-O0 \
		-ffunction-sections -fdata-sections \
		-Wall -std=gnu99 -Wa,-adhlns="$@.lst" \
		-c -fmessage-length=0 \
		-MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" \
		-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
