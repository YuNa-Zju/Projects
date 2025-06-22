import serial

def main():
    # 配置串口参数（需与STM8配置一致）
    port_name = "COM3"
    ser = serial.Serial(
        port=port_name,
        baudrate=115200,
        bytesize=serial.EIGHTBITS,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        timeout=1
    )
    try:
        while True:
            # 读取数据
            data = ser.readline()

            if data:
                decoded_data = data.decode('utf-8', errors='replace').strip()
                print(f"[{timestamp}] RX: {decoded_data}")

    except KeyboardInterrupt:
        print("\n程序已终止")
    finally:
        ser.close()
        print("串口连接已关闭")

if __name__ == "__main__":
    main()