# Leave_Application

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](#)
[![AL Runtime](https://img.shields.io/badge/AL%20runtime-17.0-blue)](#)
[![License](https://img.shields.io/badge/license-TBD-lightgrey)](#)

## Overview

**Leave_Application** is a Microsoft Dynamics 365 Business Central extension for managing employee onboarding and leave administration in a single workflow. It captures employee registration requests, converts approved applications into master employee records, manages leave requests by leave type, and archives approved leave for operational tracking.

The extension is designed to help HR and administrative teams centralize people data, standardize approval handling, reduce manual follow-up, and notify stakeholders automatically by email when registrations or leave requests change status.

## Key Features

- Employee registration workflow with application capture, approval, rejection, and automatic employee number generation.
- Employee master record management with annual leave entitlement and leave balance tracking.
- Leave application processing for annual, sick, maternity, paternity, compassionate, study, unpaid, and other leave types.
- Automatic leave date calculation, including calendar-based handling for annual leave.
- Approval and rejection actions on leave requests, including rejection reason capture.
- Email notifications for approved or rejected registration requests and leave applications.
- Setup-driven leave configuration for tier-based annual leave days, maternity/paternity leave days, and approvals admin email.
- Dedicated list pages for registered employees, pending leave applications, and approved leave applications.
- Role-center style navigation actions exposed through page actions for quick access to the main workflows.

## Prerequisites

| Requirement | Details |
| --- | --- |
| Target BC version | Microsoft Dynamics 365 Business Central application 28.0.0.0 |
| AL runtime | 17.0 |
| Application family | Business Central |
| External services | A configured Business Central email account for outbound notifications |
| External APIs | None defined in the current workspace |

## Installation

1. Open the project in Visual Studio Code with the AL Language extension installed.
2. Restore or download symbols if needed using the AL project workflow.
3. Package the extension with **AL: Package**.
4. Publish the generated `.app` file with **AL: Publish**.
5. For command-line deployments, publish the packaged app with the standard Business Central PowerShell publishing flow used in your environment.

Example workflow:

```text
AL: Package
AL: Publish
```

## Configuration & Setup

After installation, an administrator should complete the following setup tasks:

1. Open **Leave Application Setup** and create the setup record with primary key `SETUP`.
2. Configure the leave day values for junior, mid, and senior employees.
3. Set the maternity and paternity leave defaults.
4. Enter the approvals administrator email address used for pending leave notifications.
5. Confirm that Business Central email is configured and operational.
6. Review the available leave types, departments, and employment tiers to ensure they match the organization’s policy.

### Setup Fields

| Field | Purpose |
| --- | --- |
| Primary Key | Stores the singleton setup record key, expected to be `SETUP` |
| Member No. Prefix | Reserved setup value for member numbering or future numbering logic |
| Junior Employee Leave Days | Annual leave entitlement for junior employees |
| Mid Employee Leave Days | Annual leave entitlement for mid-level employees |
| Senior Employee Leave Days | Annual leave entitlement for senior employees |
| Maternity Leave Days | Default maternity leave duration |
| Paternity Leave Days | Default paternity leave duration |
| Approvals Admin's Email | Recipient for pending leave review notifications |

## Usage / Workflows

1. Create or open an employee application on **Employee Registration Card**.
2. Enter personal, contact, and employment information.
3. Mark the registration as approved or rejected.
4. On approval, submit the record to create a new employee in **Registered Employees List**.
5. The employee creates a leave request on **Leave Application**.
6. Choose the leave type, enter the start date and days requested, and let the system calculate the end date where applicable.
7. Review applications on **Pending Applications List**.
8. Approve or reject the request; approved records are moved to **Approved Applications List** and email notifications are sent automatically.

## Developer Notes

| Object | Purpose |
| --- | --- |
| Table 50400 `EmployeeApplicationTable` | Stores employee registration requests |
| Table 50401 `EmployeeTable` | Stores approved employee master data and leave balances |
| Table 50402 `LeaveApplicationsTable` | Stores pending leave applications |
| Table 50403 `ApprovedApplications` | Archives approved leave applications |
| Table 50410 `SetupTable` | Stores extension setup and leave policy values |
| Codeunit 50400 `EmployeeHelper` | Converts approved applications into employees and updates leave taken |
| Codeunit 50401 `Leave Application Helper` | Calculates leave dates and moves leave applications through the approval flow |
| Codeunit 50402 `SendNotifications` | Sends email notifications for registration and leave events |
| Pages 50400-50404, 50410 | Card and list pages for registration, leave management, and setup |
| Enums | Leave types, departments, and employment tiers |

Notes for maintainers:

- No custom `PermissionSet` object is currently defined in the workspace.
- The project references an `Employee Gender` enum, which must be available from the project or a dependency for compilation.
- The role center object and page extension shown in the workspace are currently commented out.

## Support & Contributions

Report issues through your normal project tracking process with a clear description of the record type, status, and expected versus actual behavior. Contributions should follow the existing AL object naming conventions, preserve the current approval flow, and include validation in Business Central before submission.

## License

Copyright © 2026 Levi. All rights reserved unless a separate license file is added to this repository.

This extension does not currently declare a formal open-source license in `app.json`.