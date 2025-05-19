#include "stm8s.h"

// ����ʱ����
void delay(uint32_t nCount)
{
    while(nCount--);
}

void main(void)
{
    // 1. �����ڲ�����������HSI��
    CLK_HSICmd(ENABLE);
    while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);

    // 2. ��λGPIOB���ã�ȷ�����мĴ����ָ�Ĭ��״̬
    GPIO_DeInit(GPIOB);

    // 3. ��PB6����Ϊ�������������ģʽ
    // ����LED������PB6�������ӵ�
    GPIO_Init(GPIOB, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);

    // 4. ��ѭ���������л�PB6��ƽ��ʵ��LED��˸
    while (1)
    {
        GPIO_WriteReverse(GPIOB, GPIO_PIN_6); // �л�PB6״̬���߱�ͣ��ͱ�ߣ�
        delay(50000); // ����ʱ����ֵ�ɸ���ʵ���������
    }
}
