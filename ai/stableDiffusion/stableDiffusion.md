# Stable Diffusion

公司: StabilityAI

"Colab"，是 Google Research 团队开发的一款产品。能够经过浏览器编写和实施Python。
能够免费分配运用包括 GPU 在内的核算资源。

1. apt install wget git python3 python3-venv

2. [官网](https://beta.dreamstudio.ai/)

    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

    先在项目目录下创建好虚拟环境
        Python 3.5 后推荐使用 venv 来创建虚拟环境

        ```shell
        不用执行
        python3 -m venv venv
        source <环境名称>/bin/activate
        source <环境名称>/bin/activate
        ```

        Anaconda 虚拟环境
        ```
        conda create -n novelai python==3.10.6
        conda activate novelai
        ```
        bash ./webui-user.sh

3. [去 wiki 下载 Dependencies](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Dependencies)

    The Stable Diffusion model checkpoint, a file with .ckpt extension, needs
    to be downloaded and placed in the models/Stable-diffusion directory.

4. bash ./webui.sh

    127.0.0.1:7860

    To create a public link, set `share=True` in `launch()`.
    webui.py 大概220 行

repository
    BLIP
        https://github.com/salesforce/BLIP.git
    CodeFormer
        https://github.com/sczhou/CodeFormer.git
    k-diffusion
        https://github.com/crowsonkb/k-diffusion.git
    stable-diffusion-stability-ai
        https://github.com/Stability-AI/stablediffusion.git 
    taming-transformers
        https://github.com/CompVis/taming-transformers.git

/home/liujiao/stable-diffusion-webui/models/Codeformer

    codeformer.pth 要放在这个目录下边，这个文件特别难下载

/home/liujiao/stable-diffusion-webui/repositories/CodeFormer/weights/facelib/detection_Resnet50_Final.pth
    https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth

    也很难下载

/home/liujiao/stable-diffusion-webui/repositories/CodeFormer/weights/facelib/parsing_parsenet.pth

    https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/parsing_parsenet.pth

    也很难下载


Stable Diffusion checkpoint
    /home/liujiao/stable-diffusion-webui/models/Stable-diffusion

    chilloutmix_NiPrunedFp32.safetensors 也是大模型

    https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/tree/main
    git clone https://huggingface.co/CompVis/stable-diffusion-v-1-4-original

    https://huggingface.co/stabilityai/stable-diffusion-2-1/tree/main
    git clone https://huggingface.co/stabilityai/stable-diffusion-2-1

    Deforum Stable Diffusion — official extension for AUTOMATIC1111's webui
        https://github.com/deforum-art/deforum-for-automatic1111-webui
        https://github.com/deforum-art/deforum-for-automatic1111-webui.git


## Extensions

    在浏览器中打开相应地址，切换到 Extensions 标签页面的 Install from URL，并输入

    https://github.com/civitai/sd_civitai_extension.git

    Civitai Extension for Automatic 1111 Stable Diffusion Web UI

- Stable-Diffusion-Webui-Prompt-Translator

    需要申请翻译网站的api, 并激活

    安装方法：
    把项目作为zip文件下载，解压后，放到 你的 SD webui 目录下 的 extensions 目录中即可。
    如果 SD webui 已经在运行中，去setting页面，点击右上角的“Reload UI”即可。

    去SD WebUi上叫“Prompt Translator”的标签页。最下面，翻译引擎选百度，把申请的
    APP ID 和  APP Key都填写进去，点击保存，完成。

- sd-webui-additional-networks

    https://github.com/kohya-ss/sd-webui-additional-networks.git

    标签兰：Additional Networks

    使用方法:
    1. txt2img
    2. show extra networks
    3. 

## stable diffusion

1. VAE(Variational Autoencoder)
    [ veərɪˈeɪʃnəl  ] adj. 变化的；因变化而产生的；
    图像编码器/解码器

    编码到 潜在空间

2. U-net
    负责预测噪声，配合 text encoder 工作
    生成图像

    U-Net是弗University of Freiburg(赖堡大学)计算机科学系为生物医学图像分割开发
    的卷积神经网络。

3. text encoder
    负责把文本转换成 embedding

### 名词解释


在 DALL-E 2 和 Imagen 之后，AI绘图领域又一个热乎的深度学习模型出炉——Stable Diffusion

DALL-E 2 

Imagen

Stable Diffusion是一种文本到图像的模型。相对于Disco Diffusion，SD的速度会更快一
些。

这一类文本到图像的算法都是基于CLIP这个文本图像预训练模型的


---

.ckpt 和 .safetensors 后缀名的文件都是用来**保存模型的权重和参数**的，但是有以下区
别：

- .ckpt 文件是用 pickle 序列化的，这意味着它们可能包含恶意代码，如果你不信任模
  型来源，加载 .ckpt 文件可能会危及你的安全。

    Tensorflow模型主要包括两个方面内容：1）神经网络的结构图graph；2）已训练好的
    变量参数。

    因此Tensorflow模型主要包含两个文件：

    - 元数据图（meta graph）

        它保存了tensorflow完整的网络图结构。这个文件以*.meta为拓展名；

    - 检查点文件（checkpoint file）

        这是一个二进制文件，它包含权重变量，biases变量和其他变量。这个文件以
        *.ckpt为拓展名； PS：从 0.11版本之后就不是单单一个 .ckpt文件，除此之外
        还有一个.index文件

- .safetensors 文件是用 numpy 保存的，这意味着它们只包含张量数据，没有任何代码，
  加载 .safetensors 文件更安全和快速。

    安全的，独立于框架的三方权重文件格式

    为了将 .ckpt 文件转换为 .safetensors 文件，你需要先加载 .ckpt 文件中的数据，
    然后用 numpy 保存为 .safetensors 文件。这个过程需要一些额外的步骤和工具。

[diffusers](https://github.com/huggingface/diffusers)

---

Stable Diffusion模型本身建立潜在扩散模型的基础上，并且结合了Dall-E2和Imagen的条
件扩散模型的看法。核心数据在LAION-Aesthetics上训练。

- AIGC
    AI Generated Content 是利用人工智能来创造内容。
    GC的意思是创作内容。 
    PGC，是专业人员用来创作内容
    UGC是用户自己创造内容

- Encoder-Decoder

    Encoder-Decoder（编码-解码）是深度学习中非常常见的一个模型框架

- Embedding

    Embedding（嵌入）是拓扑学里面的词，在深度学习领域经常和Manifold（流形）搭配
    使用。

- Textual Inversion(文本倒置)

- DreamArtist

- finetune

    fine-tune中文译为“微调”，深度学习中需要在深层网络中不断进行训练更新模型的参
    数（权重）拟合能实现预期结果的模型。

    然而在深层次的神经网络中进行训练，由于模型规模大，参数量多，因此会有以下问题：

    1. 计算较为耗时，会占用大量计算资源和时间成本；

    2. 对于较为复杂的任务，比如说对于目标识别任务，目标类别多起来的话，如果
       想提升模型的表现能力，需要大量的数据集。同样以目标识别任务为例子，我
       们需要大量标注的图像数据来对模型进行训练；

    然而还存在一个问题，仍然以目标识别任务为例，假设有一个已经训练好的模型A，其
    任务是识别（猫，狗，人，鸡，鸭，鹅）这6+1（背景）个类别的目标，当我们的需求
    发生变化，需要再增加一类目标“猪”时，如果采用重新训练一个新模型B的方式无疑会
    增加成本，而且造成了资源浪费——A和B的模型需求相似度高，我们为什么不可以利用
    到已经成熟的模型A呢？

    解决以上问题的方案就是fine-tune，微调！比如针对于以上举例，可以采用的一个微
    调策略是保留模型A的前若干层的结构以及它们训练后的权重，然后更改模型最后一层
    的softmax，调整其映射到（猫，狗，人，鸡，鸭，鹅，猪）+背景这八个类别，这样
    就大大减少了训练的时间和计算成本。

    其实还可以这么理解fine-tune：我们的目标是使预测损失最小化，在各个参数展开的
    空间内找到最优的点（或者是靠近最优点的点），如果从开始找，当然比较慢；但是
    从之前已经训练好的其他类似模型开始，就相当于在最优点附近的点开始，自然收敛
    的速度和效果会比从零训练好得多。

- [DreamBooth](https://zh.wikipedia.org/zh-sg/DreamBooth)

    Dreambooth 是一个深度学习模型，用于微调现有的文生图模型

    多于用训练人物

    训练

- native finetune

    dreambooth 衍生，魔改而来

    多于用训练画风

- LoRA

    只训练 nn.Linear 层

- 潜在空间

    潜在空间（latent space）是指在机器学习中使用的一个抽象的、低维的向量空间，**它可
    以捕捉到数据中的主要特征或表示数据的潜在结构**。潜在空间的维度比原始数据的维度要
    低，因此可以压缩和表示原始数据的本质信息，使得数据可以更好地被处理和分析。

    在许多机器学习应用中，使用潜在空间的概念可以将数据转换为一组潜在变量，这些变量
    可以被用作输入或输出，用于表示或生成数据。例如，在自动编码器中，潜在空间是由编
    码器生成的，通过将输入数据压缩成一个低维向量。在生成对抗网络（GAN）中，潜在空间
    是由一个随机噪声向量生成的，它被用来生成具有一定特征的新数据样本。

    总之，潜在空间是机器学习中的一个非常重要的概念，它可以使得数据更加有效地表示和
    处理，并且可以被用来表示或生成数据。

- 先验知识(class prompt)


## AE

自编码器，无监督的特征学习，其目的是利用无标签数据找到一个有效低维的特征提取器。




## 训练方法

text encoder


## 融合

- 整个融合

- 分层融合



## 命令

launch.py [-h]
[--data-dir DATA_DIR] [--config CONFIG] [--ckpt CKPT] [--ckpt-dir CKPT_DIR]
[--vae-dir VAE_DIR] [--gfpgan-dir GFPGAN_DIR] [--gfpgan-model GFPGAN_MODEL]
[--no-half] [--no-half-vae] [--no-progressbar-hiding]
[--max-batch-count MAX_BATCH_COUNT] [--embeddings-dir EMBEDDINGS_DIR]
[--textual-inversion-templates-dir TEXTUAL_INVERSION_TEMPLATES_DIR]
[--hypernetwork-dir HYPERNETWORK_DIR] [--localizations-dir LOCALIZATIONS_DIR]
[--allow-code] [--medvram] [--lowvram] [--lowram] [--always-batch-cond-uncond]
[--unload-gfpgan] [--precision {full,autocast}] [--upcast-sampling] [--share]
[--ngrok NGROK] [--ngrok-region NGROK_REGION]
[--enable-insecure-extension-access]
[--codeformer-models-path CODEFORMER_MODELS_PATH]
[--gfpgan-models-path GFPGAN_MODELS_PATH]
[--esrgan-models-path ESRGAN_MODELS_PATH]
[--bsrgan-models-path BSRGAN_MODELS_PATH]
[--realesrgan-models-path REALESRGAN_MODELS_PATH]
[--clip-models-path CLIP_MODELS_PATH] [--xformers] [--force-enable-xformers]
[--xformers-flash-attention] [--deepdanbooru] [--opt-split-attention]
[--opt-sub-quad-attention] [--sub-quad-q-chunk-size SUB_QUAD_Q_CHUNK_SIZE]
[--sub-quad-kv-chunk-size SUB_QUAD_KV_CHUNK_SIZE]
[--sub-quad-chunk-threshold SUB_QUAD_CHUNK_THRESHOLD]
[--opt-split-attention-invokeai] [--opt-split-attention-v1]
[--disable-opt-split-attention] [--disable-nan-check]
[--use-cpu USE_CPU [USE_CPU ...]] [--listen] [--port PORT]
[--show-negative-prompt] [--ui-config-file UI_CONFIG_FILE]
[--hide-ui-dir-config] [--freeze-settings] [--ui-settings-file UI_SETTINGS_FILE]
[--gradio-debug] [--gradio-auth GRADIO_AUTH]
[--gradio-auth-path GRADIO_AUTH_PATH]
[--gradio-img2img-tool GRADIO_IMG2IMG_TOOL]
[--gradio-inpaint-tool GRADIO_INPAINT_TOOL] [--opt-channelslast]
[--styles-file STYLES_FILE] [--autolaunch] [--theme THEME] [--use-textbox-seed]
[--disable-console-progressbars] [--enable-console-prompts]
[--vae-path VAE_PATH] [--disable-safe-unpickle] [--api] [--api-auth API_AUTH]
[--api-log] [--nowebui] [--ui-debug-mode] [--device-id DEVICE_ID]
[--administrator] [--cors-allow-origins CORS_ALLOW_ORIGINS]
[--cors-allow-origins-regex CORS_ALLOW_ORIGINS_REGEX]
[--tls-keyfile TLS_KEYFILE] [--tls-certfile TLS_CERTFILE]
[--server-name SERVER_NAME] [--gradio-queue] [--skip-version-check]
[--no-hashing] [--no-download-sd-model] [--ldsr-models-path LDSR_MODELS_PATH]
[--lora-dir LORA_DIR] [--scunet-models-path SCUNET_MODELS_PATH]
[--swinir-models-path SWINIR_MODELS_PATH]



The following values were not passed to `accelerate launch` and had defaults used instead:
    `--num_processes` was set to a value of `1`
    `--num_machines` was set to a value of `1`
    `--mixed_precision` was set to a value of `'no'`
To avoid this warning pass in values for each of the problematic parameters or run `accelerate config`.
Python 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0]
Commit hash: 0cc0ee1bcb4c24a8c9715f66cede06601bfc00c8
Installing requirements for Web UI
Launching Web UI with arguments: --num_processes=10


find . -name accelerate
    /home/liujiao/stable-diffusion-webui/venv/bin

    pip3 install deepspeed
    DeepSpeed 是一个深度学习优化库，它使分布式训练变得容易、高效和有效

    CUDA_HOME does not exist, unable to compile CUDA op(s)



