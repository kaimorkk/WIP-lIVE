// page 50226 "Organization Development Role"
// {
//     Caption = 'Organization Development Role ';
//     PageType = RoleCenter;

//     layout
//     {
//         area(rolecenter)
//         {

//             part("HR OD Activities Cue"; "HR OD Activities Cue")
//             {
//                 // Caption = 'HUMAN RESOURCE ACTIVITIES';
//                 ApplicationArea = Basic, Suite;
//             }
//             part("HR Activities Cue"; "HR Activities Cue")
//             {
//                 Caption = 'HUMAN RESOURCE ACTIVITIES';
//                 ApplicationArea = Basic, Suite;
//             }
//             part(ApprovalsActivities; "Approvals Activities")
//             {
//                 ApplicationArea = Suite;
//             }
//         }
//     }
//     actions
//     {
//         area(Sections)
//         {

//             group("Employee Management")
//             {

//                 action("Employees12")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'All Employees';
//                     RunObject = page "Employee List-HR";
//                 }
//                 action("Emp12")
//                 {
//                     Caption = 'Attachee List';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Attachee List";
//                 }

//                 action("Emp14")
//                 {
//                     Caption = 'Intern List';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Intern List";
//                 }
//                 action("Emp15")
//                 {
//                     Caption = 'Judges List';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Judges List";
//                 }
//                 action("Emp16")
//                 {
//                     Caption = 'Judicial Officers';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Judicial Officers";
//                 }
//                 action("Emp17")
//                 {
//                     Caption = 'Judicial Staff';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Judicial Staff";
//                 }
//                 action("Emp18")
//                 {
//                     Caption = 'Pupillage Officers';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Pupillage Officers";
//                 }

//                 action("Emp19")
//                 {
//                     Caption = 'Temporary Employees';
//                     ApplicationArea = BasicHR;
//                     RunObject = page "Temporary Employees";
//                 }
//                 action("Employee List-Casual")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Employee List-Casual';
//                     RunObject = page "Casual Employees List";

//                 }

//                 group("Reports2")
//                 {
//                     Caption = 'Reports and Analysis';
//                     action("Employee List Per Region/Towns")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee List Per Region/Towns';
//                         RunObject = page "Employee List";
//                     }
//                     action("Employee - Absences by Causes1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Absences by Causes';
//                         //   RunObject = report "Employee - Absences by Causes";
//                     }
//                     action("Employee - Addresses1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Addresses';
//                         RunObject = report "Employee - Addresses";
//                     }
//                     action("Employee - Alt. Addresses1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Alt. Addresses';
//                         RunObject = report "Employee - Alt. Addresses";
//                     }
//                     action("Employee - Birthdays1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Birthdays';
//                         RunObject = report "Employee - Birthdays";
//                     }
//                     action("Employee - Confidential Info.1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Confidential Info.';
//                         RunObject = report "Employee - Confidential Info.";
//                     }
//                     action("Employee - Contracts1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Contracts';
//                         RunObject = report "Employee - Contracts";
//                     }
//                     action("Employee - Labels1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Labels';
//                         RunObject = report "Employee - Labels";
//                     }
//                     action("Employee - List1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee List';
//                         RunObject = report "Employee - List";
//                     }
//                     action("Employee - Misc. Article Info.1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Misc. Article Info.';
//                         RunObject = report "Employee - Misc. Article Info.";
//                     }
//                     action("Employee - Qualifications1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Qualifications';
//                         RunObject = report "Employee - Qualifications";
//                     }
//                     action("Employee - Relatives1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Relatives';
//                         RunObject = report "Employee - Relatives";
//                     }
//                     action("Employee - Staff Absences1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Staff Absences';
//                         // RunObject = report "Employee - Staff Absences";
//                     }
//                     action("Employee - Unions1")
//                     {
//                         ApplicationArea = BasicHR;
//                         Caption = 'Employee Unions';
//                         RunObject = report "Employee - Unions";
//                     }

