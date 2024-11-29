# EKS Cluster Updater Script

This script automates the process of updating the Kubernetes version of an Amazon Elastic Kubernetes Service (EKS) cluster. It ensures minimal downtime and automates resource management, backup creation, and node group updates.

---

## Features

- **Dependency Installation:** Automatically installs necessary tools like `jq`, `kubectl`, `aws`, and `pluto`.
- **Cluster Connection Verification:** Validates connection to the specified EKS cluster.
- **Resource Backup:** Creates a comprehensive backup of cluster resources for disaster recovery.
- **Node Group Management:** Safely creates temporary node groups, migrates pods, and updates the base node group.
- **Compatibility Check:** Uses `pluto` to detect deprecated Kubernetes APIs.
- **Interactive Interface:** Uses `gum` (macOS) or `whiptail` (Linux) for user input.
- **Cluster Stabilization:** Ensures nodes and workloads are stable before and after updates.

---

## Prerequisites

### Tools:
- **macOS:** Homebrew is required for installing dependencies.
- **Linux:** `sudo` access and `apt` package manager are required.
- AWS CLI configured with appropriate permissions.
- Kubernetes CLI (`kubectl`) installed and configured.

### Permissions:
Ensure your AWS credentials have permissions for:
- `eks:DescribeNodegroup`
- `eks:UpdateNodegroupVersion`
- `eks:DeleteNodegroup`
- `eks:CreateNodegroup`
- Access to Kubernetes cluster resources.

---

## Installation

1. Clone the repository or copy the script.
2. Ensure the script is executable:
   ```bash
   chmod +x eks_cluster_updater.sh
   ```

---

## Usage

Run the script using:
```bash
./eks_cluster_updater.sh
```

### Workflow:

1. **Input Cluster Details:**
   - Enter the EKS cluster name.
   - Enter the desired Kubernetes Control Plane version (e.g., `1.23`).

2. **Dependency Installation:**
   - The script will check for missing tools and install them.

3. **Resource Backup:**
   - A backup of all cluster resources will be created and validated.

4. **Temporary Node Group Creation:**
   - A temporary node group will be created for workload migration.

5. **Node Group Update:**
   - The base node group will be updated to the new Kubernetes version.

6. **Pod Migration:**
   - Workloads will be safely migrated back to the updated node group.

7. **Cleanup:**
   - The temporary node group will be deleted.

---

## Known Limitations

- The script assumes specific tool installation commands based on `apt` (Linux) and `brew` (macOS).
- Temporary node group names are derived from the base node group with a `-v2` suffix.

---

## Dependencies

- `jq` for JSON parsing
- `kubectl` for interacting with Kubernetes
- `aws` CLI for managing EKS
- `pluto` for compatibility checks
- `gum` or `whiptail` for interactive input (depending on OS)

---

## Troubleshooting

### Common Issues:

- **Error:** Missing required tools.
  - Ensure all prerequisites are installed.
- **Error:** Cannot connect to cluster.
  - Verify the cluster name and your `kubectl` configuration.
- **Error:** Compatibility issues in backup.
  - Review and update deprecated Kubernetes API resources.

---

## License

This script is open-source and available under the MIT License.

---

## Contributions

Contributions, bug fixes, and enhancements are welcome. Please open an issue or submit a pull request to contribute.

---
