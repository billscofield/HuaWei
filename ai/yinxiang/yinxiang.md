## 唤醒词 Porcupines

https://picovoice.ai

1. Accesskey

2. Porcupine Wake Word

3. 下载 模型

4. python 虚拟环境

    python -m pip install pvporcupine
    python -m pip install pyaudio

    ```
    import pvporcupine
    import pyaudio
    import struct

    PORCUPINE_API_KEY = ''

    porcupine = pvporcupine.create(
        access_key = PICOVOICE_API_KEY,
        keyword_paths=['./ppn']
    )

    myaudio = pyaudio.PyAudio()
    stream = myaudio.open(
    input_device_index=0,
    rate = porcupine.sample_rate,
    channels=1,
    input = True,
    frames_per_buffer = porcupine.frame_length
    )

    while True:
        audio_obj = stream.read(porcupine.frame_length, exception_on_overflow=False)
        audio_obj_unpacked = struct.unpack_from("h" * porcupine.frame_length, audio_obj)

        keyword_idx = porcupine.process(audio_obj_unpacked)

        if keyword_idx >=0:
            print("我听到了")
    ```
