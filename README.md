# Reimbursement Portal

A Ruby on Rails application designed for organizations to manage employee reimbursement claims. This portal features a dual-role system (Admin and Employee) with a secure authentication flow and a rich Bootstrap-based UI.

## 🚀 Key Features
- **Admin Dashboard**: Full CRUD for Employee management (linked User/Employee records).
- **Claim Management**: Admin can Approve or Reject claims with real-time status updates.
- **Employee Portal**: Submit reimbursement bills (Food, Travel, Others) and view personal history.
- **Analytics**: Real-time totals for Submitted, Approved, and Rejected amounts.
- **Security**: Custom session-based authentication and Role-Based Access Control (RBAC).

## 🛠️ Tech Stack
- **Framework**: Ruby on Rails 7.x
- **Database**: PostgreSQL
- **Frontend**: Bootstrap 5, SCSS, jQuery
- **Auth**: Custom Bcrypt implementation

## 📥 Installation

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd reimbursement-portal
   ```

2. **Install Dependencies**
   ```
   bundle install
   ```
3. **Database Setup**
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```
4. **Start the Server**
   ```
   rails s
   ```
   Visit http://localhost:3000 in your browser.

## 🔑 Demo & Testing Credentials

### Admin Access
- **Email:** admin@test.com
- **Password:** Password@123

### Employee Access
- **Default Password:** Welcome@123
- **Note:** Use the Admin dashboard to create an employee account first, then log in with that email and this default password.