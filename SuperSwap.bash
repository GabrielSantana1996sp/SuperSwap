#bash

##  Script `.sh` para Perfil 1 (swap = 15% da RAM)

```bash
#!/bin/bash
# Perfil 1: Usar disco inteiro com swap = 15% da RAM
# NftablesStrongDevSecOps - Swap Config

# Descobrir RAM total em MiB
RAM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}') # em KiB
RAM_TOTAL_MIB=$((RAM_TOTAL / 1024))

# Calcular 15% da RAM
SWAP_SIZE=$((RAM_TOTAL_MIB * 15 / 100))

# Aplicar limites
if [ $SWAP_SIZE -lt 512 ]; then
  SWAP_SIZE=512
elif [ $SWAP_SIZE -gt 8192 ]; then
  SWAP_SIZE=8192
fi

echo "RAM total: ${RAM_TOTAL_MIB} MiB"
echo "Swap definido: ${SWAP_SIZE} MiB"

# Criar swap
SWAPFILE=/swapfile
fallocate -l ${SWAP_SIZE}M $SWAPFILE
chmod 600 $SWAPFILE
mkswap $SWAPFILE
swapon $SWAPFILE

echo "$SWAPFILE none swap sw 0 0" >> /etc/fstab
```

---

## Script `.sh` para Perfil 2 (swap escalonado)

```bash
#!/bin/bash
# Perfil 2: Swap escalonado conforme RAM
# NftablesStrongDevSecOps - Swap Config

RAM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}') # em KiB
RAM_TOTAL_MIB=$((RAM_TOTAL / 1024))

SWAP_SIZE=0

if [ $RAM_TOTAL_MIB -le 4096 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 2))          # 50%
elif [ $RAM_TOTAL_MIB -le 8192 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 4))          # 25%
elif [ $RAM_TOTAL_MIB -le 16384 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 8))          # 12.5%
elif [ $RAM_TOTAL_MIB -le 32768 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 16))         # 6.25%
elif [ $RAM_TOTAL_MIB -le 65536 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 32))         # 3.125%
elif [ $RAM_TOTAL_MIB -le 131072 ]; then
  SWAP_SIZE=$((RAM_TOTAL_MIB / 64))         # 1.5625%
else
  SWAP_SIZE=2048                            # fallback 2 GiB
fi

echo "RAM total: ${RAM_TOTAL_MIB} MiB"
echo "Swap definido: ${SWAP_SIZE} MiB"

SWAPFILE=/swapfile
fallocate -l ${SWAP_SIZE}M $SWAPFILE
chmod 600 $SWAPFILE
mkswap $SWAPFILE
swapon $SWAPFILE

echo "$SWAPFILE none swap sw 0 0" >> /etc/fstab
```

---

## Como usar
1. Crie o arquivo:
   ```bash
   nano swap-config.sh
   ```
2. Cole o conteúdo de um dos perfis.  
3. Dê permissão de execução:
   ```bash
   chmod +x swap-config.sh
   ```
4. Execute como root:
   ```bash
   sudo ./swap-config.sh
   ```
5. Verifique:
   ```bash
   free -h
   swapon --show
   ```

---
