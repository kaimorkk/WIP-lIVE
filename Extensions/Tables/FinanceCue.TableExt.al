tableextension 90000 "tableextension50134" extends "Finance Cue"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Outstanding Vendor Invoices"(Field 33)".

        field(50001; "Posted Payment Vouchers"; Integer)
        {
            AccessByPermission = TableData Payments = R;
            CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
                                                Posted = const(true)));
            FieldClass = FlowField;
        }
        // field(50002; "Approved Payment Vouchers"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
        //                                         Status = const(Released),
        //                                         Posted = filter(false),
        //                                         banked = filter(false),
        //                                         "Archive Document" = filter(false)));
        //     FieldClass = FlowField;
        // }
        field(50003; "Pending Payment Vouchers"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
                                                Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        // field(50004; "Approved Surrenders"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = const(Surrender),
        //                                         Status = const(Released),
        //                                         Posted = const(false)));
        //     FieldClass = FlowField;
        // }
        // field(50005; "pending Surrenders"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = const(Surrender),
        //                                         Status = const("Pending Approval")));
        //     FieldClass = FlowField;
        // }
        field(50006; "Posted Surrenders"; Integer)
        {
            // CalcFormula = count(Payments where("Payment Type" = const(Surrender),
            //                                     Posted = const(true)));
            // FieldClass = FlowField;
        }
        // field(50007; "Customer with balance"; Integer)
        // {
        //     CalcFormula = count(Customer where(Balance = filter(<> 0)));
        //     FieldClass = FlowField;
        // }
        // field(50008; "Vendors with Balance"; Integer)
        // {
        //     CalcFormula = count(Vendor where(Balance = filter(<> 0)));
        //     FieldClass = FlowField;
        // }
        // field(50009; "Pending Fin Copyright Works"; Integer)
        // {
        //     CalcFormula = count("Copyright Registration Table" where(Invoiced = const(false),
        //                                                               Status = const(Pending)));
        //     FieldClass = FlowField;
        // }
        // field(50010; "Pending Purchase Invoices"; Integer)
        // {
        //     CalcFormula = count("Purchase Header" where(Status = filter(Released),
        //                                                  "Document Type" = filter(Invoice)));
        //     FieldClass = FlowField;
        // }
        // field(50011; "Approved Staff Claims"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
        //                                         Status = const(Released),
        //                                         Posted = const(false)));
        //     FieldClass = FlowField;
        // }
        // field(50012; "Unprocessed Staff Claims"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
        //                                         Status = const(Released),
        //                                         Posted = const(true),
        //                                         "Payment processed" = const(false)));
        //     FieldClass = FlowField;
        // }
        // field(50013; "Requests to Approve-Overdue"; Integer)
        // {
        //     // CalcFormula = count("Approval Entry" where ("Approver ID"=field("User ID Filter"),
        //     //                                             Status=filter(Open),
        //     //                                             "Due Date"=field("Overdue Date Filter")));
        //     Caption = 'Requests to Approve';
        //     FieldClass = FlowField;
        // }
        // field(50014; "Imprest Requisition-Aproved"; Integer)
        // {
        //     // CalcFormula = count(Payments where (Status=const(Released),
        //     //                                     "Document Type"=filter(Imprest),
        //     //                                     "Created By"=field("User ID Filter")));
        //     FieldClass = FlowField;
        // }
        // field(50015; "Imprest Memo-Approved"; Integer)
        // {
        //     DataClassification = CustomerContent;
        // }
        // field(50016; "Imprest Surender-Approved"; Integer)
        // {
        //     DataClassification = CustomerContent;
        // }
        // field(50017; "Approved Leave"; Integer)
        // {
        //     CalcFormula = count("HR Leave Application" where(Posted = const(false),
        //                                                       Status = const(Released)));
        //     FieldClass = FlowField;
        // }
        // field(50018; "Leave Application-Approved"; Integer)
        // {
        //     CalcFormula = count("HR Leave Application" where(Status = const(Released),
        //                                                       Posted = const(false)));
        //     FieldClass = FlowField;
        // }
        // field(50019; "Approved Salary Vouchers"; Integer)
        // {
        //     CalcFormula = count("Payroll Header" where(Status = const(Released)));
        //     FieldClass = FlowField;
        // }
        // field(50020; "Approved Warrant Vouchers"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = filter("Warrant Voucher"),
        //                                         Status = filter(Released),
        //                                         Posted = filter(false)));
        //     FieldClass = FlowField;
        // }
        // field(50021; "Approved Payment Schedules"; Integer)
        // {
        //     CalcFormula = count(Payments where("Payment Type" = filter("Payment Schedule"),
        //                                         Status = filter(Released),
        //                                         Posted = filter(false)));
        //     FieldClass = FlowField;
        // }
        // field(50022; "Pending Imprest Refunds"; Integer)
        // {
        //     DataClassification = CustomerContent;
        // }
        // field(85000; "Registration Pending Approval"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = filter(Registration),
        //                                                            "Approval Status" = filter(Open),
        //                                                            Portal = filter(true),
        //                                                            Posted = filter(false),
        //                                                            "Application Invoice" = filter(<> ' ')));
        //     FieldClass = FlowField;
        // }
        // field(85001; "Exemption Pending Approval"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = filter(Exemption),
        //                                                            "Approval Status" = filter(Open),
        //                                                            Portal = filter(true),
        //                                                            Posted = filter(false)));
        //     FieldClass = FlowField;
        // }
        // field(85002; "Rejected Registrations"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = filter(Registration),
        //                                                            "Approval Status" = filter(Rejected)));
        //     FieldClass = FlowField;
        // }
        // field(85003; "Rejected Exemptions"; Integer)
        // {
        //     DataClassification = CustomerContent;
        // }
        // field(85004; "Processed Registrations"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = filter(Registration),
        //                                                            "Approval Status" = filter(Open),
        //                                                            Posted = filter(true)));
        //     FieldClass = FlowField;
        // }
        // field(85005; "Processed Exemptions"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = filter(Exemption),
        //                                                            "Approval Status" = filter(Open),
        //                                                            Posted = filter(true)));
        //     FieldClass = FlowField;
        // }
        // field(85006; "Pending Withdrawal Payments"; Integer)
        // {
        //     CalcFormula = count("Student Processing Header" where("Document Type" = const(Withdrawal),
        //                                                            Posted = const(true),
        //                                                            "Payment Created" = const(false),
        //                                                            "Approval Status" = const(Open)));
        //     FieldClass = FlowField;
        // }
    }
}

