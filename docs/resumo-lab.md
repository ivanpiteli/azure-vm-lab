# Resumo do Laboratório Azure VM

## 📘 Etapas Realizadas
1. Criação de grupo de recursos

O Grupo de Recursos é um contêiner lógico para seus recursos do Azure. Ele organiza os recursos relacionados para uma solução, como máquinas virtuais, contas de armazenamento, redes virtuais, etc., facilitando o gerenciamento e o ciclo de vida.

Como fazer:

No portal do Azure, procure por "Grupos de recursos" na barra de pesquisa.

Clique em "+ Criar".

Preencha os detalhes:

Assinatura: Selecione sua assinatura do Azure.

Grupo de recursos: Dê um nome significativo ao seu grupo (ex: LabVM_MeuProjeto).

Região: Escolha a região onde você deseja que seus recursos sejam implantados (ex: Brazil South).

Clique em "Revisar + criar" e depois em "Criar".

2. Criação de VM via portal

A criação da Máquina Virtual é a parte importanteb do laboratório. Escolheremos o tamanho, o sistema operacional e outras configurações básicas aqui.

Como fazer:

No portal do Azure, procure por "Máquinas Virtuais" na barra de pesquisa.

Clique em "+ Criar" e selecione "Máquina virtual do Azure".

Na guia "Básico":

Grupo de recursos: Selecione o grupo de recursos que você criou anteriormente.

Nome da máquina virtual: Dê um nome para sua VM (ex: MinhaPrimeiraVM).

Região: Deve ser a mesma do seu grupo de recursos.

Opções de disponibilidade: Para um laboratório simples, "Nenhuma redundância de infraestrutura necessária" geralmente é suficiente.

Imagem: Escolha o sistema operacional desejado (ex: Windows Server 2019 Datacenter ou Ubuntu Server 20.04 LTS).

Tamanho: Selecione um tamanho de VM apropriado para seu laboratório (ex: Standard_B2s para Windows ou Standard_B1s para Linux, que são mais econômicos).

Tipo de autenticação:

Para Windows: Senha. Defina um Nome de usuário e uma Senha forte.

Para Linux: Senha ou Chave pública SSH. Se escolher Chave pública SSH, gere um par de chaves e salve a chave privada.

Na guia "Discos": Geralmente, as configurações padrão são suficientes para um laboratório. Você pode escolher entre SSD Premium, SSD Standard ou HDD Standard.

Na guia "Rede":

Rede virtual: O Azure criará uma nova rede virtual e sub-rede por padrão.

IP público: Será criado para permitir acesso externo.

Portas de entrada públicas: Permita as portas necessárias para acesso remoto (ex: 3389 para RDP no Windows, 22 para SSH no Linux). Importante: Em um ambiente de produção, limite o acesso a IPs específicos por segurança.

Revise as outras guias ("Gerenciamento", "Monitoramento", "Avançado", "Tags") e ajuste conforme necessário. Para um laboratório, muitas vezes as configurações padrão são suficientes.

Clique em "Revisar + criar" e depois em "Criar". A implantação levará alguns minutos.

3. Configuração de Rede e NSG

A Configuração de Rede envolve a rede virtual (VNet) e as Sub-redes da sua VM. O Grupo de Segurança de Rede (NSG) atua como um firewall, controlando o tráfego de entrada e saída para seus recursos, como a VM.

Como fazer (após a VM ser criada):

Vá para sua VM no portal do Azure.

No menu esquerdo, em "Configurações", clique em "Rede".

Aqui você pode ver as interfaces de rede, a rede virtual e a sub-rede associadas à sua VM.

Para configurar o NSG:

Na página de rede da VM, você verá o NSG associado à sua interface de rede ou sub-rede. Clique no nome do NSG.

Em "Configurações", clique em "Regras de segurança de entrada" e "Regras de segurança de saída".

Você pode adicionar novas regras para permitir ou negar tráfego com base em:

Origem: Endereço IP, intervalo de IP, Tag de Serviço (ex: Internet, VirtualNetwork).

Portas de origem: Portas específicas ou intervalo.

Destino: Endereço IP, intervalo de IP, Tag de Serviço.

Portas de destino: Portas específicas (ex: 3389 para RDP, 22 para SSH).

Protocolo: TCP, UDP, Qualquer.

Ação: Permitir ou Negar.

Prioridade: Número (quanto menor, maior a prioridade).

Certifique-se de que as portas 3389 (RDP) ou 22 (SSH) estejam permitidas para sua máquina virtual a partir do seu IP público se você quiser acessá-la de fora.

4. Acesso remoto (RDP/SSH)

O acesso remoto é crucial para interagir com sua VM.

Como fazer:

Para Máquinas Windows (RDP - Remote Desktop Protocol):

No portal do Azure, vá para sua VM.

Na página "Visão geral", você encontrará o endereço IP público da sua VM.

Abra o "Conexão de Área de Trabalho Remota" no seu computador (basta pesquisar por mstsc no Windows).

Digite o IP público da sua VM e clique em "Conectar".

Insira o nome de usuário e a senha que você configurou durante a criação da VM.

Para Máquinas Linux (SSH - Secure Shell):

No portal do Azure, vá para sua VM.

Na página "Visão geral", você encontrará o endereço IP público da sua VM.

Use um cliente SSH (como PuTTY no Windows ou o terminal no Linux/macOS).

No terminal, digite: ssh seu_usuario@IP_publico_da_VM (ex: ssh azureuser@20.x.x.x).

Se você usou uma chave SSH, especifique o caminho para sua chave privada.

Insira a senha se tiver configurado autenticação por senha.
   
5. Monitoramento e ajuste de recursos

O monitoramento permite que você acompanhe o desempenho da sua VM e o uso de recursos, como CPU, memória, disco e rede. Isso é essencial para otimizar custos e garantir a performance.

Como fazer:

No portal do Azure, vá para sua VM.

No menu esquerdo, em "Monitoramento", clique em "Métricas".

Aqui você pode visualizar gráficos de várias métricas, como:

Percentual de CPU

Bytes de rede de entrada / Bytes de rede de saída

Operações de E/S de disco

Memória disponível (se estiver usando extensões de diagnóstico ou Log Analytics)

Você pode ajustar o intervalo de tempo e adicionar novas métricas para personalizar sua visualização.

Para ajustar recursos:

Redimensionar a VM (Escalar): Se sua VM estiver constantemente com alto uso de CPU ou memória, você pode redimensioná-la para um tamanho maior. Vá para a sua VM, clique em "Tamanho" no menu esquerdo e escolha um novo tamanho. Isso exigirá uma reinicialização da VM.

Adicionar Discos: Se você precisar de mais espaço de armazenamento, pode adicionar novos discos de dados à sua VM.

Configurar Alertas: Em "Monitoramento", clique em "Alertas" para criar regras de alerta baseadas em métricas. Por exemplo, você pode configurar um alerta para ser notificado se o uso da CPU exceder 90% por mais de 5 minutos.
