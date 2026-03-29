#!/bin/bash
set -e

echo "🚀 START CUSTOM SETUP"

# =========================
# WAIT FOR COMFYUI
# =========================
echo "⏳ Waiting for ComfyUI..."

for i in {1..60}; do
  if [ -d "/opt/ComfyUI" ]; then
    BASE="/opt/ComfyUI"
    echo "✅ Using /opt/ComfyUI"
    break
  elif [ -d "/workspace/ComfyUI" ]; then
    BASE="/workspace/ComfyUI"
    echo "✅ Using /workspace/ComfyUI"
    break
  fi
  sleep 2
done

if [ -z "$BASE" ]; then
  echo "❌ ComfyUI not found"
  exit 1
fi

# =========================
# CREATE FOLDERS
# =========================
mkdir -p $BASE/custom_nodes
mkdir -p $BASE/models/clip
mkdir -p $BASE/models/checkpoints
mkdir -p $BASE/models/diffusion_models
mkdir -p $BASE/models/loras
mkdir -p $BASE/models/upscale_models
mkdir -p $BASE/models/sams
mkdir -p $BASE/models/ultralytics/bbox
mkdir -p $BASE/models/ultralytics/segm

# =========================
# INSTALL CUSTOM NODES
# =========================
cd $BASE/custom_nodes

git clone https://github.com/nxp89s9tsn-alt/Leaderbypass || true

# =========================
# INSTALL MODELS
# =========================

echo "⬇️ Downloading models..."

cd $BASE/models/clip
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/qwen38BFluxKlein9BTE_38b.safetensors

cd $BASE/models/checkpoints
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/AIIM_Realism_FAST.safetensors

cd $BASE/models/diffusion_models
wget -nc https://huggingface.co/black-forest-labs/FLUX.2-klein-9B/resolve/main/flux-2-klein-9b.safetensors

cd $BASE/models/loras
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/ReaLora.safetensors

cd $BASE/models/upscale_models
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/4xUltrasharp_4xUltrasharpV10.pt

cd $BASE/models/sams
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/sam_vit_l_0b3195.pth

cd $BASE/models/ultralytics/bbox
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/hand_yolov8s.pt
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/Eyeful_v2-Paired.pt

cd $BASE/models/ultralytics/segm
wget -nc https://huggingface.co/tubizzz/LNWFL/resolve/main/person_yolov8m-seg.pt

echo "✅ ALL MODELS INSTALLED"
