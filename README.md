# LLaMA-Factory

Dockerized LLaMA-Factory: PyTorch container for efficient LLM fine-tuning.

## Usage

Pull the `arm64` image using:

```
apptainer pull docker://ghcr.io/j34ni/llama-factory:latest
```

then

```
apptainer exec --nv llama-factory_latest.sif python -c "
import torch
from llmtuner.hparams.parser import get_train_args
print('LLaMA-Factory v0.7.0 loaded! PyTorch:', torch.__version__)
print('CUDA available:', torch.cuda.is_available())
print('Transformers version:', __import__(\"transformers\").__version__)
print('PEFT version:', __import__(\"peft\").__version__)
"
```

should give:

```
INFO:    gocryptfs not found, will not be able to use gocryptfs
/usr/local/lib/python3.10/dist-packages/jieba/_compat.py:18: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  import pkg_resources
LLaMA-Factory v0.7.0 loaded!
PyTorch: 2.4.0a0+3bcc3cddb5.nv24.07
CUDA available: True
Transformers version: 4.41.2
PEFT version: 0.10.0

```
