page 69375 "Functional Hand Over Vouchers"
{
    CardPageID = "Functional Hand Over Voucher";
    Caption = 'Clearance Forms List';
    Editable = false;
    PageType = List;
    SourceTable = "Employee Exit header";
    SourceTableView = where("Document Type" = const("Hand Over Voucher"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNames; "Employee Names")
                {
                    ApplicationArea = Basic;
                }
                field(ExitMethod; "Exit Method")
                {
                    ApplicationArea = Basic;
                }
                field(JobId; "Job Id")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonsCode; "Reasons Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

