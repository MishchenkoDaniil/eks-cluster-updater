#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"
ORANGE_BG="\033[48;5;214m"
WHITE_TEXT="\033[97m"
RESET="\033[0m"

echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::::::::::::::::------------*#=--**--------------------------------------===          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::::::::::::::::::--:--*@@@@@+-+@@@@@*-------------------------------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::::::::::::::::--:-+@@@@@-:@@*-+@@-=@@@@@+---------------------------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::::::::::::::-=@@@@@::-:-:@@+-+@@-----=@@@@@=-----------------------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::::::::::::=@@@@@::-:::::-:@@+-+@@--------:=@@@@@=-------------------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::::::::=@@@@@-::::::::::--:@@+-=@@:------------=@@@@@=---------------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::::=@@@@@-::::::::::::::-:-@@+-=@@-:---------------=@@@@@+-----------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          :::::::::::::::-@@@=:::::::::::::::::#@@@@#-:-%@@@@*:----------------+@@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#:::::::::::::-*@@@@%--:-:::::-=@@@@@#:-------------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::::*@@@@%-:::::::::::::::-:=%@@@@#----------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@@=::::::+@@::::::-%@@+::---=@@@+--------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@*:::::::*@@::::-@@@%::-:--:-+@@+--------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@#:::::::*@@::=@@@=::::::::::+@@+--------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@#:::::::*@@-@@@=::::::::::::+@@+:-------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@#:::::::*@@@@@@:::::::::::::+@@+--------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@#:::::::*@@:-@@@@-::::::::::+@@+--------#@@=---------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@#:::::::*@@::::%@@@-::::::::+@@+::::----#@@----------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::=@@*:::::::*@@::::::+@@@=::::::-+@@@@@-:-::#@@----------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#:::::::::%@@@@*:::::::::::::::::-:::+@@@*::-#@@@@%-*@@----------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ::::::::::::::::@@#::::::::::::+@@@@@+:::::::::::::+@@@@@*@@@@@+:--%@@@@@--:-------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ....::::::::::::@@#::::::::::::::::+@@@@@=:::::=@@@@@+:::::::=@@@@@+-::*=-:--------------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          .......:::::::::#@@@@=:::::::::::::::::=@@@@@@@@@+:::::::::::::::=@@@@+-:::::::----------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ..........:::::::::-@@@@@-:::::::::::::::::=@=:::::::::::::::::-@@@@@=:::::::::----------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ..........:::::::::::.:-@@@@@::::::::::::::::::::::::::::::-@@@@@=::::::::::::::::-------          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          .............::::::::::::::-@@@@@::::::::::::::::::::::-@@@@@-:::::::::::::::::::::::----          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ................:::::::::::::::-@@@@@-:::::::::::::-@@@@@=::::::::::::::::::::::::::::---          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ................:::::::::::::::::::=@@@@@-:::::=@@@@@=:::::::::::::::::::::::::::::::::::          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ...................::::::::::::::::::::+@@@@@@@@@+:::::::::::::::::::::::::::::::::::::::          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ......................:::::::::::::::::::::+@+:::::::::::::::::::::::::::::::::::::::::::          ${RESET}"
echo -e "${ORANGE_BG}${WHITE_TEXT}          ......................:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::          ${RESET}"
echo -e "${RED}${CYAN}          ......................:::::::::UPDATER EKS CLUSTER VERSION:V1::::::::::::::::::::::::::::        ${RESET}"

fun_facts=(
    "Tip: jq is a powerful tool for working with JSON on the command line."
    "Did you know? Kubernetes means 'helmsman' in Greek, symbolizing cluster management."
    "AWS provides over 200 services for building and scaling applications."
    "Tip: Regularly update tools to avoid security vulnerabilities."
    "Interesting fact: Google launched Kubernetes as an open-source project in 2014."
)

