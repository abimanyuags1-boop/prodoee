# 🚗 Smart Factory Vehicle Manufacturing OEE Monitoring System

A full-stack industrial **Overall Equipment Effectiveness (OEE)** and plant performance monitoring platform built for automotive vehicle assembly operations.

Designed with an executive industrial theme inspired by **SafetyChain**, this platform features real-time IoT machine telemetry, Pareto downtime loss analysis, failure risk prediction, operator shift evaluations, live incident alerting with RBAC acknowledgment, and multi-dimensional drill-down CSV reporting.

---

## 🌟 Key Features

### 1. 📊 Executive OEE Dashboard
- Real-time **Overall OEE (84.15%)**, **Availability (91.93%)**, **Performance (96.36%)**, and **Quality Yield (95.00%)**.
- Interactive analytics:
  - OEE by Automotive Assembly Plant (*Detroit Assembly Plant* vs. *Fremont EV Gigafactory*).
  - OEE by Shift (Shift 1, Shift 2, Shift 3 circular distribution).
  - OEE by Assembly Line (*Line 01 - Body*, *Line 02 - Paint*, *Line 03 - Final Assembly*).
  - Model Performance ranking (*Sedan Apex GT*, *SUV Terra Cross*, *EV CityPulse 400*, etc.).
  - VIN Batch Series Tracking.

### 2. ⚙️ Real-Time Machine Telemetry & Status
- Live operating state for plant cells: **Running** 🟢, **Idle** 🟡, **Stopped** 🔴, and **Under Maintenance** 🟣.
- Real-time stoppage duration counter and operator-reported root cause alerts.
- Live shift output counters with visual progress indicators (e.g., *1,420 / 1,500 units · 94.7%*).
- Integrated sensor telemetry:
  - Hydraulic / motor bearing temperature (°C).
  - Mechanical vibration amplitude (mm/s).
  - Cumulative operating hours since overhaul.
  - Predictive failure risk probability score (%).
- Interactive state-switcher with backend RBAC enforcement.

### 3. ⏱️ Downtime Reasons & Loss Financial Impact
- **Pareto Chart**: Ranks lost runtime minutes by root cause category.
- **Financial & Volume Impact Calculations**:
  - Total lost production runtime (minutes & hours).
  - Estimated financial loss ($) based on automotive line downtime rates (~$2,500/hr).
  - Lost vehicle body units (~2.2 units/min throughput pace).
- Detailed stoppage incident log with resolution tracking (*Resolved*, *In Progress*, *Investigating*).

### 4. 🚗 Vehicle Production Batches (VIN Series)
- Production output tracking by Vehicle Identification Number (VIN) batches.
- Target vs. Actual production volumes, scrap/rework counts, and first-pass yields.
- Granular line and shift filtering.

### 5. 👥 Operator & Shift Operational Performance
- Cross-shift comparison cards (Shift 1, Shift 2, Shift 3) analyzing OEE, output, downtime, and yields.
- Operator leaderboard evaluating efficiency ratings, defect rates, downtime contributions, and supervisor evaluation tags (*Top Performer*, *On Target*, *Needs Review*, *Needs Training*).

### 6. 🔧 Predictive Maintenance & Machine Health
- Real-time telemetry matrix displaying temperature, vibration, and failure risk probabilities.
- Preventative Maintenance (PM) task schedule with priority badges, assigned specialists, status tracking, and scheduling modals.

### 7. 🔔 Live Incident Alerts & Notifications
- Automated event triggers: Unexpected Stops, High Downtime, OEE Drop, Defect Surge, Bearing Overheat.
- Active unacknowledged incident banner with red pulsing indicator.
- 1-Click **"Acknowledge"** button persisting user identity and timestamp to the backend audit log.
- Separate, non-overlapping **Incident Details** and **Timestamp** audit history table.

### 8. 📑 Multi-Dimensional Reports & CSV Export Center
- Drill-down filters by Plant, Line, and Shift.
- One-click instant CSV report downloads streamed directly from Express:
  - 📥 **Export Production Batches (CSV)** (`/api/reports/export-csv?type=production`)
  - 📥 **Export Downtime Stoppages (CSV)** (`/api/reports/export-csv?type=downtime`)
  - 📥 **Export Financial Loss & Pareto Analysis (CSV)** (`/api/reports/export-csv?type=losses`)

---

## 🔐 Role-Based Access Control (RBAC)

Authentication is handled via JWT tokens (HTTP-only cookies & Bearer headers) with BCrypt password hashing. Permissions are enforced on the Express backend routes:

| Role | Demo Credentials | Permissions Enforced |
| :--- | :--- | :--- |
| **Admin** | `admin@safetychain.com` / `AdminPassword123!` | Full control: user accounts, database reset, machine updates, delete records |
| **Production Manager** | `manager@safetychain.com` / `ManagerPassword123!` | View KPIs, output reports, loss analysis, acknowledge alerts |
| **Operator** | `operator@safetychain.com` / `OperatorPassword123!` | Record vehicle production batches, log downtime stoppages *(deletion blocked with 403)* |
| **Maintenance Engineer** | `maintenance@safetychain.com` / `MaintenancePassword123!` | Update machine status, acknowledge alerts, schedule preventative maintenance |

---

## 🛠️ Tech Stack

- **Frontend**: React 18, Vite, TypeScript, Recharts, Lucide Icons, Modern CSS.
- **Backend**: Node.js, Express 5, TypeScript, JWT, BCrypt, Cookie-Parser, Helmet, CORS, Rate-Limiting.
- **Persistence**: Atomic file-locking JSON database with schema validation (`backend/data/oee_database.json` & `oee_users.json`).
- **Real-Time**: Socket.IO event bus for live streaming.

---

## 🚀 Getting Started

### Prerequisites
- Node.js (v18 or higher)
- npm or yarn

### Installation & Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/oee-monitoring-system.git
   cd oee-monitoring-system
   ```

2. **Install dependencies**:
   ```bash
   # Install root and backend dependencies
   cd backend && npm install
   # Install frontend dependencies
   cd ../frontend && npm install
   cd ..
   ```

3. **Build Frontend & Backend**:
   ```bash
   npm run build --prefix frontend
   npm run build --prefix backend
   ```

4. **Start the Application**:
   ```bash
   cd backend
   npm start
   ```

5. **Access the Dashboard**:
   - Open your browser to **`http://localhost:4000`**.
   - API Health Check: **`http://localhost:4000/api/health`**.