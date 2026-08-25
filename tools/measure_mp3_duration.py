from pathlib import Path
import sys

BITRATES = {
    1: {
        1: [0, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 0],
        2: [0, 32, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 0],
        3: [0, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 0],
    },
    2: {
        1: [0, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 176, 192, 224, 256, 0],
        2: [0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 0],
        3: [0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 0],
    },
}
RATES = {
    0: [44100, 48000, 32000, 0],
    2: [22050, 24000, 16000, 0],
    3: [11025, 12000, 8000, 0],
}
SAMPLES = {
    (1, 1): 384,
    (1, 2): 1152,
    (1, 3): 1152,
    (2, 1): 384,
    (2, 2): 1152,
    (2, 3): 576,
    (3, 1): 384,
    (3, 2): 1152,
    (3, 3): 576,
}
VERSIONS = {3: 1, 2: 2, 0: 3}
LAYERS = {3: 1, 2: 2, 1: 3}


def skip_id3(data):
    if data[:3] != b"ID3":
        return 0
    return 10 + sum((data[6 + i] & 0x7F) << (21 - 7 * i) for i in range(4))


def duration(path):
    data = Path(path).read_bytes()
    i = skip_id3(data)
    total = 0.0
    frames = 0

    while i + 4 <= len(data):
        if data[i] != 0xFF or (data[i + 1] & 0xE0) != 0xE0:
            i += 1
            continue

        header = int.from_bytes(data[i : i + 4], "big")
        version_bits = (header >> 19) & 3
        layer_bits = (header >> 17) & 3
        bitrate_index = (header >> 12) & 15
        rate_index = (header >> 10) & 3
        padding = (header >> 9) & 1

        if version_bits == 1 or layer_bits == 0 or bitrate_index in (0, 15) or rate_index == 3:
            i += 1
            continue

        version = VERSIONS[version_bits]
        layer = LAYERS[layer_bits]
        bitrate = BITRATES[1 if version == 1 else 2][layer][bitrate_index] * 1000
        sample_rate = RATES[version_bits][rate_index]
        samples = SAMPLES[(version, layer)]

        if layer == 1:
            frame_length = int((12 * bitrate / sample_rate + padding) * 4)
        else:
            frame_length = int((144 * bitrate / sample_rate + padding) if version == 1 else (72 * bitrate / sample_rate + padding))

        if frame_length <= 0:
            i += 1
            continue

        total += samples / sample_rate
        frames += 1
        i += frame_length

    return total, frames


def main():
    total = 0.0
    for arg in sys.argv[1:]:
        seconds, frames = duration(arg)
        total += seconds
        print(f"{Path(arg).name}: {seconds:.3f}s ({frames} frames)")
    print(f"TOTAL: {total:.3f}s")


if __name__ == "__main__":
    main()
