import serial
import time
commands = [
    "VSET:12.000",
    "ISET:0.600",
    "OUT:1",
]

with serial.Serial("/dev/ttyACM0", 115200, timeout=0.5) as psu:
    for command in commands:
        print("Sende:", command)
        psu.write((command + "\n").encode("ascii"))
        psu.flush()
        time.sleep(0.2)
with serial.Serial(
    "/dev/ttyACM0",
    baudrate=115200,
    bytesize=8,
    parity=serial.PARITY_NONE,
    stopbits=1,
    timeout=0.5
) as psu:

    for command in ["*IDN?", "VSET?", "ISET?", "VOUT?", "IOUT?", "OUT?"]:
        psu.reset_input_buffer()
        psu.write((command + "\n").encode("ascii"))
        psu.flush()
        time.sleep(0.2)
        response = psu.read(512)
        print(f"{command:6} -> {response!r}")