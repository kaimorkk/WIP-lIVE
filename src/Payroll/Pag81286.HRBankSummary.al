page 52193727 "HR Bank Summary"
{
    PageType = List;
    SourceTable = "HR Bank Summary"; //Export 

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Line No."; "Line No.")
                {
                    ApplicationArea = all;
                }
                field(StaffNo; "No.")
                {
                    ApplicationArea = All;
                }



                field("Staff Bank Name"; "Staff Bank Name")
                {
                    Caption = 'Staff Name';
                    ApplicationArea = All;
                }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = All;
                }
                field(BankName; "Bank Name")
                {
                    ApplicationArea = All;
                }
                field(BranchCode; "Branch Code")
                {
                    ApplicationArea = All;
                }
                field(BranchName; "Branch Name")
                {
                    ApplicationArea = All;
                }

                field("Bank and Branch Code"; "Bank and Branch Code")
                {
                    ApplicationArea = all;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field(PayrollPeriod; "Payroll Period")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

