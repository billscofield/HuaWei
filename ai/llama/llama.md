# Meta AI’s LLaMA (Large Language Model Meta AI) models.

具体技术细节请看论文:
    [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971)


## 1. clone https://github.com/facebookresearch/llama.git

    pip install -r requirements.txt
    pip install -e .

## 2. Download the tokenizer and model files.

    Edit the download.sh script with the signed url provided in the email to
    download the model weights and tokenizer.

    官方的需要申请
    https://ai.facebook.com/blog/large-language-model-llama-meta-ai/

    我们可以bt下载
    Different models require different MP values:

    ```
    Model   MP
    7B      1
    13B     2
    33B     4
    65B     8
    ```

## 3. Inference

The provided example.py can be run on a single or multi-gpu node with torchrun
and will output completions for two pre-defined prompts. Using TARGET_FOLDER as
defined in download.sh:

```
torchrun --nproc_per_node MP example.py --ckpt_dir $TARGET_FOLDER/model_size --tokenizer_path $TARGET_FOLDER/tokenizer.model
```
