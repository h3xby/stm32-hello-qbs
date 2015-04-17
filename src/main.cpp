#include <stm32f4_discovery.h>

int main()
{
    BSP_LED_Init(LED3);
    while(true){
        HAL_Delay(1000000);
        BSP_LED_Toggle(LED3);
    }
    return 0;
}

