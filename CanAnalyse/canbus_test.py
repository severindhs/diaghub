import can

def receive_can():
    # Create a bus instance (adjust to your hardware)
    bus = can.interface.Bus(channel='can0', bustype='socketcan')

    print("Listening for CAN messages...")

    while True:
        msg = bus.recv(timeout=1.0)  # seconds
        if msg is None:
            print("No message received.")
        else:
            print(f"ID: {hex(msg.arbitration_id)}, DLC: {msg.dlc}, Data: {msg.data}")

receive_can()