
Dreambooth

embeddings

## prompt

在提示中使用 () 会增加模型对提示词的关注，使用 [] 则会减少它

a (word)        word 提高1.1倍
a (word:1.1)    word 权重默认1.1
a (word:1.5)    word 提高1.5倍
a (word:0.25)   word 降低为1/4(1/0.25)
a ((word))      word 提高1.1x1.1倍

a [word]        word 降低1.1倍
    权重仅用于 (), 不适用于 []

### 网站

1. 关键词查询
    http://laion-aesthetic.datasette.io/laion-aesthetic-6pls/images

2. 艺术风格

    https://rentry.org/artists_sd-v1-4

3. 提示语参考

    https://lexica.art
    https://www.krea.ai

4. 提示语生成

    https://promptomania.com

5. models

    https://civitai.com/

    Taiwan Doll Likeness 页面下载模型，并放置在 models/Lora/ 目录下，也请确认扩展名为 .safetensors

    模型都下载好后，就可以运行 webui.sh 启动软件了
