page 69370 "Employee Exit Vouchers"
{
    CardPageID = "Employee Exit Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Employee Exit header";
    SourceTableView = where("Document Type" = const("Exit Voucher"));

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

