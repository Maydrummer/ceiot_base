docker restart mymongodb

# Iniciar Node.js en tmux
tmux new-session -d -s node_server 'node index.js'

# Verificar si Node.js está levantado
until curl -s http://localhost:8080/health | grep -q "OK"; do
  sleep 1
done

# Iniciar el servidor SPA en tmux
cd spa/
tmux new-session -d -s spa_server './rebuild.sh'

echo "System up at $(date)"

read -p "Press Enter to exit..."