display_random_fact() {
    local index=$((RANDOM % ${#fun_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${fun_facts[$index]}"
}

loading_animation() {
    echo -ne "${CYAN}[INSTALLING]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.1
    done
    echo -ne "\r"
}

install_tools() {
    for CMD in jq kubectl aws; do
        if ! command -v "$CMD" &> /dev/null; then
            echo -e "${YELLOW}[INSTALL]${RESET} Installing ${CYAN}$CMD${RESET}..."
            display_random_fact
            loading_animation
            
            if [[ "$OSTYPE" == "darwin"* ]]; then
                if ! command -v brew &> /dev/null; then
                    echo -e "${RED}[ERROR]${RESET} Homebrew is not installed. Please install Homebrew to run this script on macOS."
                    exit 1
                fi
                brew install "$CMD"
            else
                sudo apt update
                case "$CMD" in
                    jq | aws) sudo apt install -y "$CMD" ;;
                    kubectl)
                        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
                        rm kubectl
                        ;;
                esac
            fi
            echo -e "${GREEN}[SUCCESS]${RESET} $CMD installed successfully."
        fi
    done

    if ! command -v pluto &> /dev/null; then
        echo -e "${YELLOW}[INSTALL]${RESET} Installing ${CYAN}pluto${RESET}..."
        display_random_fact
        loading_animation
        
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install pluto
        else
            PLUTO_URL="https://github.com/FairwindsOps/pluto/releases/download/v5.20.3/pluto_5.20.3_linux_amd64.tar.gz"
            curl -Lo pluto.tar.gz "$PLUTO_URL"
            tar -xzf pluto.tar.gz
            sudo install pluto /usr/local/bin/
            rm pluto pluto.tar.gz
            echo -e "${GREEN}[SUCCESS]${RESET} Pluto installed successfully."
        fi
    fi
}

install_tools

if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v gum &> /dev/null; then
        echo -e "${RED}[ERROR]${RESET} gum is not installed. Please install gum to run this script on macOS (e.g., using brew install gum)."
        exit 1
    fi
    INTERFACE="gum"
else
    if ! command -v whiptail &> /dev/null; then
        echo -e "${RED}[ERROR]${RESET} whiptail is not installed. Please install whiptail to run this script on Linux."
        exit 1
    fi
    INTERFACE="whiptail"
fi

if [[ "$INTERFACE" == "gum" ]]; then
    CLUSTER_NAME=$(gum input --placeholder "Enter cluster name (required):")
    CONTROL_PLANE_VERSION=$(gum input --placeholder "Enter Kubernetes Control Plane version (e.g., 1.23) (required):")
else
    CLUSTER_NAME=$(whiptail --inputbox "Enter cluster name:" 8 50 --title "Cluster Name" 3>&1 1>&2 2>&3)
    CONTROL_PLANE_VERSION=$(whiptail --inputbox "Enter Kubernetes Control Plane version (e.g., 1.23):" 8 50 --title "Control Plane Version" 3>&1 1>&2 2>&3)
fi

if [[ -z "$CLUSTER_NAME" || -z "$CONTROL_PLANE_VERSION" ]]; then
    echo -e "${RED}[ERROR]${RESET} Cluster name and Control Plane version are required."
    exit 1
fi

echo -e "${CYAN}[CHECKING]${RESET} Checking connection to cluster ${CYAN}$CLUSTER_NAME${RESET}..."

CONTEXT=$(kubectl config get-contexts -o name | grep "$CLUSTER_NAME" | head -n 1)

if [[ -z "$CONTEXT" ]]; then
    echo -e "${RED}[ERROR]${RESET} Context for cluster ${CYAN}$CLUSTER_NAME${RESET} not found."
    echo -e "${YELLOW}[TIP]${RESET} Please verify that the cluster name is correct. Available contexts:"
    kubectl config get-contexts
    exit 1
fi

kubectl config use-context "$CONTEXT" &> /dev/null
if kubectl get nodes &> /dev/null; then
    echo -e "${GREEN}[SUCCESS]${RESET} Successfully connected to cluster ${CYAN}$CLUSTER_NAME${RESET}."
else
    echo -e "${RED}[ERROR]${RESET} Could not connect to cluster ${CYAN}$CLUSTER_NAME${RESET}. Please check connection settings."
    exit 1
fi

backup_facts=(
    "Tip: Regular backups help protect against data loss."
    "Fun fact: In Kubernetes, secrets are stored encrypted and safeguarded from unauthorized access."
    "Tip: Adding extra node groups can improve load distribution across the cluster."
    "Did you know? In Kubernetes, a configmap stores key-value configuration, making settings management easier."
)

display_backup_fact() {
    local index=$((RANDOM % ${#backup_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${backup_facts[$index]}"
}

loading_animation_backup() {
    echo -ne "${CYAN}[BACKUP IN PROGRESS]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.1
    done
    echo -ne "\r"
}

BACKUP_DATE=$(date +"%Y%m%d")
BACKUP_FILE="backup-${BACKUP_DATE}.yaml"
echo -e "${YELLOW}[BACKUP]${RESET} Backup file name: ${CYAN}$BACKUP_FILE${RESET}"
display_backup_fact

if [[ -f "$BACKUP_FILE" ]]; then
    echo -e "${CYAN}[INFO]${RESET} A backup for today (${YELLOW}$BACKUP_DATE${RESET}) already exists. Skipping creation."
else
    echo -e "${YELLOW}[BACKUP]${RESET} Creating a cluster resources backup in file ${CYAN}$BACKUP_FILE${RESET}..."
    loading_animation_backup

    kubectl get all --all-namespaces -o yaml > "$BACKUP_FILE"
    kubectl get configmaps --all-namespaces -o yaml >> "$BACKUP_FILE"
    kubectl get secrets --all-namespaces -o yaml >> "$BACKUP_FILE"
    kubectl get persistentvolumeclaims --all-namespaces -o yaml >> "$BACKUP_FILE"
    kubectl get storageclasses -o yaml >> "$BACKUP_FILE"
    kubectl get ingresses --all-namespaces -o yaml >> "$BACKUP_FILE"

    echo -e "${CYAN}[CHECK]${RESET} Checking backup ${CYAN}$BACKUP_FILE${RESET} for compatibility using pluto..."
    pluto detect-files -d "$BACKUP_FILE"
    if [ $? -ne 0 ]; then
        echo -e "${RED}[ERROR]${RESET} Pluto detected compatibility issues in ${CYAN}$BACKUP_FILE${RESET}. Please review and update resources before proceeding."
        exit 1
    else
        echo -e "${GREEN}[SUCCESS]${RESET} Backup ${CYAN}$BACKUP_FILE${RESET} created and verified successfully."
    fi
fi

display_backup_fact

EXISTING_NODEGROUPS=$(kubectl get nodes -o json | jq -r '.items[] | select(.metadata.labels["eks.amazonaws.com/nodegroup"] != null) | .metadata.labels["eks.amazonaws.com/nodegroup"]' | sort -u)

if [[ "$INTERFACE" == "gum" ]]; then
    BASE_NODEGROUP=$(gum choose --limit 1 $(for ng in $EXISTING_NODEGROUPS; do echo "$ng"; done))
else
    NODEGROUP_OPTIONS=()
    for ng in $EXISTING_NODEGROUPS; do
        NODEGROUP_OPTIONS+=("$ng" "")
    done
    BASE_NODEGROUP=$(whiptail --title "Select Base Node Group" --menu "Choose a base node group for the temporary node group:" 25 100 15 "${NODEGROUP_OPTIONS[@]}" 3>&1 1>&2 2>&3)
fi

nodegroup_facts=(
    "Tip: Using temporary node groups allows for safe configuration updates."
    "Fun fact: In EKS, each node group can contain pods that operate independently of each other."
    "Tip: Increasing maxSize by 2 enables more pods for heavy workloads."
    "Did you know? Node groups in Kubernetes help separate tasks and manage cluster scalability."
)

display_nodegroup_fact() {
    local index=$((RANDOM % ${#nodegroup_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${nodegroup_facts[$index]}"
}

loading_animation_nodegroup() {
    echo -ne "${CYAN}[CREATING NODEGROUP]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.1
    done
    echo -ne "\r"
}

if [[ -n "$BASE_NODEGROUP" ]]; then
    TEMP_NODEGROUP="${BASE_NODEGROUP}-v2"
    echo -e "${YELLOW}[CREATE]${RESET} Creating temporary node group ${CYAN}$TEMP_NODEGROUP${RESET} based on ${CYAN}$BASE_NODEGROUP${RESET}..."
    
    display_nodegroup_fact

    FULL_NODE_VERSION=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${BASE_NODEGROUP}" -o json | jq -r '.items[0].status.nodeInfo.kubeletVersion')
    NODE_VERSION=$(echo "$FULL_NODE_VERSION" | sed -E 's/^v([0-9]+\.[0-9]+).*/\1/')
    SUBNETS=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.subnets" --output text)
    ROLE_ARN=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.nodeRole" --output text)
    INSTANCE_TYPES=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.instanceTypes" --output text | tr '\n' ' ')
    MIN_SIZE=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.scalingConfig.minSize" --output text)
    MAX_SIZE=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.scalingConfig.maxSize" --output text)
    DESIRED_SIZE=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.scalingConfig.desiredSize" --output text)
    LAUNCH_TEMPLATE_ID=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.launchTemplate.id" --output text)

    LABELS=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.labels" --output json | jq -c .)
    TAINTS=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.taints" --output json | jq -c .)

    NEW_MAX_SIZE=$((MAX_SIZE + 2))

    if aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$TEMP_NODEGROUP" &> /dev/null; then
        echo -e "${CYAN}[INFO]${RESET} Temporary node group ${CYAN}$TEMP_NODEGROUP${RESET} already exists. Removing old group..."
        aws eks delete-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$TEMP_NODEGROUP" > /dev/null
        while aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$TEMP_NODEGROUP" &> /dev/null; do
            sleep 5
        done
        echo -e "${GREEN}[SUCCESS]${RESET} Temporary node group removed successfully."
    fi

    echo -e "${YELLOW}[CREATE]${RESET} Creating temporary node group: ${CYAN}$TEMP_NODEGROUP${RESET} with increased maxSize ${CYAN}$NEW_MAX_SIZE${RESET}..."
    loading_animation_nodegroup

    aws eks create-nodegroup \
        --cluster-name "$CLUSTER_NAME" \
        --nodegroup-name "$TEMP_NODEGROUP" \
        --kubernetes-version "$NODE_VERSION" \
        --subnets $SUBNETS \
        --node-role "$ROLE_ARN" \
        --instance-types $INSTANCE_TYPES \
        --scaling-config minSize=$MIN_SIZE,maxSize=$NEW_MAX_SIZE,desiredSize=$DESIRED_SIZE \
        --launch-template "{\"id\":\"$LAUNCH_TEMPLATE_ID\"}" \
        $(if [[ "$TAINTS" != "null" ]]; then echo --taints "$TAINTS"; fi) \
        $(if [[ "$LABELS" != "null" ]]; then echo --labels "$LABELS"; fi) \
        2>&1 | tee aws_create_nodegroup_output.log

    if grep -q "error" aws_create_nodegroup_output.log; then
        echo -e "${RED}[ERROR]${RESET} Error creating temporary node group. See details in ${CYAN}aws_create_nodegroup_output.log${RESET}."
        exit 1
    fi

    echo -e "${YELLOW}[WAIT]${RESET} Waiting for all nodes in ${CYAN}$TEMP_NODEGROUP${RESET} to reach Ready status..."

    MAX_ITERATIONS=80
    COUNTER=0

    while [[ $COUNTER -lt $MAX_ITERATIONS ]]; do
        READY_NODES=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${TEMP_NODEGROUP}" -o json | jq '[.items[] | select(.status.conditions[] | select(.type == "Ready" and .status == "True"))] | length')
        TOTAL_NODES=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${TEMP_NODEGROUP}" -o json | jq '.items | length')
        NODE_INFO=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${TEMP_NODEGROUP}" -o wide)

        if [[ "$READY_NODES" == "$TOTAL_NODES" && "$READY_NODES" -gt 0 ]]; then
            echo -e "${GREEN}[SUCCESS]${RESET} All nodes in ${CYAN}$TEMP_NODEGROUP${RESET} are Ready (${GREEN}Ready: $READY_NODES/$TOTAL_NODES${RESET}). Waiting 60 seconds for stabilization..."
            sleep 60
            break
        else
            echo -e "${YELLOW}[WAIT]${RESET} Nodes in ${CYAN}$TEMP_NODEGROUP${RESET} are not yet Ready (${YELLOW}Ready: $READY_NODES/$TOTAL_NODES${RESET}). Waiting..."
            ((COUNTER++))
            sleep 10
        fi
    done

    if [[ $COUNTER -ge $MAX_ITERATIONS ]]; then
        echo -e "${RED}[ERROR]${RESET} Exceeded maximum retries waiting for nodes to become Ready. Please check node status manually."
        exit 1
    fi

else
    echo -e "${RED}[ERROR]${RESET} No base node group selected."
    exit 1
fi
stabilization_facts=(
    "Tip: Stabilizing the cluster helps prevent data loss during configuration changes."
    "Fun fact: Cordon helps prevent new pods from being placed on a node before an update."
    "Tip: Using Rolling Update in Kubernetes helps avoid downtime during deployments of new application versions."
    "Did you know? The Horizontal Pod Autoscaler (HPA) enables Kubernetes to automatically scale the number of replicas based on load."
)

display_stabilization_fact() {
    local index=$((RANDOM % ${#stabilization_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${stabilization_facts[$index]}"
}

loading_animation_stabilizing() {
    echo -ne "${CYAN}[STABILIZING]${RESET} "
    for i in {1..5}; do
        echo -ne "▮"
        sleep 0.5
    done
    echo -ne "\r"
}

echo -e "${CYAN}[STABILIZING]${RESET} Stabilizing the cluster..."
display_stabilization_fact
loading_animation_stabilizing
sleep 5

PERMANENT_NODES=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${BASE_NODEGROUP}" -o name)
for NODE in $PERMANENT_NODES; do
    echo -e "${YELLOW}[CORDON]${RESET} Marking node ${CYAN}$NODE${RESET} as unschedulable..."
    kubectl cordon "$NODE"
done

echo -e "${CYAN}[INFO]${RESET} Retrieving list of deployments and ReplicaSets to increase replicas on temporary nodes..."

for NODE in $PERMANENT_NODES; do
    NODE_NAME=$(echo "$NODE" | sed 's|node/||')
    echo -e "${YELLOW}[PROCESS]${RESET} Processing node ${CYAN}$NODE_NAME${RESET} to retrieve pods and associated Deployments/ReplicaSets..."

    PODS=$(kubectl get pods --all-namespaces --field-selector spec.nodeName="$NODE_NAME" -o json)

    for POD_NAMESPACE in $(echo "$PODS" | jq -r '.items[].metadata.namespace' | sort | uniq); do
        for POD_NAME in $(echo "$PODS" | jq -r ".items[] | select(.metadata.namespace==\"$POD_NAMESPACE\") | .metadata.name"); do

            OWNER_KIND=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].kind}')
            OWNER_NAME=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].name}')

            if [[ "$OWNER_KIND" == "ReplicaSet" ]]; then
                DEPLOYMENT_NAME=$(kubectl get replicaset "$OWNER_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].name}' 2>/dev/null)

                if [[ -n "$DEPLOYMENT_NAME" ]]; then
                    NODE_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" --field-selector spec.nodeName="$NODE_NAME" -o json | jq '.items | length')

                    if [[ "$NODE_PODS" -gt 0 ]]; then
                        echo -e "${YELLOW}[RESTART]${RESET} Restarting Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} in namespace ${CYAN}$POD_NAMESPACE${RESET}..."
                        kubectl rollout restart deployment "$DEPLOYMENT_NAME" -n "$POD_NAMESPACE"

                        COUNTER=0
                        MAX_WAIT_ITERATIONS=200
                        while true; do
                            RUNNING_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" -o json | jq '[.items[] | select(.status.phase == "Running")] | length')
                            TOTAL_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" -o json | jq '.items | length')

                            echo -e "${CYAN}[STATUS]${RESET} Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} status: Running pods: ${GREEN}$RUNNING_PODS${RESET} out of ${CYAN}$TOTAL_PODS${RESET}."

                            if [[ "$RUNNING_PODS" == "$TOTAL_PODS" && "$RUNNING_PODS" -ge "$CURRENT_REPLICAS" ]]; then
                                echo -e "${GREEN}[SUCCESS]${RESET} All pods of Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} are running. Waiting 60 seconds for stabilization..."
                                sleep 60
                                break
                            elif [[ $COUNTER -ge $MAX_WAIT_ITERATIONS ]]; then
                                echo -e "${RED}[ERROR]${RESET} Not enough resources to start all replicas for Deployment ${CYAN}$DEPLOYMENT_NAME${RESET}. Increasing node count..."

                                CURRENT_DESIRED_SIZE=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$NODEGROUP_NAME" --query "nodegroup.scalingConfig.desiredSize" --output text)
                                NEW_DESIRED_SIZE=$((CURRENT_DESIRED_SIZE + 1))
                                aws eks update-nodegroup-config --cluster-name "$CLUSTER_NAME" --nodegroup-name "$NODEGROUP_NAME" \
                                    --scaling-config desiredSize=$NEW_DESIRED_SIZE > /dev/null 2>&1
                                echo -e "${CYAN}[SCALE]${RESET} Node group ${CYAN}$NODEGROUP_NAME${RESET} size increased to ${YELLOW}$NEW_DESIRED_SIZE${RESET}. Waiting 60 seconds for initialization..."
                                sleep 60
                                COUNTER=0
                            else
                                echo -e "${YELLOW}[WAIT]${RESET} Not all pods of Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} are running (Running: ${GREEN}$RUNNING_PODS${RESET}/${CYAN}$TOTAL_PODS${RESET}). Waiting..."
                                ((COUNTER++))
                                sleep 10
                            fi
                        done
                    else
                        echo -e "${CYAN}[SKIP]${RESET} Skipping Deployment ${CYAN}$DEPLOYMENT_NAME${RESET}: No pods on node ${CYAN}$NODE_NAME${RESET}."
                    fi
                fi
            fi
        done
    done
done

eviction_facts=(
    "Tip: Evicting pods from nodes helps prevent sudden pod termination during updates."
    "Fun fact: Kubernetes uses a 'drain' mechanism to safely remove pods from a node before taking it out of the cluster."
    "Tip: Properly evicting pods before updating the node group helps avoid downtime."
)

display_eviction_fact() {
    local index=$((RANDOM % ${#eviction_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${eviction_facts[$index]}"
}

loading_animation_stabilize() {
    echo -ne "${CYAN}[STABILIZING]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.3
    done
    echo -ne "\r"
}

display_eviction_fact
for NODE in $PERMANENT_NODES; do
    NODE_NAME=$(echo "$NODE" | sed 's|node/||')
    echo -e "${YELLOW}[EVICT]${RESET} Evicting pods from node ${CYAN}$NODE_NAME${RESET}..."

    PODS=$(kubectl get pods --all-namespaces --field-selector spec.nodeName="$NODE_NAME" -o json)

    for POD_NAMESPACE in $(echo "$PODS" | jq -r '.items[].metadata.namespace' | sort | uniq); do
        for POD_NAME in $(echo "$PODS" | jq -r ".items[] | select(.metadata.namespace==\"$POD_NAMESPACE\") | .metadata.name"); do
            
            if [[ -n "$POD_NAME" && -n "$POD_NAMESPACE" ]]; then
                echo -e "${CYAN}[DELETE]${RESET} Deleting pod ${YELLOW}$POD_NAME${RESET} in namespace ${CYAN}$POD_NAMESPACE${RESET} from node ${CYAN}$NODE_NAME${RESET}..."

                kubectl delete pod "$POD_NAME" -n "$POD_NAMESPACE" --grace-period=30 --wait=true || echo -e "${RED}[ERROR]${RESET} Failed to delete pod ${YELLOW}$POD_NAME${RESET}"

                while true; do
                    POD_STATUS=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.status.phase}' 2>/dev/null || echo "Deleted")
                    if [[ "$POD_STATUS" == "Deleted" || -z "$POD_STATUS" ]]; then
                        echo -e "${GREEN}[SUCCESS]${RESET} Pod ${YELLOW}$POD_NAME${RESET} successfully deleted."
                        break
                    else
                        echo -e "${YELLOW}[WAIT]${RESET} Waiting for pod ${CYAN}$POD_NAME${RESET} deletion... Current status: ${CYAN}$POD_STATUS${RESET}"
                        sleep 5
                    fi
                done
            else
                echo -e "${CYAN}[SKIP]${RESET} Skipping: Pod name or namespace is empty for pod on node ${CYAN}$NODE_NAME${RESET}."
            fi
        done
    done
done

echo -e "${GREEN}[COMPLETE]${RESET} Pod migration to temporary nodes completed."

echo -e "${CYAN}[STABILIZING]${RESET} Stabilizing cluster..."
loading_animation_stabilize
sleep 60

echo -e "${YELLOW}[UPDATE]${RESET} Updating base node group ${CYAN}$BASE_NODEGROUP${RESET} to version ${CYAN}$CONTROL_PLANE_VERSION${RESET}..."
aws eks update-nodegroup-version --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --kubernetes-version "$CONTROL_PLANE_VERSION" > /dev/null
echo -e "${CYAN}[WAIT]${RESET} Waiting for node group ${CYAN}$BASE_NODEGROUP${RESET} update completion..."
while true; do
    NODEGROUP_STATUS=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$BASE_NODEGROUP" --query "nodegroup.status" --output text)
    if [[ "$NODEGROUP_STATUS" == "ACTIVE" ]]; then
        echo -e "${GREEN}[SUCCESS]${RESET} Base node group ${CYAN}$BASE_NODEGROUP${RESET} successfully updated to version ${CYAN}$CONTROL_PLANE_VERSION${RESET}."
        break
    else
        echo -e "${YELLOW}[STATUS]${RESET} Node group ${CYAN}$BASE_NODEGROUP${RESET} status: ${YELLOW}$NODEGROUP_STATUS${RESET}. Waiting..."
        sleep 15
    fi
done

migration_facts=(
    "Tip: Before pod migration, it’s important to uncordon nodes to allow new pods to launch on them."
    "Fun fact: Kubernetes allows pod migration across nodes without downtime using mechanisms like ReplicaSet and Deployment."
    "Tip: After pod migration completes, ensure all nodes are in the 'Ready' status."
)

display_migration_fact() {
    local index=$((RANDOM % ${#migration_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${migration_facts[$index]}"
}

loading_animation_prepare() {
    echo -ne "${CYAN}[PREPARING]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.3
    done
    echo -ne "\r"
}

echo -e "${CYAN}[STABILIZING]${RESET} Stabilizing cluster..."
loading_animation_prepare
sleep 60

echo -e "${YELLOW}[PREPARE]${RESET} Preparing to migrate pods from temporary node group ${CYAN}$TEMP_NODEGROUP${RESET} back to base node group ${CYAN}$BASE_NODEGROUP${RESET}..."
display_migration_fact

for NODE in $PERMANENT_NODES; do
    echo -e "${YELLOW}[UNCORDON]${RESET} Removing cordon from node ${CYAN}$NODE${RESET}..."
    kubectl uncordon "$NODE"
done

TEMP_NODES=$(kubectl get nodes -l "eks.amazonaws.com/nodegroup=${TEMP_NODEGROUP}" -o name)
for NODE in $TEMP_NODES; do
    echo -e "${YELLOW}[CORDON]${RESET} Marking node ${CYAN}$NODE${RESET} in the temporary node group as unavailable..."
    kubectl cordon "$NODE"
done

echo -e "${CYAN}[INFO]${RESET} Retrieving list of deployments and ReplicaSets for replica adjustment..."


for NODE in $TEMP_NODES; do
    NODE_NAME=$(echo "$NODE" | sed 's|node/||')
    echo -e "${YELLOW}[PROCESS]${RESET} Processing node ${CYAN}$NODE_NAME${RESET} to retrieve pods and associated Deployments/ReplicaSets..."

    PODS=$(kubectl get pods --all-namespaces --field-selector spec.nodeName="$NODE_NAME" -o json)

    for POD_NAMESPACE in $(echo "$PODS" | jq -r '.items[].metadata.namespace' | sort | uniq); do
        for POD_NAME in $(echo "$PODS" | jq -r ".items[] | select(.metadata.namespace==\"$POD_NAMESPACE\") | .metadata.name"); do

            OWNER_KIND=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].kind}')
            OWNER_NAME=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].name}')

            if [[ "$OWNER_KIND" == "ReplicaSet" ]]; then
                DEPLOYMENT_NAME=$(kubectl get replicaset "$OWNER_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.metadata.ownerReferences[0].name}' 2>/dev/null)

                if [[ -n "$DEPLOYMENT_NAME" ]]; then
                    NODE_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" --field-selector spec.nodeName="$NODE_NAME" -o json | jq '.items | length')

                    if [[ "$NODE_PODS" -gt 0 ]]; then
                        echo -e "${YELLOW}[RESTART]${RESET} Restarting Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} in namespace ${CYAN}$POD_NAMESPACE${RESET}..."
                        kubectl rollout restart deployment "$DEPLOYMENT_NAME" -n "$POD_NAMESPACE"

                        COUNTER=0
                        MAX_WAIT_ITERATIONS=200
                        while true; do
                            RUNNING_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" -o json | jq '[.items[] | select(.status.phase == "Running")] | length')
                            TOTAL_PODS=$(kubectl get pods -n "$POD_NAMESPACE" -l "app.kubernetes.io/instance=$DEPLOYMENT_NAME" -o json | jq '.items | length')

                            echo -e "${CYAN}[STATUS]${RESET} Checking Deployment ${CYAN}$DEPLOYMENT_NAME${RESET}: Running pods: ${GREEN}$RUNNING_PODS${RESET} out of ${CYAN}$TOTAL_PODS${RESET}."

                            if [[ "$RUNNING_PODS" == "$TOTAL_PODS" && "$RUNNING_PODS" -ge "$CURRENT_REPLICAS" ]]; then
                                echo -e "${GREEN}[SUCCESS]${RESET} All pods in Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} are Running. Waiting 60 seconds for stabilization..."
                                sleep 60
                                break
                            elif [[ $COUNTER -ge $MAX_WAIT_ITERATIONS ]]; then
                                echo -e "${RED}[ERROR]${RESET} Insufficient resources to start all replicas in Deployment ${CYAN}$DEPLOYMENT_NAME${RESET}. Increasing node count..."

                                CURRENT_DESIRED_SIZE=$(aws eks describe-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$NODEGROUP_NAME" --query "nodegroup.scalingConfig.desiredSize" --output text)
                                NEW_DESIRED_SIZE=$((CURRENT_DESIRED_SIZE + 1))
                                aws eks update-nodegroup-config --cluster-name "$CLUSTER_NAME" --nodegroup-name "$NODEGROUP_NAME" \
                                    --scaling-config desiredSize=$NEW_DESIRED_SIZE > /dev/null 2>&1
                                echo -e "${CYAN}[SCALE]${RESET} Node group ${CYAN}$NODEGROUP_NAME${RESET} size increased to ${YELLOW}$NEW_DESIRED_SIZE${RESET}. Waiting 60 seconds for initialization..."
                                sleep 60
                                COUNTER=0
                            else
                                echo -e "${YELLOW}[WAIT]${RESET} Not all pods in Deployment ${CYAN}$DEPLOYMENT_NAME${RESET} are Running (${GREEN}Running: $RUNNING_PODS/$TOTAL_PODS${RESET}). Retrying..."
                                ((COUNTER++))
                                sleep 10
                            fi
                        done
                    else
                        echo -e "${CYAN}[SKIP]${RESET} Skipping Deployment ${CYAN}$DEPLOYMENT_NAME${RESET}: no pods scheduled on node ${CYAN}$NODE_NAME${RESET}."
                    fi
                fi
            fi
        done
    done
done

restore_facts=(
    "Tip: Removing temporary nodes frees up resources and reduces cloud expenses."
    "Fun Fact: Cluster restoration after updates helps maintain application stability and reduces data loss risks."
    "Tip: Checking the status of node groups post-update is essential for resource availability control."
)

display_restore_fact() {
    local index=$((RANDOM % ${#restore_facts[@]}))
    echo -e "${YELLOW}[TIP]${RESET} ${restore_facts[$index]}"
}

loading_animation_delete() {
    echo -ne "${CYAN}[DELETING NODEGROUP]${RESET} "
    for i in {1..10}; do
        echo -ne "▮"
        sleep 0.3
    done
    echo -ne "\r"
}

echo -e "${GREEN}[COMPLETE]${RESET} Migration of pods from temporary to original nodes completed."

echo -e "${CYAN}[STABILIZING]${RESET} Stabilizing the cluster..."
sleep 60

display_restore_fact

echo -e "${YELLOW}[DELETE]${RESET} Deleting temporary node group ${CYAN}$TEMP_NODEGROUP${RESET}..."
loading_animation_delete
aws eks delete-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$TEMP_NODEGROUP" > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}[SUCCESS]${RESET} Temporary node group ${CYAN}$TEMP_NODEGROUP${RESET} successfully deleted."
else
    echo -e "${RED}[ERROR]${RESET} Failed to delete temporary node group ${CYAN}$TEMP_NODEGROUP${RESET}."
fi

echo -e "${GREEN}[RESTORE COMPLETE]${RESET} The original state of node group ${CYAN}$BASE_NODEGROUP${RESET} has been successfully restored."

echo -e "${CYAN}[STABILIZING]${RESET} Cluster stabilization..."
sleep 60

for NODE in $TEMP_NODES; do
    NODE_NAME=$(echo "$NODE" | sed 's|node/||')
    echo -e "${YELLOW}[EVICT]${RESET} Evicting pods from node ${CYAN}$NODE_NAME${RESET}..."

    PODS=$(kubectl get pods --all-namespaces --field-selector spec.nodeName="$NODE_NAME" -o json)

    for POD_NAMESPACE in $(echo "$PODS" | jq -r '.items[].metadata.namespace' | sort | uniq); do
        for POD_NAME in $(echo "$PODS" | jq -r ".items[] | select(.metadata.namespace==\"$POD_NAMESPACE\") | .metadata.name"); do
            
            if [[ -n "$POD_NAME" && -n "$POD_NAMESPACE" ]]; then
                echo -e "${CYAN}[DELETE]${RESET} Deleting pod ${YELLOW}$POD_NAME${RESET} in namespace ${CYAN}$POD_NAMESPACE${RESET} from node ${CYAN}$NODE_NAME${RESET}..."

                kubectl delete pod "$POD_NAME" -n "$POD_NAMESPACE" --wait=true || echo -e "${RED}[ERROR]${RESET} Failed to delete pod ${YELLOW}$POD_NAME${RESET}"

                while true; do
                    POD_STATUS=$(kubectl get pod "$POD_NAME" -n "$POD_NAMESPACE" -o jsonpath='{.status.phase}' 2>/dev/null || echo "Deleted")
                    if [[ "$POD_STATUS" == "Deleted" || -z "$POD_STATUS" ]]; then
                        echo -e "${GREEN}[SUCCESS]${RESET} Pod ${YELLOW}$POD_NAME${RESET} successfully deleted."
                        break
                    else
                        echo -e "${YELLOW}[WAIT]${RESET} Waiting for pod ${CYAN}$POD_NAME${RESET} deletion... Current status: ${CYAN}$POD_STATUS${RESET}"
                        sleep 5
                    fi
                done
            else
                echo -e "${CYAN}[SKIP]${RESET} Skipping: pod name or namespace is empty for node ${CYAN}$NODE_NAME${RESET}."
            fi
        done
    done
done

display_restore_fact
echo -e "${YELLOW}[DELETE]${RESET} Deleting temporary node group ${CYAN}$TEMP_NODEGROUP${RESET}..."
loading_animation_delete
aws eks delete-nodegroup --cluster-name "$CLUSTER_NAME" --nodegroup-name "$TEMP_NODEGROUP" > /dev/null 2>&1
echo -e "${GREEN}[COMPLETE]${RESET} Temporary node group successfully deleted."

echo -e "${GREEN}[RESTORE]${RESET} The original state of node group ${CYAN}$BASE_NODEGROUP${RESET} has been successfully restored."