//                 }
//             }
//             group("Establishment")
//             {
//                 Caption = 'Organization Structure';
//                 action("Organization Hierarchy")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Administrative Organization Structure';
//                     RunObject = page "Organization Hierarchy List";
//                     RunPageView = where("Structure Type" = filter(Administrative));
//                 }
//                 action("Organization Hierarchys")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Functional Organization Structure';
//                     RunObject = page "Organization Hierarchy Functi";
//                     RunPageView = where("Structure Type" = filter(Functional));
//                 }
//             }
//             group("Staff Establishmentd")
//             {
//                 Caption = 'Staff Establishment';
//                 action("Positions1")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Positions';
//                     RunObject = page "Positions";
//                 }

//                 action("Global Staff Establishment")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Global Staff Establishment';
//                     RunObject = page "Staff Establishment Plans";
//                     RunPageView = where("Establishment Type" = filter(Global));
//                 }
//                 action("Functional Staff Establishment")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Functional Staff Establishment';
//                     RunObject = page "Functional Establishment Plan";
//                     RunPageView = where("Establishment Type" = filter(Functional));

//                 }
//             }
//             group("Implementing Units")
//             {
//                 Caption = 'Implementing Units';
//                 action("Board1")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Court Stations';
//                     RunObject = page "Court Station";
//                 }
//                 action("Legal Entities")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Legal Entities';
//                     RunObject = page "Legal Entity List";
//                 }
//                 action("Directorates1")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Directorates';
//                     RunObject = page "Directorate List";
//                 }
//                 action("Departments")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Departments';
//                     RunObject = page "Department List";
//                 }
//                 action("Regions List")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Counties List';
//                     RunObject = page "Regions List";
//                 }
//                 action("Centers")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Offices';
//                     RunObject = page "Center List";
//                 }
//                 action("Sections1")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Units';
//                     RunObject = page "Section List";
//                 }

//                 action("Duty Station")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Duty Station';
//                     RunObject = page "Duty Station";
//                 }
//                 action("Terms of Service")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Terms of Service';
//                     RunObject = page "Terms of Service";
//                 }

//                 action("Employee Work Shift")
//                 {
//                     Visible = false;
//                     ApplicationArea = BasicHR;
//                     Caption = 'Employee Work Shift';
//                     RunObject = page "Employee Work Shift";
//                 }
//                 action("Commitee Types")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Commitee Types';
//                     RunObject = page "Commitee Types";
//                     Visible = false;
//                 }
//                 action("Domain Area")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Domain Area';
//                     RunObject = page "Domain Area";
//                     Visible = false;
//                 }
//                 action("HR Committee Appointment")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'HR Committee Appointment List';
//                     RunObject = page "HR Committee Appointment List";
//                     Visible = false;
//                 }
//             }
//             group(JobsManagement)
//             {
//                 Caption = 'Grading Structure';
//                 Image = HumanResources;
//                 action("Jobs Management")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Jobs List';
//                     Image = Employee;
//                     RunObject = Page Positions;
//                     ToolTip = 'List the Jobs.';
//                 }
//                 action("Jobs Grade")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Job Grades';
//                     Image = Employee;
//                     RunObject = Page "Job Grades";
//                     ToolTip = 'List the Jobs.';
//                 }
//                 action("Salary Pointers")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Salary Pointers';
//                     Image = Employee;
//                     RunObject = Page "Salary pointers";
//                     ToolTip = 'List the Jobs.';
//                 }
//                 action("Cadre Details")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Job Cadres';
//                     RunObject = page "Cadre Groups Setup List";
//                     Visible = true;
//                 }
//                 action("Designation Groups")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Designation Groups';
//                     RunObject = page "Designation Groups";
//                 }
//             }
//             group("Reports11")
//             {
//                 caption = 'Reports';

//                 action("Staff Establishment")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Staff Establishment';
//                     RunObject = report "Staff Establishment";
//                 }
//                 action("Detailed Staff Establishment")
//                 {
//                     ApplicationArea = BasicHR;
//                     Caption = 'Detailed Staff Establishment';
//                     RunObject = report "Detailed Staff Establishment";
//                 }

//             }



//         }
//     }

// }
