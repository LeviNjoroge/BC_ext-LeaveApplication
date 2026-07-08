// page 50445 "HR Role Center"
// {
//     PageType = RoleCenter;
//     Caption = 'HR Management';
//     ApplicationArea = All;

//     layout
//     {
//         area(RoleCenter)
//         {
//         }
//     }

//     actions
//     {
//         area(Sections)
//         {
//             group(Employees)
//             {
//                 Caption = 'Employees';

//                 action(EmployeeRegistration)
//                 {
//                     Caption = 'Employee Registration';
//                     Image = Employee;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Employee Registration Card");
//                     end;
//                 }

//                 action(EmployeeList)
//                 {
//                     Caption = 'Registered Employees';
//                     Image = CustomerList;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Registered Employees List");
//                     end;
//                 }
//             }

//             group(Leave)
//             {
//                 Caption = 'Leave';

//                 action(LeaveApplication)
//                 {
//                     Caption = 'Leave Application';
//                     Image = ApplyTemplate;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Leave Application");
//                     end;
//                 }

//                 action(Pending)
//                 {
//                     Caption = 'Pending Applications';
//                     Image = Approvals;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Pending Applications List");
//                     end;
//                 }

//                 action(Approved)
//                 {
//                     Caption = 'Approved Applications';
//                     Image = ReleaseDoc;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Approved Applications List");
//                     end;
//                 }
//             }

//             group(Administration)
//             {
//                 action(Setup)
//                 {
//                     Caption = 'Setup';
//                     Image = Administration;

//                     trigger OnAction()
//                     begin
//                         Page.Run(Page::"Leave Application Setup");
//                     end;
//                 }
//             }
//         }
//     }
// }