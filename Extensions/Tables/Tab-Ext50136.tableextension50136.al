
tableextension 50136 "tableextension50136" extends "Job Cue"
{
    fields
    {
        field(50000; "Imprest Requisition-Aproved"; Integer)
        {
            // CalcFormula = count(Payments where(Status = const(Released),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50001; "Imprest Memo-Approved"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Imprest Surender-Approved"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50003; "Imprest Request-P"; Integer)
        {
            // CalcFormula = count(Payments where(Status = const(Released),
            //                                     Posted = const(true),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50004; "Imprest Request-Inprocess"; Integer)
        {
            // CalcFormula = count(Payments where(Status = filter(Open | "Pending Approval"),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50005; "Imprest Surrender-P"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Imprest Surender-Inprocess"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Imprest memo-P"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Imprest Memo-inprocess"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Imprest memo surr-inprocess"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Active Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = filter(Active)));
            FieldClass = FlowField;
        }
        field(50011; "Terminated Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Terminated)));
            FieldClass = FlowField;
        }
        field(50012; "Inactive Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Inactive)));
            FieldClass = FlowField;
        }
        field(50016; "Approved Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Posted = const(false),
                                                              Status = const(Released)));
            FieldClass = FlowField;
        }
        field(50017; "Posted Approved Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Posted = const(true)));
            FieldClass = FlowField;
        }
        field(50018; "Suspended Employees"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Seconded Employees"; Integer)
        {
            CalcFormula = count(Employee where("Employement Terms" = filter(Seconded)));
            FieldClass = FlowField;
        }
        field(50021; "Imprest memo Surr-A"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Imprest memo Surr-p"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Leave Application-Inprocess"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = filter(Open | "Pending Approval"),
                                                              "User ID" = field("User ID Filter")));
            FieldClass = FlowField;
        }
        field(50025; "Leave Application-Approved"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = const(Released),
                                                              Posted = const(false)));
            FieldClass = FlowField;
        }
        field(50027; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve-Overdue';
            FieldClass = FlowField;
        }
        field(50028; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
        field(50033; "Salary Vouchers"; Integer)
        {
            CalcFormula = count("Payroll Header" where(Status = filter(Open | "Pending Approval")));
            FieldClass = FlowField;
        }
        field(50034; "Approved Salary Vouchers"; Integer)
        {
            CalcFormula = count("Payroll Header" where(Status = const(Released)));
            FieldClass = FlowField;
        }
        field(50035; Visitors; Integer)
        {
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50036; "Deployed Employees"; Integer)
        {
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50038; "Asigned ICT Requests"; Integer)
        {
            CalcFormula = count("ICT Helpdesk" where(Status = const(Pending)));
            FieldClass = FlowField;
        }
        field(50039; "Pending ICT Requests"; Integer)
        {
            CalcFormula = count("ICT Helpdesk" where(Status = const(Open)));
            FieldClass = FlowField;
        }
        field(50040; "HOD ICT Requests"; Integer)
        {
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50041; "Pending Approval Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
        }
        field(50042; "Retired Employees"; Integer)
        {
            // CalcFormula = count(Employee where (Status=const(Retired)));
            FieldClass = FlowField;
        }
        field(50043; "Disciplinary Employees"; Integer)
        {
            ///  CalcFormula = count(Employee where (Status=const("Under Disciplinary Action")));
            FieldClass = FlowField;
        }
        field(50044; "Approved Staff Claims"; Integer)
        {
            // CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
            //                                     Status = const(Released),
            //                                     Posted = const(false)));
            // FieldClass = FlowField;
        }
        field(50045; "Unprocessed Staff Claims"; Integer)
        {
            // CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
            //                                     Status = const(Released),
            //                                     Posted = const(true),
            //                                     "Payment processed" = const(false)));
            // FieldClass = FlowField;
        }
        field(50046; "Requests to Approve-Overdue"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open),
                                                        "Due Date" = field("Overdue Date Filter")));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(50047; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(50048; "Approved Warrant Vouchers"; Integer)
        {
            // CalcFormula = count(Payments where("Payment Type" = filter("Warrant Voucher"),
            //                                     Status = filter(Released)));
            // FieldClass = FlowField;
        }
        field(50049; "Approved Payment Vouchers"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = filter("Payment Voucher"),
                                                Status = filter(Released)));
            FieldClass = FlowField;
        }
    }
}

