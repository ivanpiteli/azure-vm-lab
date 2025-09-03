# 🌐 Laboratório de Máquinas Virtuais no Azure

Este repositório contém resumos, anotações, dicas e scripts utilizados no laboratório de criação e gerenciamento de máquinas virtuais no **Microsoft Azure**.

---

## 📌 Tópicos abordados

### 1. Criação de Grupo de Recursos
![Criação de Grupo de Recursos](images/criacao-grupo-recursos.png)


### 2. Criação de VM via Portal

![Criação de VM via Portal](images/Create_VM-AZ-01.png)

![Criação de VM via Portal](images/Create_VM-AZ-02.png)

![Criação de VM via Portal](images/Create_VM-AZ-03.png)

### 3. Configuração de Rede e NSG

![Configuração de Rede](images/configuracao-rede.png)

![Configuração de NSG](images/configuracao-nsg.png)

### 4. Acesso Remoto (RDP/SSH)
![Acesso Remoto](images/acesso-remoto.png)

### 5. Monitoramento e Ajuste de Recursos
![Monitoramento e Ajuste](images/monitoramento-ajuste.png)

---

## 📘 Conteúdo do Repositório

- **/images** → prints de tela do laboratório  
- **/scripts** → exemplos de scripts usados em CLI/PowerShell  
- **/docs** → resumos e anotações complementares  

---

## 📚 Tópicos Estudados

- Criação de VMs no portal do Azure
- Configuração de rede e firewall (NSG)
- Acesso remoto via RDP/SSH
- Monitoramento e métricas
- Automação com CLI e PowerShell

---

## 🔎 Exemplo de Comando CLI

```bash
az vm create   --resource-group MeuGrupo-01   --name MinhaVM-01   --image UbuntuLTS   --admin-username azureuser   --generate-ssh-keys
```

