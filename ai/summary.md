

## Chinchilla

Chinchilla（龙猫）是 DeepMind 发布的大语言模型，拥有 70B 的参数规模。

## LLaMA

LLaMA 是 Meta AI 发布的包含 7B、13B、33B 和 65B 四种参数规模的基础语言模型集合，
LLaMA-13B 仅以 1/10 规模的参数在多数的 benchmarks 上性能优于 GPT-3(175B)，
LLaMA-65B 与业内最好的模型 Chinchilla-70B 和 PaLM-540B 比较也具有竞争力。

## chatglm-6b

ChatGLM 是清华大学知识工程（KEG）实验室与其技术成果转化的公司智谱AI基于此前开源
的 GLM-130B 千亿基座模型研制，是一个初具问答和对话功能的千亿中英语言模型。

开源了62 亿参数的 ChatGLM-6B[52]，结合模型量化技术，用户可以在消费级的显卡上进
行本地部署（INT4 量化级别下最低只需 6GB 显存），虽然规模不及千亿模型，但大大降
低了用户部署的门槛，并且已经能生成相当符合人类偏好的回答。

## GLM-130B

GLM-130B 是清华大学与智谱AI共同研制的一个开放的双语（英汉）双向密集预训练语言模
型，拥有 1300亿个参数，使用通用语言模型（General Language Model， GLM[23]）的算
法进行预训练

## Alpaca

https://github.com/tatsu-lab/stanford_alpaca.git

Alpaca（羊驼）模型是斯坦福大学基于 Meta 开源的 LLaMA-7B 模型微调得到的指令遵循
（instruction-following）的语言模型。


