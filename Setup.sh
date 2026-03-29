#!/bin/bash
set -e

echo "🚀 START CUSTOM SETUP"

BASE=/opt/ComfyUI

# =========================
# CUSTOM NODES
# =========================
cd $BASE/custom_nodes

git clone https://github.com/nxp89s9tsn-alt/Leaderbypass || true

# =========================
# MODELS
# =========================
cd $BASE/models

mkdir -p clip checkpoints diffusion_models loras upscale_models sams ultralytics/bbox ultralytics/segm

# CLIP
cd clip
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/qwen38BFluxKlein9BTE_38b.safetensors

# CHECKPOINTS
cd ../checkpoints
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/AIIM_Realism_FAST.safetensors

# DIFFUSION
cd ../diffusion_models
wget -nc https://huggingface.co/black-forest-labs/FLUX.2-klein-9B/resolve/main/flux-2-klein-9b.safetensors

# LORA
cd ../loras
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/ReaLora.safetensors

# UPSCALE
cd ../upscale_models
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/4xUltrasharp_4xUltrasharpV10.pt

# SAM
cd ../sams
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/sam_vit_l_0b3195.pth

# YOLO BBOX
cd ../ultralytics/bbox
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/hand_yolov8s.pt
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/Eyeful_v2-Paired.pt

# YOLO SEGM
cd ../segm
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/person_yolov8m-seg.pt

echo "✅ ALL MODELS INSTALLED"
