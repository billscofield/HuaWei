## chatglm-6b

1. https://huggingface.co/THUDM/chatglm-6b

    git clone https://huggingface.co/THUDM/chatglm-6b

2. https://github.com/THUDM/ChatGLM-6B.git

    git clone https://github.com/THUDM/ChatGLM-6B.git

    python -m pip install -r requirements.txt --target=/backup/ai/tsinghua/THUDM/packages -i https://pypi.tuna.tsinghua.edu.cn/simple

    // 首先 pip 包会 Stored in directory: /root/.cache/pip/wheels/... , 之后会安装到指定路径
    // 有 4.7G

    python web_demo.py --model-path /backup/ai/tsinghua/THUDM/chatglm-6b --listen --port 8898 --precision fp16

    Explicitly passing a `revision` is encouraged when loading a model with custom code to ensure no malicious code has been contributed in a newer revision.
    Explicitly passing a `revision` is encouraged when loading a configuration with custom code to ensure no malicious code has been contributed in a newer revision.

    ValueError: When localhost is not accessible, a shareable link must be created. Please set share=True or check your proxy settings to allow access to localhost.

    Loading checkpoint shards:

    Expecting value: line 1 column 1 (char 0)

