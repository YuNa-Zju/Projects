#include "stm8s.h"

// 简单延时函数
void delay(uint32_t nCount)
{
    while(nCount--);
}

void main(void)
{
    // 1. 开启内部高速振荡器（HSI）
    CLK_HSICmd(ENABLE);
    while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);

    // 2. 复位GPIOB设置，确保所有寄存器恢复默认状态
    GPIO_DeInit(GPIOB);

    // 3. 将PB6配置为推挽输出，高速模式
    // 假设LED正极接PB6，负极接地
    GPIO_Init(GPIOB, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);

    // 4. 主循环：不断切换PB6电平，实现LED闪烁
    while (1)
    {
        GPIO_WriteReverse(GPIOB, GPIO_PIN_6); // 切换PB6状态（高变低，低变高）
        delay(50000); // 简单延时，数值可根据实际情况调整
    }
}
