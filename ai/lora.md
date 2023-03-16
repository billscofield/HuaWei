
chilloutMix模型
    基础的大模型
    /home/liujiao/stable-diffusion-webui/models/Stable-diffusion/
    7G

    [Chilloutmix model is taken down](https://www.reddit.com/r/StableDiffusion/comments/11dyeoy/sad_news_chilloutmix_model_is_taken_down/)

## LoRA

一般100多MB

[引用](http://replicate.com/blog/lora-faster-fine-tuning-of-stable-diffusion)

下载的 LoRA 文件放到 /home/liujiao/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora/

```
<lora:koreanDollLikeness_v10:0.2>           模型名字    0.2 是强度
```

## VAE

http://stable-diffusion-art.com/how-to-use-vae/
可以优化眼睛和脸

E stands for variational autoencoder. It is the part of the neural network
model that encodes and decodes the images to and from the smaller latent
space, so that computation can be faster.

[下载](https://huggingface.co/stabilityai/sd-vae-ft-mse-original)

放在这里: /home/liujiao/stable-diffusion-webui/models/VAE



safetensors 文件比较安全?
ckpt        


## stable diffusion

尺寸                可以后期调节
Restore faces
Tiling              平铺开
Hires.fix           两步生成，先生成地分辨率的，img2img的时候在高分辨率？

batch count
batch size

CFG Scale
    和标签咒语的吻合度
    classifier-free guidance scale

send to img2img


img2img

    Denoising strength  调低，符合原图，调高，天马行空的改变

send to extras
    调整分辨率

---

Epoch

Mixed precision

Learning rate

LR Scheduler

Max resolution
