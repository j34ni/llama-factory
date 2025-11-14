FROM nvcr.io/nvidia/pytorch:24.07-py3

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

COPY constraints.txt /tmp/constraints.txt

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    git clone -b v0.7.0 https://github.com/hiyouga/LLaMA-Factory.git /app && \
    mv /tmp/constraints.txt /app/constraints.txt && \
    cd /app && \
    pip install --upgrade pip setuptools wheel && \
    pip install datasets nltk jieba rouge-chinese einops accelerate peft trl gradio uvicorn fastapi sse-starlette --constraint /app/constraints.txt && \
    pip install . --no-deps --constraint /app/constraints.txt && \
    rm /app/constraints.txt

CMD ["/bin/bash"]
